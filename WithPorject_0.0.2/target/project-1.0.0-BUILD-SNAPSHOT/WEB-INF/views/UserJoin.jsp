<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>UserJoin.jsp</h2>
<form action="UserJoinPro" method="post">
아이디 : <input type="text" name="Id"><br>
비밀번호 : <input type="text" name="Password"><br>
성별 : <input type="radio" name="Gender" value="men">남자
	<input type="radio" name="Gender" value="women">여자<br>
이메일 : <input type="text" name="Email"><br>
전화번호 : <input type="text" name="Tel"><br>
주소 : <input type="text" name="Address"><br>
<input type="submit" value="가입">
</form>
</body>
</html>