<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Traits\ApiRespuesta;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    use ApiRespuesta;

    // GET /api/categories
    public function index()
    {
        $categorias = Category::with('productos')->get();

        return $this->exitoso($categorias);
    }

    // POST /api/categories
    public function store(Request $request)
    {
        $validado = $request->validate([
            'nombre' => 'required|unique:categories,nombre|max:255',
            'descripcion' => 'nullable|string',
            'activo' => 'boolean',
        ]);

        $categoria = Category::create($validado);

        return $this->exitoso($categoria, 'Categoría creada correctamente', 201);
    }

    // GET /api/categories/{id}
    public function show(Category $category)
    {
        return $this->exitoso($category);
    }

    // PUT /api/categories/{id}
    public function update(Request $request, Category $category)
    {
        $validado = $request->validate([
            'nombre' => 'sometimes|string|unique:categories,nombre,'.$category->id,
            'descripcion' => 'nullable|string',
            'activo' => 'boolean',
        ]);

        $category->update($validado);

        return $this->exitoso($category, 'Categoría actualizada correctamente');
    }

    // DELETE /api/categories/{id}
    public function destroy(Category $category)
    {
        $category->delete();

        return $this->exitoso(null, 'Categoría eliminada correctamente');
    }
}
