<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Course;

class PayController extends Controller
{
    //

    public function checkOut(Request $request)
    {
        $user = $request->user();
        $user_token = $user->token;
        $course_id = $request->id;

        // Stripe::setApiKey('sk_test_51NL6jHI9o5m4jh3ahAdF7GOcX4yXwbUByObehfn90PDWP0RxK8pwpjnbuLXMjOTHGBld08S49T2Zx6zfxPODH91u00o6VOuwA3');


        $course_result = Course::where('id', '=', $course_id)->select('title', 'price', 'user_token')->first();;

        if (empty($course_result)) {
            return response()->json([
                'code' => 400,
                'message' => 'Ops! Course does not exist',
            ], 400);
        }

        return response()->json(['code' => 200, 'msg' => 'Course found', 'data' => $course_result], 200);
    }
}
