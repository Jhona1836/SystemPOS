<?php

namespace App\Traits;

use Illuminate\Http\JsonResponse;

trait ApiRespuesta{
    public function exito( $message, $data = []): JsonResponse {

    return response() -> json([
        'response' => 'True',
        'message' => $message,
        'data' => $data
    ], 201);

    }

    public function error( $message, $data = []): JsonResponse {

    return response() -> json([
        'response' => 'False',
        'message' => $message,
        'error' => $data
    ], 500);

    }
}
