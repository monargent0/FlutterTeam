<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("utf-8");
String buid = request.getParameter("buid");

String url_mysql = "jdbc:mysql://localhost/beep_user?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
String id_mysql = "root";
String pw_mysql = "qwer1234";

PreparedStatement ps = null;

  JSONObject jsonList = new JSONObject();

try{
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);

  ps = conn_mysql.prepareStatement("select buid from buser where buid = ?");
  ps.setString(1, buid);

  ResultSet rs = ps.executeQuery();

  if(rs.next()){
    jsonList.put("results", true);
  }else{
    jsonList.put("results", false);
  }
  conn_mysql.close();

  out.print(jsonList);
} catch(Exception e){
  e.printStackTrace();
}

%>