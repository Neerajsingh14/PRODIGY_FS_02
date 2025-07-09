<%@ page import="java.util.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Map<String, String>> list = new ArrayList<>();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "1909");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM employee");

        while (rs.next()) {
            Map<String, String> emp = new HashMap<>();
            emp.put("id", rs.getString("id"));
            emp.put("name", rs.getString("name"));
            emp.put("email", rs.getString("email"));
            emp.put("department", rs.getString("department"));
            emp.put("salary", rs.getString("salary"));
            list.add(emp);
        }

        rs.close();
        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Employees</title>
    <style>
        .employee-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-family: 'Segoe UI', sans-serif;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .employee-table th, .employee-table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .employee-table th {
            background-color: #1e1e2f;
            color: #fff;
            font-weight: bold;
        }

        .employee-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .employee-table tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            padding: 6px 12px;
            border-radius: 5px;
            text-decoration: none;
            margin: 0 5px;
            font-size: 14px;
            display: inline-block;
        }

        .edit-btn {
            background-color: #17a2b8;
            color: #fff;
        }

        .edit-btn:hover {
            background-color: #138496;
        }

        .delete-btn {
            background-color: #dc3545;
            color: #fff;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<h2>All Employees</h2>

<table class="employee-table">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Department</th>
        <th>Salary</th>
        <th>Actions</th>
    </tr>
    <% for (Map<String, String> emp : list) { %>
    <tr>
        <td><%= emp.get("id") %></td>
        <td><%= emp.get("name") %></td>
        <td><%= emp.get("email") %></td>
        <td><%= emp.get("department") %></td>
        <td><%= emp.get("salary") %></td>
        <td>
            <a href="#" class="btn edit-btn" onclick="loadEditForm(<%= emp.get("id") %>)">Edit</a>
            <a href="deleteEmployee?id=<%= emp.get("id") %>" class="btn delete-btn">Delete</a>
        </td>
    </tr>
    <% } %>
</table>

<script>
    function loadEditForm(id) {
        fetch('editEmployee.jsp?id=' + id)
            .then(res => res.text())
            .then(html => {
                document.getElementById('formContainer').innerHTML = html;
            });
    }
</script>

</body>
</html>
