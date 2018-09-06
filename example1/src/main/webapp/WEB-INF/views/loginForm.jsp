<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인</h2>
<%=session.getAttribute("session_id") %>
<form action="login" method="post" name="login">
ID : <input type="text" name="id"><br>
PASSWORD : <input type="password" name="password"><br>
<input type="submit" value="로그인">
<a href="joinForm">회원가입</a>
</form>

<!--<a href="javascript:login.submit()" >로그인</a>  -->
</body>
</html>