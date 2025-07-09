package com.ems.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateEmployeeServlet
 */

public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployeeServlet() {
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
		
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String department = request.getParameter("department");
			double salary = Double.parseDouble(request.getParameter("salary"));

			Employee emp = new Employee();
			emp.setId(id);
			emp.setName(name);
			emp.setEmail(email);
			emp.setDepartment(department);
			emp.setSalary(salary);

			EmployeeDAO.update(emp);

			// ✅ Success message only
			request.getSession().setAttribute("successUpdate", "Employee updated successfully!");
			response.sendRedirect("dashboard.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			// ❌ Do not set failure message
		}
	}

}
