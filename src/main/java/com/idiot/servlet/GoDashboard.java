package com.idiot.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GoDashboard")
public class GoDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Database connection settings
	private static final String DB_URL = "jdbc:mysql://localhost:3306/late.news";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "genius";

	public GoDashboard() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		ArrayList<Email> emailList = new ArrayList<>();
		int totalBlogNewsCount = 0;
		int totalArticleNewsCount = 0;
		int totalVideoNewsCount = 0;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

				// Query to fetch email data
				String emailQuery = "SELECT id, date, email FROM subscribed_email";
				try (PreparedStatement ps = con.prepareStatement(emailQuery); ResultSet rs = ps.executeQuery()) {

					while (rs.next()) {
						int id = rs.getInt("id");
						String email = rs.getString("email");
						String subscribeDate = rs.getString("date");
						emailList.add(new Email(id, email, subscribeDate));
					}
				}

				// Query to get total Blog News count
				String blogNewsCountQuery = "SELECT COUNT(*) FROM normal_news";
				try (PreparedStatement ps = con.prepareStatement(blogNewsCountQuery);
						ResultSet rs = ps.executeQuery()) {
					if (rs.next()) {
						totalBlogNewsCount = rs.getInt(1);
					}
				}

				// Query to get total Article News count
				String articleNewsCountQuery = "SELECT COUNT(*) FROM article";
				try (PreparedStatement ps = con.prepareStatement(articleNewsCountQuery);
						ResultSet rs = ps.executeQuery()) {
					if (rs.next()) {
						totalArticleNewsCount = rs.getInt(1);
					}
				}

				// Query to get total Video News count
				String videoNewsCountQuery = "SELECT COUNT(*) FROM video_news";
				try (PreparedStatement ps = con.prepareStatement(videoNewsCountQuery);
						ResultSet rs = ps.executeQuery()) {
					if (rs.next()) {
						totalVideoNewsCount = rs.getInt(1);
					}
				}

				// Set attributes for counts
				request.setAttribute("totalBlogNewsCount", totalBlogNewsCount);
				request.setAttribute("totalArticleNewsCount", totalArticleNewsCount);
				request.setAttribute("totalVideoNewsCount", totalVideoNewsCount);
				request.setAttribute("totalSubscribedEmailsCount", emailList.size());

			} catch (SQLException e) {
				e.printStackTrace();
				throw new ServletException("Database error occurred.");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new ServletException("MySQL Driver not found.");
		}

		// Set the email list attribute
		request.setAttribute("emailList", emailList);
		// Forward to JSP
		request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
	}

	// Inner class to represent email data
	public static class Email {
		private int id;
		private String email;
		private String subscribeDate;

		public Email(int id, String email, String subscribeDate) {
			this.id = id;
			this.email = email;
			this.subscribeDate = subscribeDate;
		}

		public int getId() {
			return id;
		}

		public String getEmail() {
			return email;
		}

		public String getSubscribeDate() {
			return subscribeDate;
		}
	}
}