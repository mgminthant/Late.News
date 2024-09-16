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

@WebServlet("/fetchVideoNews")
public class FetchVideoNewsServlet extends HttpServlet {

	private static final String VIDEO_NEWS_QUERY = "SELECT id, title, yt_link, date FROM video_news WHERE id = ?";

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
				PreparedStatement ps = con.prepareStatement(VIDEO_NEWS_QUERY)) {

			ps.setInt(1, Integer.parseInt(id));
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				req.setAttribute("id", rs.getInt("id"));
				req.setAttribute("title", rs.getString("title"));
				req.setAttribute("yt_link", rs.getString("yt_link"));
				req.setAttribute("date", rs.getString("date"));

				req.getRequestDispatcher("EditVideoNews.jsp").forward(req, res);
			} else {
				res.sendError(HttpServletResponse.SC_NOT_FOUND, "Video news item not found.");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException("Database access error.");
		}
	}
}