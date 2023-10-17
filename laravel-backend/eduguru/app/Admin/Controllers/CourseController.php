<?php

namespace App\Admin\Controllers;

use App\Models\Course;
use App\Models\CourseType;
use App\Models\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Request;



class CourseController extends AdminController
{
    protected $title ='Courses';

    protected function grid()
    {
        $grid = new Grid(new Course());
        $baseUrl = Request::root();

        $grid->column('id', __('Id'));
        $grid->column('user_token', __('Instructor'))->display(function($token){
            return User::where("token", "=",$token)->value('name');
        });
        $grid->column('title', __('Title'));
        $grid->column('type_id', __('Course Category'))->display(function ($type_id){
            return CourseType::where("id","=",$type_id)->value('title');
        });
        $grid->column('thumbnail', __('Thumbnail'))->image( '',50,50);
        $grid->column('description', __('Description'));
        $grid->column('video', __('Video'));
        $grid->column('video_length', __('Video Length'));
        $grid->column('price', __('Price'));
        $grid->column('score', __('Score'));
        $grid->column('follow', __('Follow'));
        $grid->column('lesson_num', __('Number of Lessons'));
        $grid->column('download_resources', __('Number of download resources'));
        $grid->column('created_at', __('Created at'));

        return $grid;
    }

    protected function detail($id)
    {
        $show = new Show(Course::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('Title'));
        $show->field('type_id', __('Course Category'));
        $show->field('thumbnail', __('Thumbnail'))->image('',150,150);
        $show->field('description', __('Description'));
        $show->field('video', __('Video'));
        $show->field('video_length', __('Video Length'));
        $show->field('price', __('Price'));
        $show->field('score', __('Score'));
        $show->field('follow', __('Follow'));
        $show->field('lesson_num', __('Number of Lessons'));
        $show->field('download_resources', __('Number of download resources'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    protected function form()
    {
        $form = new Form(new Course());

        $form->text('title', __('Title'));
        $result = CourseType::pluck('title','id');

        $form->select('type_id', __('Course Category'))->options($result);
        $form->image('thumbnail', __('Thumbnail'))->uniqueName();
        $form->textarea('description', __('Description'));
        $form->decimal('price', __('Price'));
        $form->file('video', __('Video'))->uniqueName();
        $form->number('video_length', __('Video Length'));
        $user = User::pluck('name', 'token');
        $form->select('user_token', __('Instructor'))->options($user);
        $form->number('lesson_num', __('Number of Lessons'));
        $form->number('download_resources', __('Number of download resources'));
        $form->display('created_at', __('Created at'));
        $form->display('updated_at', __('Updated at'));
        return $form;
    }
}
