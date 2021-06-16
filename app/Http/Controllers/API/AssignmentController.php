<?php

namespace App\Http\Controllers\API;

use Validator;
use App\Models\Assignment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;

class AssignmentController extends Controller
{
    public function getAssignment(Request $request)
    {
        $role = $request->role_name;
        $uid  = $request->user_id;
        $data;
        if($role=='admin'){
            $data = Assignment::with('user','location')
                    ->when($request->day!=0, function($q){
                        return $q->whereDate('assignments.day',request('day'));
                    })
                    ->when($request->userids!=0 && $request->userids !='', function($q){
                        return $q->whereHas('user',function(Builder $query){
                            return $query->where('idcard', 'like', request('userids'). '%');
                        });
                    })
                    ->when($request->location!=0 && $request->location !='', function($q){
                        return $q->whereHas('location',function(Builder $query){
                            return $query->where('location_code', 'like', request('location'). '%');
                        });
                    })
                    ->when($request->status!=0, function($q){
                        return $q->where('assignments.status',request('status'));
                    })->latest()->paginate(50);
        } else {
            $data = Assignment::where('user_id',$uid)->with('user','location')
                    ->when($request->day!=0, function($q){
                        return $q->whereDate('assignments.day',request('day'));
                    })
                    ->when($request->userids!=0 && $request->userids !='', function($q){
                        return $q->whereHas('user',function(Builder $query){
                            return $query->where('idcard', 'like', request('userids'). '%');
                        });
                    })
                    ->when($request->location!=0 && $request->location !='', function($q){
                        return $q->whereHas('location',function(Builder $query){
                            return $query->where('location_code', 'like', request('location'). '%');
                        });
                    })
                    ->when($request->status!=0, function($q){
                        return $q->where('assignments.status',request('status'));
                    })->latest()->paginate(50);
        }       
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $data,
        ], 200);
    }
    public function getAssignmentView($aid)
    {
        $data = Assignment::where('assignment_id', $aid)->with('user','location','useractivity')->first();   
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $data,
            'time'       => [
                'useractivity' => $data->useractivity->created_at->toDateTimeString(),
            ],
        ], 200);
    }
    public function countAssignment($role,$uid)
    {
        $num_open;
        $num_visited;
        $num_close;
        $num_cancel;
        if($role=='admin'){
            $open    = Assignment::where('status','open')->with('user','location')->get();
            $visited = Assignment::where('status','visited')->with('user','location')->get();
            $close   = Assignment::where('status','close')->with('user','location')->get();
            $cancel  = Assignment::where('status','cancel')->with('user','location')->get();

            $num_open = count($open); $num_visited = count($visited); $num_close = count($close); $num_cancel = count($cancel);
        } else {
            $open    = Assignment::where(['status'=>'open', 'user_id'=>$uid])->with('user','location')->get();
            $visited = Assignment::where(['status'=>'visited', 'user_id'=>$uid])->with('user','location')->get();
            $close   = Assignment::where(['status'=>'close', 'user_id'=>$uid])->with('user','location')->get();
            $cancel  = Assignment::where(['status'=>'cancel', 'user_id'=>$uid])->with('user','location')->get();

            $num_open = count($open); $num_visited = count($visited); $num_close = count($close); $num_cancel = count($cancel);
        }
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'open'       => $num_open,
            'visited'    => $num_visited,
            'close'      => $num_close,
            'cancel'     => $num_cancel,
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

    public function deleteAssignment(Request $request)
    {
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
