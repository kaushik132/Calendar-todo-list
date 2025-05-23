<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Attendance;

class HomeController extends Controller
{
    public function index()
    {
        $user = Auth::user();
    $attendances = Attendance::where('user_id', $user->id)
        ->get(['date', 'status']) // Make sure `date` column exists
        ->groupBy(function ($item) {
            return \Carbon\Carbon::parse($item->date)->format('Y-n-j'); // e.g. 2025-5-23
        });

    return view('home', [
        'attendances' => $attendances
    ]);
    }
}
