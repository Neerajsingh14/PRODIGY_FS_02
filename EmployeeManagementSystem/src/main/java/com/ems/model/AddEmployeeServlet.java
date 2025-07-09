package com.ems.model;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;


/**
 * Servlet implementation class AddEmployeeServlet
 */

public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String department = request.getParameter("department");
		double salary = Double.parseDouble(request.getParameter("salary"));

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "1909");

			PreparedStatement ps = conn.prepareStatement("INSERT INTO employee (name, email, department, salary) VALUES (?, ?, ?, ?)");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, department);
			ps.setDouble(4, salary);
			ps.executeUpdate();

			conn.close();

			// ✅ Success message only
			request.getSession().setAttribute("success", "Employee added successfully!");
			response.sendRedirect("dashboard.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			// ❌ Do not set failure message
		}
	}

}
