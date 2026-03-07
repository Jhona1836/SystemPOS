<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

// apiResource me sirve para que laravel identifique en automatico a que metodo pertenece, de
// esta manera evito manejar los diferentes metodos,
Route::apiResource('categories', CategoryController::class);
Route::apiResource('products', ProductController::class );
