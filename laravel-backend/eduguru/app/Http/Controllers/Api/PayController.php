<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Course;

class PayController extends Controller
{
    //

    public function checkOut(Request $request){
        $user = $request->user();
        $course_id = $request->course_id;
        $course_result = Course::where('id','=',$course_id)->select('title','price','description')->first();;

        if(empty($course_result)){
            return response()->json([
                'code' => 500,
              'message' => 'Ops! Course does not exist',
            ], 500);
        }

        return response()->json(['msg' => $user, 'course' => $course_result]);
    }
}
