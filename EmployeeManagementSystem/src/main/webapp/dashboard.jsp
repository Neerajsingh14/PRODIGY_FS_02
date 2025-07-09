<%@ page language="java" session="true" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <style>
        .success-msg {
            color: green;
            font-weight: bold;
            padding: 10px;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2 class="sidebar-title">Admin Panel</h2>
        <a href="#" class="sidebar-link" onclick="loadAddEmployeeForm()">Add Employee</a>
        <a href="#" class="sidebar-link" onclick="loadViewEmployees()">View Employees</a>
        <a href="logout" class="sidebar-link">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2 class="dashboard-heading">Welcome back, <%= session.getAttribute("admin") %>!</h2>

        <!-- ✅ Success Messages -->
        <%
            String success = (String) session.getAttribute("success");
            if (success != null) {
        %>
            <p id="successMsg" class="success-msg"><%= success %></p>
        <%
                session.removeAttribute("success");
            }

            String successUpdate = (String) session.getAttribute("successUpdate");
            if (successUpdate != null) {
        %>
            <p id="successUpdateMsg" class="success-msg"><%= successUpdate %></p>
        <%
                session.removeAttribute("successUpdate");
            }
        %>

        <!-- Load Area -->
        <div id="formContainer"></div>
    </div>

    <!-- JavaScript -->
    <script>
        function loadAddEmployeeForm() {
            fetch("addEmployee.jsp")
                .then(res => res.text())
                .then(html => {
                    document.getElementById("formContainer").innerHTML = html;
                });
        }

        function loadViewEmployees() {
            fetch("viewEmployees.jsp")
                .then(res => res.text())
                .then(html => {
                    document.getElementById("formContainer").innerHTML = html;
                });
        }

        function loadEditForm(id) {
            fetch("editEmployee.jsp?id=" + id)
                .then(res => res.text())
                .then(html => {
                    document.getElementById("formContainer").innerHTML = html;
                });
        }

        // ⏱ Auto-hide success messages after 5 seconds
        setTimeout(() => {
            const successMsg = document.getElementById('successMsg');
            if (successMsg) successMsg.style.display = 'none';

            const updateMsg = document.getElementById('successUpdateMsg');
            if (updateMsg) updateMsg.style.display = 'none';
        }, 5000);
    </script>

</body>
</html>
