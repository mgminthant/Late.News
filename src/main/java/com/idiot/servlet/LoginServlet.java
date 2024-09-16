package com.idiot.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final String query = "SELECT * FROM admin WHERE user_name=? AND password=?";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// get PrintWriter
		PrintWriter pw = res.getWriter();
		// set content type
		res.setContentType("text/html");

		// get username and password from the request
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		// load JDBC driver
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException cnf) {
			cnf.printStackTrace();
		}

		// establish connection and check the credentials
		try (Connection con = DriverManager.getConnection("jdbc:mysql:///late.news", "root", "genius");
				PreparedStatement ps = con.prepareStatement(query)) {

			ps.setString(1, username);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				// Valid login, set session and redirect to admin dashboard
				HttpSession session = req.getSession();
				session.setAttribute("username", username);
				res.sendRedirect("fetchNews");
			} else {
				// Invalid login
				pw.println("<h2>Invalid Username or Password</h2>");
				pw.println("<a href='fetchNews'>Try Again</a>");
			}

		} catch (SQLException se) {
			se.printStackTrace();
			pw.println("<h1>" + se.getMessage() + "</h2>");
		} catch (Exception e) {
			e.printStackTrace();
			pw.println("<h1>" + e.getMessage() + "</h2>");
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}