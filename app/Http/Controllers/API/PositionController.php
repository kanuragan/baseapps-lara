<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Position;
use Illuminate\Http\Request;

class PositionController extends Controller
{
    public function positions() {
        $position = Position::with('departement')->get();
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $position,
        ], 200);
    }
}
