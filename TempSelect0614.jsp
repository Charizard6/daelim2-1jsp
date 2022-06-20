<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기말 쿼리 select</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String sScore = request.getParameter("mIDX");	
	Connection conn = null; //db연결
	String sUrl ="jdbc:mysql://localhost:3306/class1_jsp";
	String sUser = "root";
	String sPwd = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(sUrl, sUser, sPwd);
	out.println("db 연결 성공" + "<br>");
		
	String siibal = "select * from tb_bbs order by vRegdate desc;";
	 //쿼리문 변수 처리 "+ 변수 +"
	Statement stmt = null;
	ResultSet rs = null;
	try{
		stmt  = conn.createStatement(); //쿼리문 실행
		rs = stmt.executeQuery(siibal);
%>
<table width="600" border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>조회수</th>
		<th>날짜</th>
		<th>이메일</th>
	</tr>
<%
while(rs.next()){
	String id = rs.getString("nIDX");
	String vt = rs.getString("vTitle");
	String nv = rs.getString("nView"); //timestampdiff 날짜 빼는 mysql
	String vr = rs.getString("vRegDate");
	String ve = rs.getString("vEmail");
%>
	<tr>
		<th><%=id %></th>
		<th><a href="TempView0614.jsp?nIDX=<%=id%>"><%=vt %></a></th>
		<th><%=nv %></th>
		<th><%=vr %></th>
		<th><%=ve %></th>
	</tr>
<%} %>
</table>
<%
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