<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String sScore = request.getParameter("mScore");	
	String sName = request.getParameter("mName");
	
	Connection conn = null; //db연결
	String sUrl ="jdbc:mysql://localhost:3306/class1_jsp";
	String sUser = "root";
	String sPwd = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(sUrl, sUser, sPwd);
	out.println("db 연결 성공" + "<br>");
		
	String siibal = "insert into db_temp (nidx,vName, mScore, dRegDate) values(12,'" + sName +"',"+ sScore +",now());";
	 //쿼리문 변수 처리 "+ 변수 +"
	out.println(siibal + "됬냐" + "<br>");
	Statement stmt = null;
	try{
		stmt  = conn.createStatement();
		stmt.executeUpdate(siibal); //쿼리문 실행
	}
	catch(SQLException ex){
		out.println("db 연결 실패"+ ex.getMessage());
		ex.printStackTrace();
	}
	finally{
		if(stmt != null)
			stmt.close();
		if(conn != null)
			conn.close();
	}
%>
</body>
</html>