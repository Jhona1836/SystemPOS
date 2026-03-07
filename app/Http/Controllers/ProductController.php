<?php

namespace App\Http\Controllers;

use App\Models\Products;
use Exception;
use Illuminate\Http\Request;
use App\Traits\ApiRespuesta;

use function Laravel\Prompts\error;

class ProductController extends Controller
{
    use ApiRespuesta;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Products::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validate =$request-> validate([
            'sku' => 'required|string|unique:products',
            'name' => 'required|string|max:255',
            'price' => 'required|numeric|min:0',
            'stock' => 'required|integer|min:0',
            'category_id' => 'required|exists:categories,id'
        ]);
        try {
            $product = Products::create($validate);

            return $this->exito('Se creo un producto con exito', $product);
        } catch (Exception $e){
            return $this->error('No se pudo crear el producto', $e);

        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Products $product)
    {
    $data = $request -> validate([
        'price' => 'required|numeric|min:0',
        'stock' => 'required|integer|min:0'
    ]);

        try{
            $product->update($data);
            return $this -> exito('Se actualizo el producto', $product);
        }catch(Exception $e){
            return $this-> error('Hubo un error al actualizar el producto', $e);
        }

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
