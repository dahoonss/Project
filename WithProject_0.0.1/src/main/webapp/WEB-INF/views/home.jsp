
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	WithProjectHome
</h1>
<%=session.getAttribute("id") %>
<a href="UserJoin">사용자 회원가입</a><br><br>
<a href="Login">로그인</a><br><br>
<a href="Logout">로그아웃</a><br><br>
<a href="UserPage">유저 페이지</a>
<a href="chatting">채팅</a>
</body>
</html>
