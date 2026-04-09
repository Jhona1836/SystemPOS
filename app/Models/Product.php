<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'sku',
        'codigoBarras',
        'nombre',
        'descripcion',
        'precioVenta',
        'precioCosto',
        'stock',
        'stockMinimo',
        'unidad',
        'iva',
        'activo',
        'category_id',
    ];

    protected function casts(): array
    {
        return [
            'precioVenta' => 'decimal:2',
            'precioCosto' => 'decimal:2',
            'activo'      => 'boolean',
        ];
    }

    public function categoria()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function tieneStockBajo(): bool
    {
        return $this->stock <= $this->stockMinimo;
    }

    public function estaDisponible(): bool
    {
        return $this->activo && $this->stock > 0;
    }
}
