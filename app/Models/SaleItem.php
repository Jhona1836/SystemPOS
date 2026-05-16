<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SaleItem extends Model
{
    protected $table = 'sale_items';

    public $timestamps = false;

    protected $fillable = [
        'sale_id',
        'product_id',
        'producto_nombre',
        'producto_sku',
        'cantidad',
        'precio_unitario',
        'iva_rate',
        'iva_monto',
        'subtotal',
        'created_at',
    ];

    protected function casts(): array
    {
        return [
            'precio_unitario' => 'decimal:2',
            'iva_rate'        => 'decimal:2',
            'iva_monto'       => 'decimal:2',
            'subtotal'        => 'decimal:2',
        ];
    }
}
