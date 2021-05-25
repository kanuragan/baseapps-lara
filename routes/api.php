<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\RoleController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\LocationController;
use App\Http\Controllers\API\PositionController;
use App\Http\Controllers\API\ScheduleController;
use App\Http\Controllers\API\AssignmentController;

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('refresh_token', [AuthController::class, 'refresh_token']);
Route::post('login', [AuthController::class, 'login']);
Route::group(['middleware' => 'auth:api'], function(){
    //AUTH
    Route::post('register', [AuthController::class, 'register']);
    //user controller
    Route::post('details', [UserController::class, 'details']);
    Route::get('users', [UserController::class, 'users']);
    Route::get('user/{user_id}', [UserController::class, 'userId']);
    Route::post('userupdate', [UserController::class, 'update']);
    Route::post('revoke', [AuthController::class, 'revoke']);
    Route::post('deleteuser', [UserController::class, 'deleteUser']);
    //location controller
    Route::get('locations',[LocationController::class, 'getLocations']);
	Route::get('marker',[LocationController::class, 'getMarker']);
    Route::get('location/{location_id}',[LocationController::class, 'getLocationId']);
    Route::post('addlocation',[LocationController::class, 'createLocation']);
    Route::post('updatelocation',[LocationController::class, 'updateLocation']);
    Route::post('deletelocation',[LocationController::class, 'deleteLocation']);
    //assignment controller
    Route::get('assignment', [AssignmentController::class, 'getAssignment']);
    Route::get('assignment/{aid}', [AssignmentController::class, 'getAssignmentId']);
    Route::post('createassignment', [AssignmentController::class, 'createAssignment']);
    Route::post('updateassignment', [AssignmentController::class, 'updateAssignment']);
    Route::post('deleteassignment', [AssignmentController::class, 'deleteAssignment']);
    //schedule controller
    Route::get('schedule', [ScheduleController::class, 'getSchedule']);
    Route::post('createschedule', [ScheduleController::class, 'createSchedule']);
    Route::post('updateschedule', [ScheduleController::class, 'updateSchedule']);
    Route::get('schedule/{sid}', [ScheduleController::class, 'getScheduleId']);
    Route::post('deleteschedule', [ScheduleController::class, 'deleteschedule']);
    //POSITION
    Route::get('positions', [PositionController::class, 'positions']);
    //ROLE
    Route::get('roles', [RoleController::class, 'roles']);
});
