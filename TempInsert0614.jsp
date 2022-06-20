<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기말 insert 쿼리</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
String sTitle = request.getParameter("mtitle");	
String sEmail = request.getParameter("memail");
String sNa = request.getParameter("mNa");
	Connection conn = null; //db연결
	String sUrl ="jdbc:mysql://localhost:3306/class1_jsp";
	String sUser = "root";
	String sPwd = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(sUrl, sUser, sPwd);
	out.println("db 연결 성공" + "<br>");
		
	String siibal = "insert into tb_bbs (vTitle, vEmail, vRegDate, nView) values('"+sTitle+"','"+sEmail+"',now(), 1);";
	 //쿼리문 변수 처리 "+ 변수 +"
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
<a href="TempSelect0614.jsp">디비화긴</a>
<!--<form action="TempSelect0614.jsp" method="post">
	번호 입력<input type="number" name="mIDX">
	<input type="submit" value="입력">
</form>  -->
</body>
</html>