<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기말 입력</title>
</head>
<body>
<form action="TempInsertProc2.jsp" method="post" name="myForm">
	이름<input type="text" name="mName" value="id"><br>
	점수<input type="text" name="mScore" value=""><br>
	<input type="submit" value="ok">
</form>


<form action="TempDeleteProc.jsp" method="post" name="myForm">
	삭제할 번호 : <input type="text" name="midx" value="">
	<input type="submit" value="ok">
</form>
<form action="TempSelect.jsp" method="post" name="myForm">
	<input type="submit" value="조회">
</form>
<br><br>
기말!!!!준비!!!
<form action="TempInsert0614.jsp" method="post" name="myfrom">
	제목<input type="text" size=10 name=mtitle><br>
	이메일<input type="text" size=20 name=memail><br>
	<!-- <textarea rows=10 cols=30 name=mNa></textarea><br> -->
	<input type="submit" value="입력">
</form><br>
수정
<form method="post">
	인덱스<input type="text" size=10 name=nIDX>
	<input type="submit" value="수정" formaction="TempUpdate1.jsp"> <!-- 폼태그 여러군데로! -->
	<input type="submit" value="삭제" formaction="TempDel0614.jsp">
</form>

</body>
</html>