<?php

namespace App\Admin\Controllers;

use App\Models\CourseType;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Encore\Admin\Tree;

class CourseTypeController extends AdminController
{
    protected $title ='Course Types';

    public function index(Content $content)
    {
        $tree = new Tree(new CourseType);
        return $content->header('Course Types')
        ->body($tree);
    }

  

    protected function detail($id)
    {
        $show = new Show(CourseType::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('Category'));
        $show->field('description', __('Description'));
        $show->field('order', __('Order'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    protected function form()
    {
        $form = new Form(new CourseType());

        $form->select('parent_id',__('Parent Category'))->options((new CourseType())::selectOptions(rootText:"Select Option"));
        $form->text('title', __('Category'));
        $form->textarea('description', __('Description'));
        $form->number('order',__('Order'));

        return $form;
    }
}
