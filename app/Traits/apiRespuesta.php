<?php

namespace App\Traits;

use Illuminate\Http\JsonResponse;

trait ApiRespuesta
{
    public function exitoso($datos = null, string $mensaje = 'Operación exitosa', int $codigo = 200): JsonResponse
    {

        return response()->json([
            'exito' => true,
            'mensaje' => $mensaje,
            'datos' => $datos,
        ], $codigo);
    }

    public function fallido(string $mensaje = 'Error en la operación', $errores = null, int $codigo = 500): JsonResponse
    {

        return response()->json([
            'exito' => false,
            'mensaje' => $mensaje,
            'errores' => $errores,
        ], $codigo);
    }

    public function error(string $mensaje = 'Error', int $codigo = 422): JsonResponse
    {
        return response()->json([
            'exito' => false,
            'mensaje' => $mensaje,
        ], $codigo);
    }
}
