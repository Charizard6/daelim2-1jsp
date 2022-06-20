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
		
	String siibal = "select * from db_temp order by dRegdate desc;";
	 //쿼리문 변수 처리 "+ 변수 +"
	Statement stmt = null;
	ResultSet rs = null;
	out.println("됬냐" + "<br>");
	try{
		stmt  = conn.createStatement(); //쿼리문 실행
		rs = stmt.executeQuery(siibal);
%>
<table width="400" border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>점수</th>
		<th>날짜</th>
	</tr>
<%
while(rs.next()){
	String id = rs.getString("nidx");
	String na = rs.getString("vName");
	String sc = rs.getString("mScore"); //timestampdiff 날짜 빼는 mysql
	String rd = rs.getString("dRegDate");
%>
	<tr>
		<th><%=id %></th>
		<th><a href="TempView.jsp?ID=<%=id%>"><%=na %></a></th>
		<th><%=sc %></th>
		<th><%=rd %></th>
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