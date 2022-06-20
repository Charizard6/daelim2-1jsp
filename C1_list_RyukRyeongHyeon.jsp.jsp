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
	String sid = request.getParameter("id");
	String sj6 = request.getParameter("j6");	
	String sj1 = request.getParameter("j1");	
	Connection conn = null; //db연결
	String sUrl ="jdbc:mysql://localhost:3306/class1_jsp?allowMultiQueries=true";
	String sUser = "root";
	String sPwd = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(sUrl, sUser, sPwd);
	out.println("db 연결 성공" + "<br>");
	String st1 = "insert into tb_1_ryukryeonghyeon (vUserID,vJumin6,nJumin1,vRegDate) values ('"+sid+"','"+sj6+"',"+sj1+",now());";	
	String st2 = "select * from tb_1_ryukryeonghyeon order by vRegdate desc;";
	 //쿼리문 변수 처리 "+ 변수 +"
	Statement stmt = null;
	Statement stmt2 = null;
	ResultSet rs = null;
	try{
		stmt2  = conn.createStatement(); //쿼리문 실행
		stmt2.executeUpdate(st1);
		stmt  = conn.createStatement(); //쿼리문 실행
		rs = stmt.executeQuery(st2);
%>
<table width="600" border="1">
	<tr>
		<th>인덱스</th>
		<th>아이디</th>
		<th>주민번호 앞 6자리</th>
		<th>주민번호 뒤 1자리</th>
		<th>등록일</th>
	</tr>
<%
while(rs.next()){
	String id = rs.getString("nIDX");
	String vt = rs.getString("vUserID");
	String nv = rs.getString("vJumin6"); //timestampdiff 날짜 빼는 mysql
	String vr = rs.getString("nJumin1");
	String ve = rs.getString("vRegDate");
%>
	<tr>
		<th><%=id %></th>
		<th><a href="C1_view_RyukRyeongHyeon.jsp?nIDX=<%=id%>"><%=vt %></a></th>
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