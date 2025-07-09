<%@ page import="com.ems.model.EmployeeDAO, com.ems.model.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Employee emp = EmployeeDAO.getEmployeeById(id);
%>

<style>
    .edit-form-container {
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        max-width: 500px;
        margin: auto;
        font-family: 'Segoe UI', sans-serif;
    }

    .edit-form-container h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
    }

    .edit-form-container label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
        color: #333;
    }

    .edit-form-container input {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 6px;
    }

    .edit-form-container button {
        width: 100%;
        padding: 12px;
        background-color: #007bff;
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .edit-form-container button:hover {
        background-color: #0056b3;
    }
</style>

<div class="edit-form-container">
    <h2>Edit Employee</h2>
    <form action="updateEmployee" method="post">
        <input type="hidden" name="id" value="<%= emp.getId() %>">

        <label>Name:</label>
        <input type="text" name="name" value="<%= emp.getName() %>" required>

        <label>Email:</label>
        <input type="email" name="email" value="<%= emp.getEmail() %>" required>

        <label>Department:</label>
        <input type="text" name="department" value="<%= emp.getDepartment() %>" required>

        <label>Salary:</label>
        <input type="number" name="salary" value="<%= emp.getSalary() %>" required>

        <button type="submit">Update</button>
    </form>
</div>
