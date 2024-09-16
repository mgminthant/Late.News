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

@WebServlet("/showDescription")
public class ShowDescriptionServlet extends HttpServlet {

	private static final String NORMAL_NEWS_QUERY = "SELECT title, description, date, src FROM normal_news WHERE id = ?";
	private static final String ARTICLE_NEWS_QUERY = "SELECT title, description, date, author FROM article WHERE id = ?";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// Set request character encoding to UTF-8
		req.setCharacterEncoding("UTF-8");

		// Set content type and response encoding
		res.setContentType("text/html; charset=UTF-8");
		String id = req.getParameter("id");
		String type = req.getParameter("type"); // New parameter to identify the type of news

		if (id == null || id.isEmpty() || type == null || type.isEmpty()) {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing news ID or type.");
			return;
		}

		String query;
		switch (type) {
		case "normal":
			query = NORMAL_NEWS_QUERY;
			break;
		case "article":
			query = ARTICLE_NEWS_QUERY;
			break;
		default:
			res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid news type.");
			return;
		}

		try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/late.news", "root", "genius");
				PreparedStatement ps = con.prepareStatement(query)) {

			ps.setInt(1, Integer.parseInt(id));
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				String title = rs.getString("title");
				String description = type.equals("video") ? rs.getString("yt_link") : rs.getString("description");
				String date = rs.getString("date");
				String src = type.equals("article") ? rs.getString("author") : rs.getString("src");

				req.setAttribute("title", title);
				req.setAttribute("description", description);
				req.setAttribute("date", date);
				req.setAttribute("src", src);

				req.getRequestDispatcher("Desc.jsp").forward(req, res);
			} else {
				res.sendError(HttpServletResponse.SC_NOT_FOUND, "News item not found.");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException("Database access error.");
		}
	}
}