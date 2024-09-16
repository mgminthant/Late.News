package com.idiot.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/updateNormalNews")
@MultipartConfig
public class UpdateNormalNewsServlet extends HttpServlet {

	private static final String UPDATE_NORMAL_NEWS_QUERY = "UPDATE normal_news SET title = ?, description = ?, date = ?, src = ? WHERE id = ?";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// Set request character encoding to UTF-8
		req.setCharacterEncoding("UTF-8");

		// Set content type and response encoding
		res.setContentType("text/html; charset=UTF-8");
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		
		Date currentDate = new Date();

		SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");
		String formattedDate = dateFormat.format(currentDate);

		Part filePart = req.getPart("src");
		String relativePath = null;

		// Check if filePart is not null
		if (filePart != null && filePart.getSize() > 0) {
			String fileName = filePart.getSubmittedFileName();
			String uploadPath = getServletContext().getRealPath("") + "uploads" + File.separator + fileName;

			// Save the file on the server
			filePart.write(uploadPath);

			// Create a relative path for storing in the database
			relativePath = "uploads/" + fileName;
		} else {
			// Handle case when no file is uploaded
			relativePath = req.getParameter("existingSrc"); // Assuming existingSrc is the current src in the DB
		}

		if (id == null || id.isEmpty()) {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing news ID.");
			return;
		}

		try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/late.news", "root", "genius");
				PreparedStatement ps = con.prepareStatement(UPDATE_NORMAL_NEWS_QUERY)) {

			ps.setString(1, title);
			ps.setString(2, description);
			ps.setString(3, formattedDate);
			ps.setString(4, relativePath);
			ps.setInt(5, Integer.parseInt(id));

			ps.executeUpdate();

			res.sendRedirect("fetchNews"); // Redirect to home page or any other page
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException("Database access error: " + e.getMessage());
		}
	}
}