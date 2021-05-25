<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Location;

class Schedule extends Model
{
    use HasFactory;

    protected $table      = 'schedules';

    protected $primaryKey = 'schedule_id';

    protected $fillable = [
        'day',
        'location_id',
        'status',
    ];
	
	public function location()
    {
        return $this->belongsTo(Location::class, 'location_id');
    }
}
