<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use App\Models\Attendance;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use OpenAdmin\Admin\Facades\Admin;

class AttendanceController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Attendance';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Attendance());

        $grid->column('id', __('Id'));
        $grid->column('user.name', __('User id'));
        $grid->column('date', __('Date'));
        $grid->column('status', __('Status'));

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
        $show = new Show(Attendance::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('date', __('Date'));
        $show->field('status', __('Status'));
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
        $form = new Form(new Attendance());

        $form->multipleSelect('user_id', 'Students')
            ->options(User::pluck('name', 'id'))
            ->rules('required');

        $form->date('date', __('Date'))->default(date('Y-m-d'));

        $form->select('status', __('Status'))->options([
            'present' => 'Present',
            'absent' => 'Absent',
            'halfday' => 'Half Day',
        ])->rules('required');

        // Custom save logic for multiple user_ids
        $form->saving(function (Form $form) {
            $userIds = request()->input('user_id');
            $date = $form->date;
            $status = $form->status;

            if (empty($userIds) || !is_array($userIds)) {
                admin_error('Validation Error', 'Please select at least one student.');
                return false;
            }

            try {
                DB::beginTransaction();

                foreach ($userIds as $userId) {
                    if ($userId) {
                        Attendance::create([
                            'user_id' => $userId,
                            'date' => $date,
                            'status' => $status,
                        ]);
                    }
                }

                DB::commit();
                admin_success('Success', 'Attendance records saved successfully.');
            } catch (\Exception $e) {
                DB::rollBack();
                admin_error('Error', 'Failed to save attendance: ' . $e->getMessage());
            }

            return false; // prevent default save
        });

        return $form;
    }
}
