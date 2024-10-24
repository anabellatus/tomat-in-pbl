<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;

    protected $table = 'roles'; // Nama tabel jika berbeda
    protected $fillable = ['role_name'];

    public function users()
    {
        return $this->hasMany(AppUser::class, 'role_id', 'role_id'); // Relasi ke AppUser
    }
}
