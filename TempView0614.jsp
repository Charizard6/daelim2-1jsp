<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기말 쿼리 view</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String sid = request.getParameter("nIDX");

Connection conn = null; //db연결
String sUrl ="jdbc:mysql://localhost:3306/class1_jsp?allowMultiQueries=true"; //다중쿼리 이거 붙여야함!!!!
String sUser = "root";
String sPwd = "1234";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(sUrl, sUser, sPwd);
out.println("db 연결 성공" + "<br>");
	
String siibal = "select * from tb_bbs where nIDX="+sid+";";
String siibal2 = "update tb_bbs set nView = ifnull(nView,0)+1 where nIDX="+sid+";";
 //다중쿼리
Statement pstmt = null;
Statement stmt = null; 
ResultSet rs = null;
try{
	stmt  = conn.createStatement();
	stmt.executeUpdate(siibal2);
	pstmt  = conn.createStatement(); //쿼리문 실행
	rs = pstmt.executeQuery(siibal);
	rs.next();
	String na = rs.getString("vTitle");
	String sc = rs.getString("vEmail"); 
	String rd = rs.getString("vRegDate");
	String nv = rs.getString("nView");
	String vw = rs.getString("vWrite");
%>
<input type="hidden" value="<%=sid %>"> <!-- 화면에 안봉여주고 다음페이지에 넘김 -->
제목 : <%=na %> <br>
이메일 : <%=sc %> <br>
날짜 : <%=rd %> <br>
조회수 : <%=nv %><br>
<%
}
catch(SQLException ex){
	out.println("db 연결 실패"+ ex.getMessage());
	ex.printStackTrace();
}
finally{
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
}
%>
<form action="TempDel0614.jsp?nIDX=<%=sid %>" method="post" name="myForm">
	<input type="submit" value="삭제">
</form>
</body>
</html>