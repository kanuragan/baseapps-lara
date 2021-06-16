<?php

namespace App\Models;

use App\Models\User;
use App\Models\Location;
use App\Models\UserActivity;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Assignment extends Model
{
    use HasFactory;

    protected $table      = 'assignments';

    protected $primaryKey = 'assignment_id';

    protected $fillable = [
        'location_id',
        'user_id',
        'assignment_name',
        'day',
        'status',
    ];

    protected $casts = [
        'created_at',
        'updated_at'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    public function useractivity()
    {
        return $this->hasOne(UserActivity::class, 'assignment_id')->orderBy('user_activity_id', 'DESC');
    }
    public function location()
    {
        return $this->belongsTo(Location::class, 'location_id');
    }
}
