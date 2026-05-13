<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('sale_items', function (Blueprint $table){
            $table-> id();
            $table-> foreignId('sale_id')
                ->constrained('sales')
                ->cascadeOnDelete();

            $table-> foreignId('product_id')
                ->constrained('products')
                ->cascadeOnDelete();
            $table-> string('producto_nombre');
            $table -> string('producto_sku');
            $table -> integer('cantidad');
            $table -> decimal('precio_unitario', 12, 2);
            $table -> decimal('iva_rate', 12, 2);
            $table -> decimal('iva_monto', 12, 2);
            $table -> decimal('subtotal', 12, 2);
            $table -> timestamp('created_at')->nullable();
            });

    }

    public function down(): void
    {
        Schema::dropIfExists('sale_items');
    }
};
