<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Course;
use Illuminate\Http\Request;

class CourseController extends Controller
{
    // course list
    public function courseList()
    {

        try{

            $courses = Course::select(
                'id',
                'title',
                'description',
                'thumbnail',
                'video',
                'price',
                'lesson_num',
                'video_length',
                'follow',
                'score',
    
            )->get();
            return response()->json(['code' => 200, 'msg' => 'This is the course list', 'data' => $courses], 200);
        }catch (\Throwable $th) {
            return response()->json([
                'code' => 500,
                'message' => 'Ops! An error occurred, it is either the server error or syntax or field is invalid. Please try again!',
                'data'=>$th->getMessage(),
            ], 500);
        }

       
    }


    // course details
    public function courseDetails(Request $request)
    {

        $id =  $request->id;

        try{

            $courses = Course::where('id','=',$id)->select(
                'id',
                'title',
                'user_token',
                'description',
                'thumbnail',
                'video',
                'price',
                'lesson_num',
                'video_length',
                'follow',
                'score',
    
            )->get();
            return response()->json(['code' => 200, 'msg' => 'This is the course list', 'data' => $courses], 200);
        }catch (\Throwable $th) {
            return response()->json([
                'code' => 500,
                'message' => 'Ops! An error occurred, it is either the server error or syntax or field is invalid. Please try again!',
                'data'=>$th->getMessage(),
            ], 500);
        }

       
    }


    
}
