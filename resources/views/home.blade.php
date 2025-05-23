<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Calendar Attendance</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background: #f8f9fa; font-family: 'Segoe UI', sans-serif; }
    #calendar { display: grid; grid-template-columns: repeat(7, 1fr); gap: 8px; }
    .day {
      padding: 10px;
      background: #dee2e6;
      text-align: center;
      border-radius: 6px;
      cursor: pointer;
      font-weight: 500;
    }
    .day:hover { background: #adb5bd; color: white; }
    .today { background: #0d6efd; color: white; }
    .selected { border: 2px solid #000; }
    .status-present { background-color: #198754 !important; color: white; }   /* green */
    .status-absent { background-color: #dc3545 !important; color: white; }    /* red */
    .status-halfday { background-color: #ffc107 !important; color: rgb(255, 255, 255); }   /* yellow */
    #todo-list li {
      padding: 5px 10px;
      background: #f1f1f1;
      border-radius: 4px;
      margin-bottom: 5px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .weekdays {
      display: grid;
      grid-template-columns: repeat(7, 1fr);
      font-weight: bold;
      text-align: center;
      margin-bottom: 5px;
    }
  </style>
</head>
<body>
  <nav class="navbar navbar-expand-lg bg-light shadow-sm mb-4">
    <div class="container">
      <a class="navbar-brand" href="#">Calendar To-Do</a>
      <div class="collapse navbar-collapse">
        <form action="{{ route('logout') }}" method="POST" class="ms-auto">
          @csrf @method('DELETE')
          <button class="btn btn-danger" type="submit">Logout</button>
        </form>
      </div>
    </div>
  </nav>

  <div class="container">
    <div class="row g-4">
      <div class="col-md-6">
        <div class="p-4 bg-white rounded shadow-sm h-100">
          <h1 class="mb-0">Welcome, {{ Auth::user()->name }}</h1>
        </div>
      </div>
      <div class="col-md-6">
        <div class="p-4 bg-white rounded shadow-sm h-100">
          <h4 class="mb-3 d-flex align-items-center">
            <img src="https://img.icons8.com/emoji/28/calendar-emoji.png" class="me-2" /> Calendar Attendance
          </h4>

          <div class="d-flex justify-content-between align-items-center mb-3">
            <button class="btn btn-outline-secondary btn-sm" onclick="changeMonth(-1)">←</button>
            <div class="d-flex gap-2 align-items-center">
              <select id="month-select" class="form-select form-select-sm"></select>
              <select id="year-select" class="form-select form-select-sm"></select>
            </div>
            <button class="btn btn-outline-secondary btn-sm" onclick="changeMonth(1)">→</button>
          </div>

          <div class="weekdays">
            <div>Sun</div><div>Mon</div><div>Tue</div><div>Wed</div><div>Thu</div><div>Fri</div><div>Sat</div>
          </div>

          <div id="calendar" class="mb-3"></div>

          <div class="todo-section">
            <h6 id="selected-date" class="fw-bold">Select a date</h6>
            <ul id="todo-list" class="list-group list-group-flush"></ul>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    const calendar = document.getElementById("calendar");
    const selectedDateEl = document.getElementById("selected-date");
    const todoList = document.getElementById("todo-list");
    const monthSelect = document.getElementById("month-select");
    const yearSelect = document.getElementById("year-select");

    const todos = @json($attendances);
    let selectedDate = null;
    let currentDate = new Date();

    function populateMonthYearSelectors() {
      const months = ["January", "February", "March", "April", "May", "June",
                      "July", "August", "September", "October", "November", "December"];
      monthSelect.innerHTML = months.map((m, i) =>
        `<option value="${i}" ${i === currentDate.getMonth() ? 'selected' : ''}>${m}</option>`).join("");

      const currentYear = new Date().getFullYear();
      for (let y = currentYear - 5; y <= currentYear + 5; y++) {
        const option = document.createElement("option");
        option.value = y;
        option.text = y;
        if (y === currentDate.getFullYear()) option.selected = true;
        yearSelect.appendChild(option);
      }
    }

    function generateCalendar() {
      const year = currentDate.getFullYear();
      const month = currentDate.getMonth();
      const daysInMonth = new Date(year, month + 1, 0).getDate();
      const firstDay = new Date(year, month, 1).getDay();

      calendar.innerHTML = "";

      for (let i = 0; i < firstDay; i++) {
        calendar.appendChild(document.createElement("div"));
      }

      for (let day = 1; day <= daysInMonth; day++) {
        const div = document.createElement("div");
        const dateKey = `${year}-${month + 1}-${day}`;
        div.className = "day";
        div.textContent = day;

        const isToday = day === new Date().getDate() &&
                        month === new Date().getMonth() &&
                        year === new Date().getFullYear();

        if (isToday) div.classList.add("today");

        const statusData = todos[dateKey]?.[0]?.status ?? null;
        if (statusData) {
          if (statusData === "present") div.classList.add("status-present");
          else if (statusData === "absent") div.classList.add("status-absent");
          else if (statusData === "halfday") div.classList.add("status-halfday");
        }

        div.addEventListener("click", () => {
          document.querySelectorAll(".day").forEach(el => el.classList.remove("selected"));
          div.classList.add("selected");
          selectedDate = dateKey;
          selectedDateEl.textContent = `Attendance for ${selectedDate}`;
          showTodos();
        });

        calendar.appendChild(div);
      }
    }

    function changeMonth(offset) {
      if (offset !== 0) {
        currentDate.setMonth(currentDate.getMonth() + offset);
      } else {
        currentDate.setMonth(parseInt(monthSelect.value));
        currentDate.setFullYear(parseInt(yearSelect.value));
      }
      generateCalendar();
    }

    function showTodos() {
      todoList.innerHTML = "";
      (todos[selectedDate] || []).forEach(({ status }) => {
        const li = document.createElement("li");
        li.textContent = `Status: ${status}`;
        todoList.appendChild(li);
      });
    }

    populateMonthYearSelectors();
    generateCalendar();
    monthSelect.addEventListener("change", () => changeMonth(0));
    yearSelect.addEventListener("change", () => changeMonth(0));
  </script>
</body>
</html>
