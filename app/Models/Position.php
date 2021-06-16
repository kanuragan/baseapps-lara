<?php

namespace App\Models;

use App\Models\Departement;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Position extends Model
{
    use HasFactory;

    protected $primaryKey = "position_id";
    protected $casts = [
        'created_at',
        'updated_at'
    ];

    public function departement()
    {
        return $this->belongsTo(Departement::class, 'departement_id');
    }
}
