<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class RolesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $roles = ["administrador", "supervisor", "cajero", "almacenista"];

        foreach ($roles as $rol) {
            Role::firstOrCreate(['name' => $rol]);
        }

        $admin = User::firstOrCreate(
            ['email' => 'admin@tienda.com'],
            [
                'name' => 'Administrador',
                'password' => bcrypt('Admin1234'),
                'activo' => true
            ]
        );

        $admin->assignRole('administrador');
    }
}
