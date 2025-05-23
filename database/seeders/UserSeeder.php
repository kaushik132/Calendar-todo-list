<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
     public function run()
    {
        User::truncate(); // optional: clear existing

        // 5 dummy users
        for ($i = 1; $i <= 5; $i++) {
            User::create([
                'name' => 'Student ' . $i,
                'email' => 'student' . $i . '@example.com',
                'password' => Hash::make('password'), // default password
            ]);
        }
    }
}
