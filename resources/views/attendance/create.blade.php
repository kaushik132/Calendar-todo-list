@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Mark Attendance for Multiple Students</h2>

   <form action="{{ route('attendance.store') }}" method="POST">
    @csrf

    <div class="mb-3">
        <label for="date">Date</label>
        <input type="date" name="date" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="user_ids">Select Students</label>
        <select name="user_ids[]" id="user_ids" class="form-control" multiple required>
            @foreach($users as $user)
                <option value="{{ $user->id }}">{{ $user->name }}</option>
            @endforeach
        </select>
    </div>

    <div class="mb-3">
        <label for="status">Status</label>
        <select name="status" class="form-control" required>
            <option value="present">Present</option>
            <option value="absent">Absent</option>
            <option value="halfday">Half Day</option>
        </select>
    </div>

    <button type="submit" class="btn btn-primary">Submit Attendance</button>
</form>

</div>
{{-- In your <head> --}}
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

{{-- Before </body> --}}
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script>
    $(document).ready(function() {
        $('#user_ids').select2({
            placeholder: "Select students",
            allowClear: true
        });
    });
</script>

@endsection
