<?php


namespace App\Http\Controllers\API;

use Validator;
use App\Models\User;
use App\Models\Profile;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Laravel\Passport\TokenRepository;
use Illuminate\Http\Exceptions\HttpResponseException;

class AuthController extends Controller
{
    public function refresh_token(Request $request) {
         $response = Http::asForm()->post('http://localhost/baseapps-lara/oauth/token', [
                'grant_type'    => 'refresh_token',
                'refresh_token' => $request->refresh_token,
                'client_id'     => $request->client_id,
                'client_secret' => $request->client_secret,
                'scope' => '',
        ]);

        return response()->json([
                'statusCode' => 200,
                'success'    => 1,
                'data'       => $response->json(),
        ], 200);
    }
    public function login(Request $request){
        $response = Http::asForm()->post('http://localhost/baseapps-lara/oauth/token', [
                'grant_type'    => 'password',
                'client_id'     => request('client_id'),
                'client_secret' => request('client_secret'),
                'username'      => request('username'),
                'password'      => request('password'),
                'scope'         => '',
        ]);
        
        if(isset($response->json()['error'])) {
            return response()->json([
                'statusCode' => 401,
                'success'    => 0,
                'message'    => 'Failed',
            ], 401); 
        }

        return response()->json([
                'statusCode' => 200,
                'success'    => 1,
                'data'       => $response->json(),
        ], 200);   
        
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'position_id'=> 'required',
            'role_id'    => 'required',
            'idcard'     => 'required|unique:users,idcard',
            'username'   => 'required|unique:users,username',
            'email'      => 'required|email|unique:users,email',
            'name'       => 'required',
            'password'   => 'required',
            'status'     => 'required',
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

        DB::beginTransaction();
        try {
            $inputUser = array(
                'position_id'   => $request->position_id,
                'role_id'       => $request->role_id,
                'idcard'        => $request->idcard,
                'username'      => $request->username,
                'email'         => $request->email,
                'name'          => $request->name,
                'password'      => bcrypt($request->password),
                'status'        => $request->status,
            );         
            $user    = User::create($inputUser);
            $inputProfile = array(
                'user_id' => $user->id,
            );
            $profile = Profile::create($inputProfile);
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
    
    public function revoke(Request $request) {
        $request->user()->token()->revoke();
        return response()->json([
            'statusCode' => 200,
            'success'    => 0,
            'data'       => 'Unauthorized !',
        ], 200);
    }   
}
