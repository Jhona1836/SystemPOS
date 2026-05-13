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
        Schema::create ('sales', function (Blueprint $table){
            $table -> id();
            $table -> string('folio')->unique();
            $table-> foreignId('user_id')
                ->constrained('users')
                ->cascadeOnDelete();
            $table-> foreignId('payment_method_id')
                ->constrained('payment_methods')
                ->cascadeOnDelete();
            $table -> decimal('subtotal', 12 , 2);
            $table -> decimal('iva_total', 12 , 2);
            $table -> decimal ('total', 12, 2);
            $table -> decimal ('monto_recibido', 12, 2);
            $table -> decimal ('cambio', 12, 2);
            $table -> enum('estado', ['completada', 'cancelada']);
            $table -> text('notas') -> nullable();
            $table -> timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sales');
    }
};
