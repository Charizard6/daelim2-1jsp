<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버 프로그래밍 (컴퓨터 정보학부 2-1반) 기말고사</title>
</head>
<body>

	<p>서버 프로그래밍 기말고사<br><br>
	<p>정보 입력 <br><br>
	<form action="C1_list_RyukRyeongHyeon.jsp" method="post">
		<p>아이디 : <input type="text" size="10" name="id" > : 최대 10자리까지
		<p>주민번호 앞6 자리 : <input type="number" size="6" name="j6" > : 숫자만 입력(6자리)
		<p>주민번호 뒷자리 첫번호 :
		<select name="j1">
			<option >1</option>
			<option >2</option>
			<option >3</option>
			<option >4</option>
		</select>
		<p><input type="submit" value="입력">
	</form>
		
</body>
</html>