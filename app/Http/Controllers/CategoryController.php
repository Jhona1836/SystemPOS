<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Category::all();
    }

    public function store(Request $request){

    $validado = $request->validate([
        'name' => 'required|unique:categories|max:255',
        'description' => 'nullable'
    ]);
    $categoria= Category::create($validado);

    return response() -> json($categoria, 201);

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
    public function update(Request $request, Category $category)
    {
        $data = $request->validate([
        'name' => 'required|string|unique:categories,name,' . $category->id,
        'description' => 'nullable'
    ]);
    $category->update($data);

    return response()->json([
        'message' => 'Categoría actualizada con éxito',
        'data' => $category
    ], 200);
    }


    public function destroy(Category $category)
    {
    $category->delete();
    return response()->json(['message' => 'Eliminado correctamente'], 200);
    }
}
