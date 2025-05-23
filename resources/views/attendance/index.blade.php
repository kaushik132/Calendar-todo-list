@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Student Attendance</h2>
    @php
        $i = 1;
    @endphp

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>No</th>
                <th>Student</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            @foreach($attendances as $attendance)
                <tr>
                    <td> @php
                        echo $i++;
                    @endphp</td>
                    <td>{{ $attendance->user->name }}</td>
                    <td>{{ $attendance->date }}</td>
                    <td>
                        <span class="badge 
                            @if($attendance->status == 'present') bg-success 
                            @elseif($attendance->status == 'absent') bg-danger 
                            @elseif($attendance->status == 'halfday') bg-warning 
                            @endif">
                            {{ ucfirst($attendance->status) }}
                        </span>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection
