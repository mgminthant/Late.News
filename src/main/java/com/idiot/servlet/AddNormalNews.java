package com.idiot.servlet;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/addnormal")
@MultipartConfig // Enables file upload handling
public class AddNormalNews extends HttpServlet {
	private static final String query = "INSERT INTO normal_news(title, description, date, src) VALUES(?,?,?,?)";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// Set request character encoding to UTF-8
		req.setCharacterEncoding("UTF-8");

		// Set content type and response encoding
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = res.getWriter();

		// Get the input parameters (title, description) with UTF-8 support
		String title = req.getParameter("normal_title");
		String desc = req.getParameter("normal_desc");
		Date currentDate = new Date();

		// Define the date format pattern
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");

		// Format the date
		String formattedDate = dateFormat.format(currentDate);

		// Handle file upload
		Part filePart = req.getPart("bookImage");
		String fileName = filePart.getSubmittedFileName();
		String uploadPath = getServletContext().getRealPath("") + "uploads" + File.separator + fileName;

		// Save the file on the server
		filePart.write(uploadPath);

		// Create a relative path for storing in the database
		String relativePath = "uploads/" + fileName;

		// Load JDBC driver
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException cnf) {
			cnf.printStackTrace();
		}

		// Generate the connection
		try (Connection con = DriverManager.getConnection("jdbc:mysql:///late.news", "root", "genius");
				PreparedStatement ps = con.prepareStatement(query)) {

			ps.setString(1, title); // Properly handles Myanmar language text
			ps.setString(2, desc); // Properly handles Myanmar language text
			ps.setString(3, formattedDate);
			ps.setString(4, relativePath);

			int count = ps.executeUpdate();
			if (count == 1) {
				res.sendRedirect("fetchNews");
			} else {
				pw.println("<h2>Record not Registered Successfully</h2>");
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
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}
}