<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    request.setCharacterEncoding("utf-8");
    String buid = request.getParameter("buid");

    String url_mysql = "jdbc:mysql://localhost/beep_user?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    PreparedStatement ps = null;

    JSONObject jsonList = new JSONObject();
    JSONArray itemList = new JSONArray();

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        String whereDefault ="select hid, hpredict, hstart, htraffic1, htraffic2, hspop, buser_buid from history  where buser_buid=?";

        ps = conn_mysql.prepareStatement(whereDefault);
        ps.setString(1, buid);

        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            JSONObject tempJson = new JSONObject();
            tempJson.put("hid", rs.getInt(1));
            tempJson.put("hpredict", rs.getString(2));
            tempJson.put("hstart", rs.getInt(3));
            tempJson.put("htraffic1", rs.getInt(4));
            tempJson.put("htraffic2", rs.getInt(5));
            tempJson.put("hspop", rs.getInt(6));
            tempJson.put("buser_buid", rs.getString(7));
           
            itemList.add(tempJson);
            
        }
        jsonList.put("results", itemList);
        conn_mysql.close();
        out.print(jsonList);

    }catch(Exception e){
        e.printStackTrace();
    }
    %>