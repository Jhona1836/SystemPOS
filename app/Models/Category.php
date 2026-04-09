<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [
        'nombre',
        'descripcion',
        'activo',
    ];

    protected function casts(): array
    {
        return [
            'activo' => 'boolean',
        ];
    }

    // Relación: una categoría tiene muchos productos
    public function productos()
    {
        return $this->hasMany(Product::class);
        // hasMany 👆 una categoría puede tener muchos productos
    }
}
