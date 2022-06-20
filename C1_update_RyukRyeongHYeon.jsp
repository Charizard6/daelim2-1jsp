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
String sid = request.getParameter("nIDX");
String id = request.getParameter("vUID");
String j6 = request.getParameter("vJ6");	
String j1 = request.getParameter("vJ1");

Connection conn = null; //db연결
String sUrl ="jdbc:mysql://localhost:3306/class1_jsp?allowMultiQueries=true";
String sUser = "root";
String sPwd = "1234";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(sUrl, sUser, sPwd);
out.println("db 연결 성공" + "<br>");

String st = "update tb_1_ryukryeonghyeon set vUserID='"+id+"', vJumin6='"+j6+"' nJumin1="+j1+" where nIDX="+sid+";";
 //쿼리문 변수 처리 "+ 변수 +"
Statement stmt = null; 
ResultSet rs = null;
try{
	stmt  = conn.createStatement();
	stmt.executeUpdate(st);
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
<a href="C1_list_RyukRyeongHyeon.jsp">확인</a>
</body>
</html>