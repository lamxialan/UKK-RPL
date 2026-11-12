<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Tool;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        User::create(['name' => 'Admin', 'email' => 'admin@sekolah.test', 'password' => 'password', 'role' => 'admin']);
        User::create(['name' => 'Petugas', 'email' => 'petugas@sekolah.test', 'password' => 'password', 'role' => 'petugas']);
        User::create(['name' => 'Rina', 'email' => 'siswa@sekolah.test', 'password' => 'password', 'role' => 'peminjam']);

        $elektronik = Category::create(['name' => 'Elektronik']);
        $jaringan = Category::create(['name' => 'Jaringan']);

        Tool::create(['category_id' => $elektronik->id, 'code' => 'ELK-01', 'name' => 'Proyektor', 'stock' => 3]);
        Tool::create(['category_id' => $elektronik->id, 'code' => 'ELK-02', 'name' => 'Laptop', 'stock' => 10]);
        Tool::create(['category_id' => $jaringan->id, 'code' => 'JRG-01', 'name' => 'Crimping Tool', 'stock' => 15]);
    }
}   