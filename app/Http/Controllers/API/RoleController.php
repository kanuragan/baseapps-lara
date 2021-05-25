<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Role;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    public function roles(){
        $role = Role::all();
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $role,
        ], 200);
    }
}
