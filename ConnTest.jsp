<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	try{String sUrl ="jdbc:mysql://localhost:3306/class1_jsp";
		String sUser = "root";
		String sPwd = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(sUrl, sUser, sPwd);
		out.println("성공");
	}
	catch(SQLException ex){
		out.println("db 연결 실패"+ ex.getMessage());
		ex.printStackTrace();
	}
	finally{
		if(conn != null)
			conn.close();
			out.println("db 연결해제");
	}
%>
</body>
</html>