package com.ems.model;

import java.sql.*;
import java.util.*;

public class EmployeeDAO {
    static final String URL = "jdbc:mysql://localhost:3306/ems";
    static final String USER = "root";
    static final String PASS = "1909"; // Change it to your MySQL password

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public static int save(Employee e) {
        int status = 0;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("INSERT INTO employee (name, email, department, salary) VALUES (?, ?, ?, ?)")) {
            ps.setString(1, e.getName());
            ps.setString(2, e.getEmail());
            ps.setString(3, e.getDepartment());
            ps.setDouble(4, e.getSalary());
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
    
    public static int update(Employee e) {
        int status = 0;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE employee SET name=?, email=?, department=?, salary=? WHERE id=?")) {
            ps.setString(1, e.getName());
            ps.setString(2, e.getEmail());
            ps.setString(3, e.getDepartment());
            ps.setDouble(4, e.getSalary());
            ps.setInt(5, e.getId());
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static int delete(int id) {
        int status = 0;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM employee WHERE id=?")) {
            ps.setInt(1, id);
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static Employee getEmployeeById(int id) {
        Employee e = new Employee();
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM employee WHERE id=?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setId(rs.getInt("id"));
                e.setName(rs.getString("name"));
                e.setEmail(rs.getString("email"));
                e.setDepartment(rs.getString("department"));
                e.setSalary(rs.getDouble("salary"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }

    public static List<Employee> getAllEmployees() {
        List<Employee> list = new ArrayList<>();
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM employee");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("id"));
                e.setName(rs.getString("name"));
                e.setEmail(rs.getString("email"));
                e.setDepartment(rs.getString("department"));
                e.setSalary(rs.getDouble("salary"));
                list.add(e);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }
}
