<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기말 update쿼리 중간단계</title>
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
		
	String siibal = "select * from tb_bbs where nIDX="+sid+"";
	 //쿼리문 변수 처리 "+ 변수 +"
	Statement stmt = null;
	ResultSet rs = null;
	try{
		stmt  = conn.createStatement(); //쿼리문 실행
		rs = stmt.executeQuery(siibal);
		rs.next();
		String vt = rs.getString("vTitle");
		String ve = rs.getString("vEmail");
%>
<form action="TempUpdate2.jsp?nIDX=<%=sid %>" method="post" name="myfrom">
	제목<input type="text" size=10 name=mtitle value=<%=vt %>><br>
	이메일<input type="text" size=20 name=memail value=<%=ve %>><br>
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