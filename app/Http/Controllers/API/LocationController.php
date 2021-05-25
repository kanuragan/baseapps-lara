<?php

namespace App\Http\Controllers\API;

use Validator;
use App\Models\Location;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class LocationController extends Controller
{
    public $successStatus = 200;

    public function getLocations() {
        $location = Location::latest()->paginate(10);
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $location,
        ], 200);
    }
    public function getLocationId($lid) {
        $location = Location::find($lid);
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $location,
        ], 200);
    }
	
	public function getMarker() {
        $location = Location::all();
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $location,
        ], 200);
    }

    public function createLocation(Request $request) {
        $validator = Validator::make($request->all(), [
            'location_code' => 'required|unique:locations,location_code',
            'location_name' => 'required',
            'lat'           => 'required',
            'lng'           => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'statusCode' => 400,
                'success'    => 0,
                'message'    => $validator->errors(),
            ], 400);           
        }
        $input               = $request->all();
        $input['created_at'] = date('Y-m-d H:i');
        $save                = DB::table('locations')->insert($input);
        if($save) {
            return response()->json([
                'statusCode' => 200,
                'success'    => 1,
                'message'    => 'successfully added data',
            ], 200); 
        }
        return response()->json([
            'statusCode' => 400,
            'success'    => 0,
            'message'    => 'failed',
        ], 400); 
    }

    public function updateLocation(Request $request) {
        $validator = Validator::make($request->all(), [
            'location_code' => 'required|max:8|unique:locations,location_code,'.$request->location_id. ',location_id',
            'location_name' => 'required',
            'lat'           => 'required',
            'lng'           => 'required',
        ]);
 
        if ($validator->fails()) {
            return response()->json([
                'statusCode' => 401,
                'success'    => 0,
                'message'    => $validator->errors(),
            ], 401);            
        }

        $locationUpdate = array(
                'location_code' => $request->location_code,
                'location_name' => $request->location_name,
                'lat'           => $request->lat,
                'lng'           => $request->lng,
        );
        $user       = Location::where('location_id',$request->location_id)
                                ->update($locationUpdate);
        if($user) {
            return response()->json([
                'statusCode' => 200,
                'success'    => 1,
                'data'       => 'success update data',
            ], 200);
        }

        return response()->json([
            'statusCode' => 401,
            'success'    => 0,
            'message'    => 'failed',
        ], 401);
    }
    public function deleteLocation(Request $request) {
        $delete = Location::where('location_id',$request->location_id)->delete();
        if($delete){
            return response()->json([
                'statusCode' => 200,
                'success'    => 1,
                'message'    => 'successfully delete data',
            ], 200);
        } else {
            return response()->json([
                'statusCode' => 400,
                'success'    => 0,
                'message'    => 'failed delete data',
            ], 400);
        }
    }
}
