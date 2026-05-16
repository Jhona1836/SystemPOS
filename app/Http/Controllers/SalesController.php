<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SalesModel;
use App\Models\SaleItem;
use App\Models\Product;
use App\Traits\ApiRespuesta;
use Illuminate\Support\Facades\DB;

class SalesController extends Controller
{
    use ApiRespuesta;

    public function index()
    {
        $sales = SalesModel::all();
        return $this->exitoso($sales);
    }

    public function show(SalesModel $sale)
    {
        return $this->exitoso($sale);
    }

    public function store(Request $request)
    {
        if (empty($request->all())) {
            return $this->error('No se han proporcionado datos para crear la venta');
        }

        $request->validate([
            'payment_method_id' => 'required|exists:payment_methods,id',
            'monto_recibido' => 'required|numeric|min:0',
            'notas' => 'nullable|string|max:500',

            'items' => 'required|array|min:1',
            'items.*.product_id' => 'required|exists:products,id',
            'items.*.cantidad' => 'required|integer|min:1',
        ]);

        try {
            $sale = DB::transaction(function () use ($request) {

                $productId = collect($request->items)->pluck('product_id');
                $products = Product::whereIn('id', $productId)->get()->keyBy('id');

                $itemsCalculados = [];
                $subtotalVenta = 0;
                $ivaTotalVenta = 0;

                foreach ($request->items as $item) {
                    $product = $products[$item['product_id']];
                    $cantidad = $item['cantidad'];

                    if ($product->stock < $cantidad) {
                        throw new \Exception("El producto {$product->nombre} no tiene suficiente stock para la cantidad solicitada");
                    }

                    $ivaRate = (int) $product->iva / 100;
                    $precioBase = round($product->precioVenta / (1 + $ivaRate), 4);
                    $ivaMonto = round($product->precioVenta - $precioBase, 4);
                    $subtotal = round($product->precioVenta * $cantidad, 2);
                    $ivaLinea = round($ivaMonto * $cantidad, 2);

                    $subtotalVenta += $subtotal;
                    $ivaTotalVenta += $ivaLinea;

                    $itemsCalculados[] = [
                        'product'         => $product,
                        'cantidad'        => $cantidad,
                        'precio_unitario' => $product->precioVenta,
                        'iva_rate'        => $ivaRate,
                        'iva_monto'       => $ivaLinea,
                        'subtotal'        => $subtotal,
                    ];
                }

                $totalVenta = round($subtotalVenta, 2);
                $montoRecibido = (float) $request->monto_recibido;

                if ($montoRecibido < $totalVenta) {
                    throw new \Exception("El monto recibido es insuficiente para cubrir el total de la venta");
                }

                $cambio = round($montoRecibido - $totalVenta, 2);

                $sale = SalesModel::create([
                    'folio'             => $this->generarFolio(),
                    'user_id'           => $request->user()->id,
                    'payment_method_id' => $request->payment_method_id,
                    'subtotal'          => $subtotalVenta - $ivaTotalVenta,
                    'iva_total'         => $ivaTotalVenta,
                    'total'             => $totalVenta,
                    'monto_recibido'    => $montoRecibido,
                    'cambio'            => $cambio,
                    'estado'            => 'completada',
                    'notas'             => $request->notas,
                ]);

                foreach ($itemsCalculados as $item) {
                    SaleItem::create([
                        'sale_id'         => $sale->id,
                        'product_id'      => $item['product']->id,
                        'producto_nombre' => $item['product']->nombre,
                        'producto_sku'    => $item['product']->sku,
                        'cantidad'        => $item['cantidad'],
                        'precio_unitario' => $item['precio_unitario'],
                        'iva_rate'        => $item['iva_rate'],
                        'iva_monto'       => $item['iva_monto'],
                        'subtotal'        => $item['subtotal'],
                    ]);

                    $item['product']->decrement('stock', $item['cantidad']);
                }

                return $sale;
            });

            return $this->exitoso($sale, 'Venta creada exitosamente');

        } catch (\Exception $e) {
            return $this->error($e->getMessage());
        }
    }

    private function generarFolio(): string
    {
        $ultimo = SalesModel::lockForUpdate()->latest('id')->value('folio');

        if (!$ultimo) {
            return 'VTA-0001';
        }

        $numero = (int) str_replace('VTA-', '', $ultimo);
        return 'VTA-' . str_pad($numero + 1, 4, '0', STR_PAD_LEFT);
    }
}
