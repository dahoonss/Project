<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1><%=session.getAttribute("session_id") %></h1>
<h2>${loginMember.id} 로 로그인하셨습니다.</h2>
<a href="logout">로그아웃</a>

<c:if test="${loginMember.id eq 'admin'}">
	<a href="memberList">관리자모드 접속(회원 목록 보기)</a>
</c:if>
</body>
</html>