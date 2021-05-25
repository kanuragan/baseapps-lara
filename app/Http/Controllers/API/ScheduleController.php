<?php

namespace App\Http\Controllers\API;

use Validator;
use App\Models\Schedule;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ScheduleController extends Controller
{
    public function getSchedule()
    {
        $data = Schedule::with('location')->latest()->paginate(10);
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $data,
        ], 200);
    }

    public function getScheduleId($sid)
    {
        $data = Schedule::with('location')->find($sid);
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $data,
        ], 200);
    }

    public function createSchedule(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'location_id'     => 'required',
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
        $insertschedule = array(
            'location_id'     => $request->location_id,
            'day'             => $request->day,
            'status'          => $request->status,
        );

        $save = schedule::create($insertschedule);
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

    public function updateSchedule(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'schedule_id'     => 'required',
            'location_id'     => 'required',
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
        $insertschedule = array(
            'location_id'     => $request->location_id,
            'day'             => $request->day,
            'status'          => $request->status,
        );

        $save = Schedule::find($request->schedule_id)
                                ->update($insertschedule);
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
    public function deleteSchedule(Request $request) {
        $delete = Schedule::where('schedule_id',$request->schedule_id)->delete();
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
