<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SalesModel extends Model
{
    protected $table = 'sales';

    protected $fillable = [
        'folio',
        'user_id',
        'payment_method_id',
        'subtotal',
        'iva_total',
        'total',
        'monto_recibido',
        'cambio',
        'estado',
        'notas',
    ];

    protected function casts(): array
    {
        return [
            'subtotal'       => 'decimal:2',
            'iva_total'      => 'decimal:2',
            'total'          => 'decimal:2',
            'monto_recibido' => 'decimal:2',
            'cambio'         => 'decimal:2',
        ];
    }
}
