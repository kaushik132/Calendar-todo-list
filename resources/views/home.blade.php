<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Laravel 10 Custom Login and Registration</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    body {
      background: #f8f9fa;
      font-family: 'Segoe UI', sans-serif;
    }
    #calendar {
      display: grid;
      grid-template-columns: repeat(7, 1fr);
      gap: 8px;
    }
    .day {
      padding: 10px;
      background: #dee2e6;
      text-align: center;
      border-radius: 6px;
      cursor: pointer;
      font-weight: 500;
    }
    .day:hover {
      background: #adb5bd;
      color: white;
    }
    .today {
      background: #0d6efd;
      color: white;
    }
    .selected {
      background: #000f08;
      color: white;
    }
    #todo-list li {
      padding: 5px 10px;
      background: #f1f1f1;
      border-radius: 4px;
      margin-bottom: 5px;
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
      <a class="navbar-brand" href="#">Navbar</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" href="#">Home</a>
          </li>
        </ul>
        <form action="{{ route('logout') }}" method="POST" class="d-flex">
          @csrf
          @method('DELETE')
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
          <h4 class="d-flex align-items-center mb-3">
            <img src="https://img.icons8.com/emoji/28/calendar-emoji.png" class="me-2" /> Calendar To-Do List
          </h4>

          <div class="d-flex justify-content-between align-items-center mb-3">
            <button class="btn btn-outline-secondary btn-sm" onclick="changeMonth(-1)">←</button>
            <div class="d-flex gap-2 align-items-center">
              <select id="month-select" class="form-select form-select-sm" style="width: auto;"></select>
              <select id="year-select" class="form-select form-select-sm" style="width: auto;"></select>
            </div>
            <button class="btn btn-outline-secondary btn-sm" onclick="changeMonth(1)">→</button>
          </div>

          <!-- Week Days Header -->
          <div class="weekdays">
            <div>Sun</div><div>Mon</div><div>Tue</div><div>Wed</div><div>Thu</div><div>Fri</div><div>Sat</div>
          </div>

          <div id="calendar" class="mb-3"></div>

          <div class="todo-section">
            <h6 id="selected-date" class="fw-bold">Select a date</h6>
            <div class="input-group mb-2">
              <input type="text" id="todo-input" class="form-control" placeholder="Add a task..." />
              <button onclick="addTodo()" class="btn btn-success">Add</button>
            </div>
            <ul id="todo-list" class="list-group list-group-flush"></ul>
          </div>

        </div>
      </div>
    </div>
  </div>

  <script>
    const calendar = document.getElementById("calendar");
    const selectedDateEl = document.getElementById("selected-date");
    const todoInput = document.getElementById("todo-input");
    const todoList = document.getElementById("todo-list");
    const monthSelect = document.getElementById("month-select");
    const yearSelect = document.getElementById("year-select");

    const todos = {};
    let selectedDate = null;
    let currentDate = new Date();

    function populateMonthYearSelectors() {
      const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
      monthSelect.innerHTML = months.map((m, i) => `<option value="${i}" ${i === currentDate.getMonth() ? 'selected' : ''}>${m}</option>`).join("");

      const currentYear = new Date().getFullYear();
      let years = "";
      for (let y = currentYear - 5; y <= currentYear + 5; y++) {
        years += `<option value="${y}" ${y === currentDate.getFullYear() ? 'selected' : ''}>${y}</option>`;
      }
      yearSelect.innerHTML = years;
    }

    function generateCalendar() {
      const year = currentDate.getFullYear();
      const month = currentDate.getMonth();
      const daysInMonth = new Date(year, month + 1, 0).getDate();
      calendar.innerHTML = "";

      const firstDay = new Date(year, month, 1).getDay();
      for (let i = 0; i < firstDay; i++) {
        const emptyDiv = document.createElement("div");
        calendar.appendChild(emptyDiv);
      }

      for (let day = 1; day <= daysInMonth; day++) {
        const date = new Date(year, month, day);
        const div = document.createElement("div");
        div.classList.add("day");

        const isToday = day === new Date().getDate() && month === new Date().getMonth() && year === new Date().getFullYear();
        if (isToday) div.classList.add("today");

        div.textContent = day;
        div.addEventListener("click", () => {
          selectedDate = `${year}-${month + 1}-${day}`;
          document.querySelectorAll(".day").forEach(el => el.classList.remove("selected"));
          div.classList.add("selected");
          selectedDateEl.textContent = `Tasks for ${selectedDate}`;
          showTodos();
        });

        calendar.appendChild(div);
      }

      monthSelect.value = currentDate.getMonth();
      yearSelect.value = currentDate.getFullYear();
    }

    function changeMonth(offset) {
      if (offset === -1) {
        currentDate.setMonth(currentDate.getMonth() - 1);
      } else if (offset === 1) {
        currentDate.setMonth(currentDate.getMonth() + 1);
      } else {
        currentDate.setMonth(parseInt(monthSelect.value));
        currentDate.setFullYear(parseInt(yearSelect.value));
      }
      generateCalendar();
    }

    function addTodo() {
      if (!selectedDate) {
        alert("Please select a date first!");
        return;
      }

      const task = todoInput.value.trim();
      if (!task) return;

      if (!todos[selectedDate]) {
        todos[selectedDate] = [];
      }
      todos[selectedDate].push(task);
      todoInput.value = "";
      showTodos();
    }

    function showTodos() {
      todoList.innerHTML = "";
      if (todos[selectedDate]) {
        todos[selectedDate].forEach((task, index) => {
          const li = document.createElement("li");
          li.textContent = task;
          todoList.appendChild(li);
        });
      }
    }

    populateMonthYearSelectors();
    generateCalendar();
    monthSelect.addEventListener("change", () => changeMonth(0));
    yearSelect.addEventListener("change", () => changeMonth(0));
  </script>
</body>
</html>