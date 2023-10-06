<?php

namespace App\Admin\Controllers;

use App\Models\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class UserController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Members';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('email', __('Email'));
        $grid->column('email_verified_at', __('Email verified at'));
        $grid->column('password', __('Password'));
        $grid->column('avatar', __('Avatar'))->image('',50,50);
        $grid->column('type', __('Type'));
        $grid->column('open_id', __('Open id'));
        $grid->column('access_token', __('Access token'));
        $grid->column('token', __('Token'));
        $grid->column('phone', __('Phone'));
        $grid->column('deleted_at', __('Deleted at'));
        $grid->column('remember_token', __('Remember token'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

        $grid->disableActions();
        $grid->disableCreateButton();
        $grid->disableExport();

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(User::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('email', __('Email'));
        $show->field('email_verified_at', __('Email verified at'));
        $show->field('password', __('Password'));
        $show->field('avatar', __('Avatar'));
        $show->field('type', __('Type'));
        $show->field('open_id', __('Open id'));
        $show->field('access_token', __('Access token'));
        $show->field('token', __('Token'));
        $show->field('phone', __('Phone'));
        $show->field('deleted_at', __('Deleted at'));
        $show->field('remember_token', __('Remember token'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new User());

        $form->text('name', __('Name'));
        $form->email('email', __('Email'));
        $form->datetime('email_verified_at', __('Email verified at'))->default(date('Y-m-d H:i:s'));
        $form->password('password', __('Password'));
        $form->image('avatar', __('Avatar'));
        $form->number('type', __('Type'));
        $form->text('open_id', __('Open id'));
        $form->text('access_token', __('Access token'));
        $form->text('token', __('Token'));
        $form->mobile('phone', __('Phone'));
        $form->text('remember_token', __('Remember token'));

        return $form;
    }
}

