<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserActivity extends Model
{
    use HasFactory;

    protected $table = 'user_activities';

    protected $primaryKey = 'user_activity_id';

    protected $fillable = [
        'assignment_id',
        'user_id',
        'image',
        'desc',
    ];

    protected $casts = [
        'created_at',
        'updated_at',
    ];
}
