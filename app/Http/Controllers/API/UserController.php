<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Validator;

class UserController extends Controller
{
    public function login(){
        if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){
            $user = Auth::user();
            $success['token'] =  $user->createToken('nApp')->accessToken;
            return response()->json([
                'statusCode' => 200,
                'success'    => 1,
                'data'       => [
                    'token' => $success,
                ],
            ], 200);
        }
        else{
            return response()->json([
                'statusCode' => 401,
                'success'    => 0,
                'message'    => 'unauthorized',
            ], 401);
        }
    }
 
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'       => 'required',
            'email'      => 'required|email|unique:users,email',
            'password'   => 'required',
            'c_password' => 'required|same:password',
        ]);
 
        if ($validator->fails()) {
            return response()->json([
                'statusCode' => 401,
                'success'    => 0,
                'message'    => $validator->errors(),
            ], 401);            
        }
 
        $input             = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user              = User::create($input);
        $success['token']  =  $user->createToken('nApp')->accessToken;
        $success['name']   =  $user->name;
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $success,
        ], 200);
    }
 
    public function details()
    {
        $user = Auth::user();
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $user,
        ], 200);
    }
    public function users()
    {
        $user = DB::table('users')->get();
        return response()->json([
            'statusCode' => 200,
            'success'    => 1,
            'data'       => $user,
        ], 200);
    }
}
