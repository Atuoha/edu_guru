<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\CourseController;
use App\Http\Controllers\Api\PayController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['namespace'=> 'Api'], function(){
    Route::post('/login','UserController@loginUser');
    Route::post('/register','UserController@createUser');


    Route::group(['middleware'=>['auth:sanctum']], function(){
        Route::any('/courseList',[CourseController::class,'courseList']);
        Route::any('/courseDetails',[CourseController::class,'courseDetails']);
        Route::any('checkOut',[PayController::class,'checkOut']);

    });
});


