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

@WebServlet("/fetchNews")
public class FetchNewsServlet extends HttpServlet {

	private static final String NORMAL_NEWS_QUERY = "SELECT id, title, description, date, src FROM normal_news ORDER BY date DESC LIMIT 8";
	private static final String ARTICLE_NEWS_QUERY = "SELECT id, title, description, date, author FROM article ORDER BY date DESC LIMIT 8";
	private static final String VIDEO_NEWS_QUERY = "SELECT id, title, yt_link, date FROM video_news ORDER BY date DESC LIMIT 8";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// Set request character encoding to UTF-8
		req.setCharacterEncoding("UTF-8");

		// Set content type and response encoding
		res.setContentType("text/html; charset=UTF-8");
		// Load JDBC driver
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new ServletException("MySQL JDBC Driver not found.");
		}

		// Fetch news from the database
		ArrayList<News> normalNewsList = new ArrayList<>();
		ArrayList<News> articleNewsList = new ArrayList<>();
		ArrayList<News> videoNewsList = new ArrayList<>();

		try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/late.news", "root", "genius")) {

			// Fetch normal news
			try (PreparedStatement ps = con.prepareStatement(NORMAL_NEWS_QUERY); ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					int id = rs.getInt("id");
					String title = rs.getString("title");
					String desc = rs.getString("description");
					String date = rs.getString("date");
					String src = rs.getString("src");
					normalNewsList.add(new News(id, title, desc, date, src, "normal"));
				}
			}

			// Fetch article news
			try (PreparedStatement ps = con.prepareStatement(ARTICLE_NEWS_QUERY); ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					int id = rs.getInt("id");
					String title = rs.getString("title");
					String desc = rs.getString("description");
					String date = rs.getString("date");
					String src = rs.getString("author");
					articleNewsList.add(new News(id, title, desc, date, src, "article"));
				}
			}

			// Fetch video news
			try (PreparedStatement ps = con.prepareStatement(VIDEO_NEWS_QUERY); ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					int id = rs.getInt("id");
					String title = rs.getString("title");
					String desc = rs.getString("yt_link");
					String date = rs.getString("date");
					String src = ""; // Assuming no 'src' for video news
					videoNewsList.add(new News(id, title, desc, date, src, "video"));
				}
			}

			// Set attributes for JSP
			req.setAttribute("normalNewsList", normalNewsList);
			req.setAttribute("articleNewsList", articleNewsList);
			req.setAttribute("videoNewsList", videoNewsList);

		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException("Database access error.");
		}
		req.getRequestDispatcher("Home.jsp").forward(req, res);

		// Forward request to JSP
	}

	// Helper class to hold news data
	public static class News {
		private int id;
		private String title;
		private String description;
		private String date;
		private String src;
		private String type;

		public News(int id, String title, String description, String date, String src, String type) {
			this.id = id;
			this.title = title;
			this.description = description;
			this.date = date;
			this.src = src;
			this.type = type;
		}

		public int getId() {
			return id;
		}

		public String getTitle() {
			return title;
		}

		public String getDescription() {
			return description;
		}

		public String getDate() {
			return date;
		}

		public String getSrc() {
			return src;
		}

		public String getType() {
			return type;
		}
	}
}