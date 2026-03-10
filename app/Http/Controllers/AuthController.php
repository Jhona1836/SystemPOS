<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login (Request $request){
        $request-> validate([
            'email' => 'required|email',
            'password' => 'required|string'
        ]);


        $user = User::where('email', $request->email)->first();

        if(!$user || !Hash::check($request -> password, $user -> password)){
                return response()->json([
                'message' => 'Credenciales incorrectas'
            ], 401);
        }

        $token = $user->createToken('pos-token')->plainTextToken;

             return response()->json([
            'message' => 'Login exitoso',
            'token'   => $token,
            'user'    => [
                'id'    => $user->id,
                'name'  => $user->name,
                'email' => $user->email,
            ]
        ], 200);
    }

    public function logout(Request $request){
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'message' => 'Sesión cerrada correctamente'
        ], 200);
    }

     public function me(Request $request)
    {
        return response()->json($request->user());
    }
}
