<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Attendance;
use App\Models\User;

class AttendanceController extends Controller
{
    public function index()
    {
        $attendances = Attendance::with('user')->orderBy('date', 'desc')->get();
        return view('attendance.index', compact('attendances'));
    }

    public function create()
    {
        $users = User::all();
        return view('attendance.create', compact('users'));
    }

public function store(Request $request)
{
    $request->validate([
        'date' => 'required|date',
        'user_ids' => 'required|array',
        'user_ids.*' => 'exists:users,id',
        'status' => 'required|in:present,absent,halfday',
    ]);

    foreach ($request->user_ids as $user_id) {
        Attendance::updateOrCreate(
            [
                'user_id' => $user_id,
                'date' => $request->date,
            ],
            [
                'status' => $request->status,
            ]
        );
    }

    return back()->with('success', 'Attendance saved for selected students.');
}


}
