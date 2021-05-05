<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;

class LocationController extends Controller
{
    public $successStatus = 200;

    public function getLocations() {
        $limit  = (isset($_GET['limit']) AND !empty($_GET['limit'])) ? $_GET['limit'] : 10;
        $offset = (isset($_GET['offset']) AND !empty($_GET['offset'])) ? $_GET['offset'] : 0;
        $data   = DB::table('locations')
                                ->offset($offset)
                                ->limit($limit)
                                ->get();
        return response()->json(['response' => 'success', 'data'=>$data], $this->successStatus);
    }

    public function getLocationById($location_id) {
        $data = DB::table('locations')
                    ->where('location_id',$location_id)
                    ->get();
        return response()->json(['response' => 'success', 'data'=>$data], $this->successStatus);
    }

    public function createLocation(Request $request) {
        $validator = Validator::make($request->all(), [
            'location_code' => 'required|unique:locations,location_code',
            'location_name' => 'required',
            'lat'           => 'required',
            'lng'           => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['response' => 'error' , 'message'=>$validator->errors()], 401);            
        }
        $input               = $request->all();
        $input['created_at'] = date('Y-m-d H:i');
        $save                = DB::table('locations')->insert($input);
        if($save) {
            return response()->json(['response'=> 'success', 'message' => 'successfully added data'], $this->successStatus);
        }
        return response()->json(['response' => 'error'], 401);
    }
}
