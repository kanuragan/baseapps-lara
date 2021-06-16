<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class UserController extends Controller
{
	public function users()
    {
        $user = User::with('position','role')->latest()->paginate(10);
        $me   = Auth::user();
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $user,
            'me'         => $me,
        ], 200);
    }
    public function userId($user_id)
    {
        $user = User::where('user_id',$user_id)
                        ->join('roles','users.role_id','=','roles.role_id')
                        ->join('positions','users.position_id','=','positions.position_id')
                        ->join('departements','positions.departement_id','=','departements.departement_id')
                        ->get()->first();
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $user,
        ], 200);
    }
    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'position_id'=> 'required',
            'role_id'    => 'required',
            'idcard' => [
                'required',
                Rule::unique('users')->ignore($request->user_id, 'user_id'),
            ],
            'username' => [
                'required',
                Rule::unique('users')->ignore($request->user_id, 'user_id'),
            ],
            'email' => [
                'required',
                Rule::unique('users')->ignore($request->user_id, 'user_id'),
            ],
            'name'   => 'required',
            'status' => 'required',
        ],[
            'required' => 'The :attribute field is required',
            'unique'   => 'The :attribute field is unique',
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

        $updateUser = array(
                'position_id'   => $request->position_id,
                'role_id'       => $request->role_id,
                'idcard'        => $request->idcard,
                'username'      => $request->username,
                'email'         => $request->email,
                'name'          => $request->name,
                'status'        => $request->status,
        );
        $user       = User::where('user_id',$request->user_id)
                                ->update($updateUser);
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
    public function details(Request $request)
    {
        $user = $request->user();
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $user,
        ], 200);
    }
    public function deleteUser(Request $request) {
        DB::beginTransaction();
        try {           
            User::where('user_id',$request->user_id)->delete();
            DB::commit();
            return response()->json([
                'statusCode' => 200,
                'success'    => 1,
                'data'       => 'success',
            ], 200);
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json([
                'statusCode' => 401,
                'success'    => 0,
                'data'       => 'Unauthorized',
            ], 401);
        }
    }
}
