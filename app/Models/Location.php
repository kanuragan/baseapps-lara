<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    use HasFactory;

    protected $table = 'locations';

    protected $primaryKey = 'location_id';

    protected $fillable = [
        'location_code',
        'lcoation_name',
        'lat',
        'lng',
    ];

    protected $casts = [
        'created_at',
        'updated_at'
    ];
}
