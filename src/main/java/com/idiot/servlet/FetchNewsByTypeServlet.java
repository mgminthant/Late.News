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

@WebServlet("/fetchNewsByType")
public class FetchNewsByTypeServlet extends HttpServlet {

	private static final String NORMAL_NEWS_QUERY = "SELECT id, title, description, date, src FROM normal_news ORDER BY date DESC";
	private static final String ARTICLE_NEWS_QUERY = "SELECT id, title, description, date, author FROM article ORDER BY date DESC";
	private static final String VIDEO_NEWS_QUERY = "SELECT id, title, yt_link, date FROM video_news ORDER BY date DESC";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// Set request character encoding to UTF-8
		req.setCharacterEncoding("UTF-8");

		// Set content type and response encoding
		res.setContentType("text/html; charset=UTF-8");
		String newsType = req.getParameter("type");
		ArrayList<News> newsList = new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/late.news", "root",
					"genius")) {
				PreparedStatement ps = null;

				// Select query based on the news type
				if ("normal".equals(newsType)) {
					ps = con.prepareStatement(NORMAL_NEWS_QUERY);
				} else if ("article".equals(newsType)) {
					ps = con.prepareStatement(ARTICLE_NEWS_QUERY);
				} else if ("video".equals(newsType)) {
					ps = con.prepareStatement(VIDEO_NEWS_QUERY);
				}

				// Execute the query and fetch results
				try (ResultSet rs = ps.executeQuery()) {
					while (rs.next()) {
						int id = rs.getInt("id");
						String title = rs.getString("title");
						String description = rs.getString(newsType.equals("video") ? "yt_link" : "description");
						String date = rs.getString("date");
						String src = newsType.equals("video") ? ""
								: rs.getString(newsType.equals("normal") ? "src" : "author");

						newsList.add(new News(id, title, description, date, src, newsType));
					}
				}

				// Set the news list in request attributes
				req.setAttribute("newsList", newsList);

				// Redirect to appropriate JSP based on news type
				String redirectPage = "";
				if ("normal".equals(newsType)) {
					redirectPage = "allnormalnews.jsp";
				} else if ("article".equals(newsType)) {
					redirectPage = "allarticlenews.jsp";
				} else if ("video".equals(newsType)) {
					redirectPage = "allvideonews.jsp";
				}

				req.getRequestDispatcher(redirectPage).forward(req, res);

			} catch (SQLException e) {
				e.printStackTrace();
				throw new ServletException("Database error occurred.");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new ServletException("MySQL Driver not found.");
		}
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