package com.idiot.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteEmail")
public class DeleteEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Database connection settings
	private static final String DB_URL = "jdbc:mysql://localhost:3306/late.news";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "genius";

	public DeleteEmail() {
		super();
	}

	// Support POST method for deleting emails
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve the ID from the request parameter
		String idStr = request.getParameter("id");

		// Basic validation
		if (idStr == null || idStr.isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID is required.");
			return;
		}

		int id;
		try {
			id = Integer.parseInt(idStr);
		} catch (NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format.");
			return;
		}

		// Delete the email from the database using the ID
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

				// SQL query to delete the email using the ID
				String deleteEmailQuery = "DELETE FROM subscribed_email WHERE id = ?";
				try (PreparedStatement ps = con.prepareStatement(deleteEmailQuery)) {
					ps.setInt(1, id); // Set the ID parameter

					int result = ps.executeUpdate();

					if (result > 0) {
						// Successfully deleted
						response.sendRedirect(request.getContextPath() + "/GoDashboard");
					} else {
						response.sendError(HttpServletResponse.SC_NOT_FOUND, "Email ID not found.");
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