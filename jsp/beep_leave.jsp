<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%

    request.setCharacterEncoding("utf-8");
    String buid =request.getParameter("buid");
    String utaltoedate =request.getParameter("utaltoedate");

    String url_mysql = "jdbc:mysql://localhost/beep_user?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    PreparedStatement ps =null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        String act1 = "delete from buser where buid = ?";
        String act2 = "insert into buser (utaltoedate";
        String act3 = ") values now()";
      

        ps=conn_mysql.prepareStatement(act1+act2+act3);
        ps.setString(1,buid);
        ps.setString(2,utaltoedate);

        ps.executeUpdate();
        conn_mysql.close();
%>
        {"result":"OK"}
    
<%
    }catch(Exception e){
%>
    {"result":"ERROR"}
<%
    }
%>