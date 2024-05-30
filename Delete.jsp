<%@ page import="java.sql.*, javax.servlet.annotation.*, javax.servlet.http.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbUser = "system";
    String dbPassword = "rooter";

    String email = request.getParameter("email");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        String sql = "DELETE FROM store WHERE email=?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, email);

        int rowsAffected = statement.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("adonate.html");
        } else {
            response.sendRedirect("Delpage.html");
        }

        statement.close();
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("deleng.html?success=false");
    }
%>