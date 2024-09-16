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

@WebServlet("/deleteNews")
public class DeleteNewsServlet extends HttpServlet {

    private static final String DELETE_NORMAL_NEWS_QUERY = "DELETE FROM normal_news WHERE id = ?";
    private static final String DELETE_ARTICLE_NEWS_QUERY = "DELETE FROM article WHERE id = ?";
    private static final String DELETE_VIDEO_NEWS_QUERY = "DELETE FROM video_news WHERE id = ?";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String id = req.getParameter("id");
        String type = req.getParameter("type");

        if (id == null || id.isEmpty() || type == null || type.isEmpty()) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing news ID or type.");
            return;
        }

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/late.news", "root", "genius")) {
            String query;
            switch (type) {
                case "normal":
                    query = DELETE_NORMAL_NEWS_QUERY;
                    break;
                case "article":
                    query = DELETE_ARTICLE_NEWS_QUERY;
                    break;
                case "video":
                    query = DELETE_VIDEO_NEWS_QUERY;
                    break;
                default:
                    res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid news type.");
                    return;
            }

            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setInt(1, Integer.parseInt(id));
                int affectedRows = ps.executeUpdate();
                if (affectedRows > 0) {
                    res.sendRedirect("fetchNews");
                } else {
                    res.sendError(HttpServletResponse.SC_NOT_FOUND, "News item not found.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database access error.");
        }
    }
}