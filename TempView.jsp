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

String sid = request.getParameter("ID");

Connection conn = null; //db연결
String sUrl ="jdbc:mysql://localhost:3306/class1_jsp";
String sUser = "root";
String sPwd = "1234";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(sUrl, sUser, sPwd);
out.println("db 연결 성공" + "<br>");
	
String siibal = "select * from tb_bbs where nidx=?;";
 //쿼리문 변수 처리 "+ 변수 +"
PreparedStatement pstmt = null;
ResultSet rs = null;
try{
	pstmt = conn.prepareStatement(siibal);
	pstmt.setString(1, sid);
	rs = pstmt.executeQuery();
	rs.next();
	String na = rs.getString("vName");
	String sc = rs.getString("mScore"); //timestampdiff 날짜 빼는 mysql
	String rd = rs.getString("dRegDate");
%>
번호 : <%=sid %> <br>
이름 : <%=na %> <br>
점수 : <%=sc %> <br>
날짜 : <%=rd %> 
<form action="TempViewDel.jsp?ID=<%=sid %>" method="post" name="myForm">
	<input type="submit" value="삭제">
</form>
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
</body>
</html>