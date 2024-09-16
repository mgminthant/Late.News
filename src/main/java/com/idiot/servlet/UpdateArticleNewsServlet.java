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

@WebServlet("/updateArticleNews")
public class UpdateArticleNewsServlet extends HttpServlet {

	private static final String UPDATE_ARTICLE_NEWS_QUERY = "UPDATE article SET title = ?, description = ?, date = ?, author = ? WHERE id = ?";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// Set request character encoding to UTF-8
		req.setCharacterEncoding("UTF-8");

		// Set content type and response encoding
		res.setContentType("text/html; charset=UTF-8");
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		String author = req.getParameter("author");

		Date currentDate = new Date();

		SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");
		String formattedDate = dateFormat.format(currentDate);

		if (id == null || id.isEmpty()) {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing news ID.");
			return;
		}

		try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/late.news", "root", "genius");
				PreparedStatement ps = con.prepareStatement(UPDATE_ARTICLE_NEWS_QUERY)) {

			ps.setString(1, title);
			ps.setString(2, description);
			ps.setString(3, formattedDate);
			ps.setString(4, author);
			ps.setInt(5, Integer.parseInt(id));

			ps.executeUpdate();

			res.sendRedirect("fetchNews"); // Redirect to home page or any other page
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException("Database access error.");
		}
	}
}