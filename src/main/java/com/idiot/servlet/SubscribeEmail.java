package com.idiot.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SubscribeEmail")
public class SubscribeEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Database connection settings
	private static final String DB_URL = "jdbc:mysql://localhost:3306/late.news";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "genius";

	public SubscribeEmail() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Retrieve email from the request
		String email = request.getParameter("email");

		// Get the current date and format it
		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Use SQL-compatible format (YYYY-MM-DD)
		String formattedDate = dateFormat.format(currentDate);

		// Basic validation
		if (email == null || email.isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Email is required.");
			return;
		}

		// Insert the email and the formatted date into the database
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

				// Modify query to accept formatted date
				String insertEmailQuery = "INSERT INTO subscribed_email (date, email) VALUES (?, ?)";
				try (PreparedStatement ps = con.prepareStatement(insertEmailQuery)) {
					ps.setString(1, formattedDate); // Set the formatted date
					ps.setString(2, email); // Set the email

					int result = ps.executeUpdate();

					if (result > 0) {
						// Successfully inserted, redirect to fetchNews servlet
						response.sendRedirect(request.getContextPath() + "/fetchNews"); // Redirect to fetchNews servlet
					} else {
						response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to subscribe email.");
					}
				}

			} catch (SQLException e) {
				e.printStackTrace();
				throw new ServletException("Database error occurred.");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new ServletException("MySQL Driver not found.");
		}
	}
}