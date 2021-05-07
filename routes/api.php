<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\LocationController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('login', [UserController::class, 'login']);
Route::post('register', [UserController::class, 'register']);

Route::group(['middleware' => 'auth:api'], function(){

    //user controller
    Route::post('details', [UserController::class, 'details']);
    Route::post('users', [UserController::class, 'users']);

    //location controller
    Route::get('locations',[LocationController::class, 'getLocations']);
    Route::get('locations/{location_id}',[LocationController::class, 'getLocationById']);
    Route::post('locations',[LocationController::class, 'createLocation']);

    
});