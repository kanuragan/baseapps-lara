<?php
namespace App\Http\Controllers\API;

use Validator;
use App\Models\Assignment;
use App\Models\UserActivity;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Exceptions\HttpResponseException;

class UserActivityController extends Controller
{
    public function createAssignment(Request $request){
        $validator = Validator::make($request->all(), [
            'assignment_id' => 'required',
            'user_id' => 'required',
            'image'   => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'desc'    => 'required',
        ],[
            'required' => 'The :attribute field is required',
        ]);

        if ($validator->fails()) {
            throw new HttpResponseException(
                response()->json([
                    'statusCode' => 400,
                    'success'    => 0,
                    'message'    => $validator->errors(),
                ], JsonResponse::HTTP_UNPROCESSABLE_ENTITY)
            );            
        }

        $nameFile = time() . $request->image->getClientOriginalName();

        $upload = $request->image->storeAs('public/assignment', $nameFile);
        if($upload) {
            DB::beginTransaction();
            try {
                $insert = array(
                    'assignment_id'=> $request->assignment_id,
                    'user_id'      => $request->user_id,
                    'image'        => $nameFile,
                    'desc'         => $request->desc,
                );
                UserActivity::create($insert);
                Assignment::find($request->assignment_id)
                                ->update(['status'=>'visited']);
                DB::commit();
                return response()->json([
                    'statusCode' => 200,
                    'success'    => 1,
                    'message'    => 'successfully added data',
                ], 200);                  
            } catch (\Throwable $th) {
                DB::rollBack();
                return response()->json([
                    'statusCode' => 400,
                    'success'    => 0,
                    'message'    => 'failed',
                ], 400); 
            }
        } else {
            return response()->json([
                'statusCode' => 400,
                'success'    => 0,
                'data'       => 'failed upload file',
            ], 400);
        }
    }
}
