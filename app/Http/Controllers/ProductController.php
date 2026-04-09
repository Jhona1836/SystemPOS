<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Traits\ApiRespuesta;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    use ApiRespuesta;

    // GET /api/products — listar todos
    public function index()
    {
        $productos = Product::with('categoria')
            ->get();
        // with('categoria') 👆 trae la categoría de cada producto
        //                      en la misma consulta

        return $this->exitoso($productos);
    }

    // POST /api/products — crear nuevo(s)
    public function store(Request $request)
    {
        $data = $request->all();

        if ($request->isMethod('post') && is_array($data) && isset($data[0])) {
            foreach ($data as $productData) {
                $validator = validator($productData, [
                    'nombre' => 'required|string',
                    'precioVenta' => 'required|numeric|min:0.01',
                    'precioCosto' => 'required|numeric|min:0.01',
                    'stock' => 'required|integer|min:0',
                    'stockMinimo' => 'required|integer|min:0',
                    'category_id' => 'required|exists:categories,id',
                    'iva' => 'sometimes|integer|in:0,12,16',
                    'activo' => 'boolean',
                ]);

                if ($validator->fails()) {
                    return $this->error($validator->errors()->first());
                }

                if (! isset($productData['iva'])) {
                    $productData['iva'] = 12;
                }

                Product::create($productData);
            }

            return $this->exitoso(null, 'Productos creados correctamente', 201);
        }

        $request->validate([
            'nombre' => 'required|string',
            'precioVenta' => 'required|numeric|min:0.01',
            'precioCosto' => 'required|numeric|min:0.01',
            'stock' => 'required|integer|min:0',
            'stockMinimo' => 'required|integer|min:0',
            'category_id' => 'required|exists:categories,id',
            'iva' => 'sometimes|integer|in:0,12,16',
            'activo' => 'boolean',
        ]);

        $request->mergeIfMissing(['iva' => 12]);

        $producto = Product::create($request->all());

        return $this->exitoso($producto, 'Producto creado correctamente', 201);
    }

    // GET /api/products/{id} — ver uno
    public function show(Product $product)
    {
        return $this->exitoso($product->load('categoria'));
        // load() 👆 carga la categoría del producto
    }

    // PUT /api/products/{id} — actualizar
    public function update(Request $request, Product $product)
    {
        $request->validate([
            'nombre' => 'sometimes|string',
            'precioVenta' => 'sometimes|numeric|min:0.01',
            'precioCosto' => 'sometimes|numeric|min:0.01',
            'stock' => 'sometimes|integer|min:0',
            'stockMinimo' => 'sometimes|integer|min:0',
            'categoryId' => 'sometimes|exists:categories,id',
            'iva' => 'sometimes|in:0,8,16',
            'activo' => 'boolean',
        ]);

        $product->update($request->all());

        return $this->exitoso($product, 'Producto actualizado correctamente');
    }

    // DELETE /api/products/{id} — eliminar
    public function destroy(Product $product)
    {
        $product->delete();

        return $this->exitoso(null, 'Producto eliminado correctamente');
    }
}
