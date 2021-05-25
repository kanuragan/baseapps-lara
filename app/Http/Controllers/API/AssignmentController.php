<?php

namespace App\Http\Controllers\API;

use App\Models\Assignment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;

class AssignmentController extends Controller
{
    public function getAssignment()
    {
        $data = Assignment::with('user','location')->latest()->paginate(10);
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $data,
        ], 200);
    }
    public function getAssignmentId($aid)
    {
        $data = Assignment::with('user','location')->find($aid);
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $data,
        ], 200);
    }
    public function createAssignment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id'         => 'required',
            'location_id'     => 'required',
            'assignment_name' => 'required',
            'day'             => 'required',
            'status'          => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'statusCode' => 400,
                'success'    => 0,
                'message'    => $validator->errors(),
            ], 400);           
        }
        $insertAssignment = array(
            'user_id'         => $request->user_id,
            'location_id'     => $request->location_id,
            'assignment_name' => $request->assignment_name,
            'day'             => $request->day,
            'status'          => $request->status,
        );

        $save = Assignment::create($insertAssignment);
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

    public function updateAssignment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'assignment_id'   => 'required',
            'user_id'         => 'required',
            'location_id'     => 'required',
            'assignment_name' => 'required',
            'day'             => 'required',
            'status'          => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'statusCode' => 400,
                'success'    => 0,
                'message'    => $validator->errors(),
            ], 400);           
        }
        $insertAssignment = array(
            'user_id'         => $request->user_id,
            'location_id'     => $request->location_id,
            'assignment_name' => $request->assignment_name,
            'day'             => $request->day,
            'status'          => $request->status,
        );

        $save = Assignment::find($request->assignment_id)
                                ->update($insertAssignment);
        if($save) {
            return response()->json([
                'statusCode' => 200,
                'success'    => 1,
                'message'    => 'successfully update data',
            ], 200); 
        }
        return response()->json([
            'statusCode' => 400,
            'success'    => 0,
            'message'    => 'failed',
        ], 400); 
    }

    public function deleteAssignment(Request $request) {
        $delete = Assignment::where('assignment_id',$request->assignment_id)->delete();
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
