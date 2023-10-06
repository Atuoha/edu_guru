<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Course;
use Illuminate\Http\Request;

class CourseController extends Controller
{
    public function courseList()
    {
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
        return response()->json(['code' => 0, 'msg' => 'This is the course list', 'data' => $courses], 200);
    }
}
