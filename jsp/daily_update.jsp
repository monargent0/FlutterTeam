<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%

    request.setCharacterEncoding("utf-8");
    int did =request.getParameter("did");
 
    String url_mysql = "jdbc:mysql://localhost/education?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    PreparedStatement ps =null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        String act1 ="update diary set ddate =now(), dcontent =?, eid = ? where did = ?";



        ps=conn_mysql.prepareStatement(act1);
        ps.setString(1,ddate);
        ps.setString(2,dcontent);
        ps.setString(3,eid);
        ps.setString(4,did);

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