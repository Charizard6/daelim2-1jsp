<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기말 쿼리 update최종</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String sid = request.getParameter("nIDX");
String st = request.getParameter("mtitle");	
String sm = request.getParameter("memail");

Connection conn = null; //db연결
String sUrl ="jdbc:mysql://localhost:3306/class1_jsp?allowMultiQueries=true";
String sUser = "root";
String sPwd = "1234";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(sUrl, sUser, sPwd);
out.println("db 연결 성공" + "<br>");

String siibal2 = "update tb_bbs set vTitle='"+st+"', vEmail='"+sm+"' where nIDX="+sid+";";
 //쿼리문 변수 처리 "+ 변수 +"
Statement stmt = null; 
ResultSet rs = null;
try{
	stmt  = conn.createStatement();
	stmt.executeUpdate(siibal2);
	out.println("성고!");
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
수정완료
<a href="TempSelect0614.jsp">확인</a>
</body>
</html>