<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;

Route::post('/login', [AuthController::class, 'login']);



Route::middleware('auth:sanctum')->group(function () {

    // Sesión
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/me', [AuthController::class, 'me']);
    // /me 👆 útil para que React sepa qué usuario está en sesión

    // Categorías y Productos
    Route::apiResource('categories', CategoryController::class);
    Route::apiResource('products', ProductController::class);
});
