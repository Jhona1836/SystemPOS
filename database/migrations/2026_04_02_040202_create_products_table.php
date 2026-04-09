<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();

            $table->string('sku')->unique();
            // unique 👆 RN-P01 no se permiten códigos duplicados

            $table->string('codigoBarras')->nullable()->unique();
            // nullable 👆 no todos los productos tienen código de barras

            $table->string('nombre');

            $table->text('descripcion')->nullable();

            $table->decimal('precioVenta', 12, 2);
            // decimal(12,2) 👆 hasta 12 dígitos con 2 decimales

            $table->decimal('precioCosto', 12, 2)->default(0);

            $table->integer('stock')->default(0);

            $table->integer('stockMinimo')->default(5);
            // 👆 RN-I02 alerta cuando baje de 5 unidades

            $table->enum('unidad', [
                'pieza',
                'kg',
                'litro',
                'caja',
                'paquete'
            ])->default('pieza');

            $table->enum('iva', ['0', '8', '16'])->default('16');
            // 👆 IVA aplicable: 0%, 8% o 16%

            $table->boolean('activo')->default(true);
            // 👆 RN-P03 activo/inactivo

            $table->foreignId('category_id')
                ->constrained('categories')
                ->cascadeOnDelete();

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
