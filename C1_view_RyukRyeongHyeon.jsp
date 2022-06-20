<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버 프로그래밍 (컴퓨터 정보학부 2-1반) 기말고사</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String sid = request.getParameter("nIDX");	
	Connection conn = null; //db연결
	String sUrl ="jdbc:mysql://localhost:3306/class1_jsp";
	String sUser = "root";
	String sPwd = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(sUrl, sUser, sPwd);
	out.println("db 연결 성공" + "<br>");
		
	String siibal = "select * from tb_1_ryukryeonghyeon where nIDX="+sid+"";
	 //쿼리문 변수 처리 "+ 변수 +"
	Statement stmt = null;
	ResultSet rs = null;
	try{
		stmt  = conn.createStatement(); //쿼리문 실행
		rs = stmt.executeQuery(siibal);
		rs.next();
		String vt = rs.getString("vUserID");
		String ve = rs.getString("vJumin6");
		String nj = rs.getString("nJumin1");
%>
<form action="C1_update_RyukRyeongHYeon?nIDX=<%=sid %>" method="post" name="myfrom">
	아이디 : <input type="text" size=10 name=vUID value=<%=vt %>><br>
	생년월일 : <input type="text" size=20 name=vJ6 value=<%=ve %>><br>
	주민번호 뒤 1자리 : <input type="text" size=20 name=vJ1 value=<%=nj %>><br>
	<input type="submit" value="수정">
</form><br>
<%	}
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