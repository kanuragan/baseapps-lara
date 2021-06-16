<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Departement extends Model
{
    use HasFactory;

    protected $primaryKey = 'departement_id';
    protected $casts = [
        'created_at',
        'updated_at'
    ];
}
