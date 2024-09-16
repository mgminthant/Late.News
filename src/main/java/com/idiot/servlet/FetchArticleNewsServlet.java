package com.idiot.servlet;

import java.io.IOException;
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

@WebServlet("/fetchArticleNews")
public class FetchArticleNewsServlet extends HttpServlet {

	private static final String ARTICLE_NEWS_QUERY = "SELECT id, title, description, date, author FROM article WHERE id = ?";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// Set request character encoding to UTF-8
		req.setCharacterEncoding("UTF-8");

		// Set content type and response encoding
		res.setContentType("text/html; charset=UTF-8");
		String id = req.getParameter("id");

		if (id == null || id.isEmpty()) {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing news ID.");
			return;
		}

		try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/late.news", "root", "genius");
				PreparedStatement ps = con.prepareStatement(ARTICLE_NEWS_QUERY)) {

			ps.setInt(1, Integer.parseInt(id));
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				req.setAttribute("id", rs.getInt("id"));
				req.setAttribute("title", rs.getString("title"));
				req.setAttribute("description", rs.getString("description"));
				req.setAttribute("date", rs.getString("date"));
				req.setAttribute("author", rs.getString("author"));

				req.getRequestDispatcher("editArticleNews.jsp").forward(req, res);
			} else {
				res.sendError(HttpServletResponse.SC_NOT_FOUND, "Article news item not found.");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException("Database access error.");
		}
	}
}