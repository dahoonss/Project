
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	WithProjectHome
</h1>

<%
	String id = (String)session.getAttribute("id");
	/* if(id.equals("admin") && !(id.equals(null))){} */
%>

<% if(id != null){ %>
<a href="Logout">로그아웃</a><br><br>
<% }else {%>
<a href="Login">로그인</a><br><br>
<a href="UserJoin">사용자 회원가입</a><br><br>
<a href="DriverJoin">기사 회원가입</a><br><br>
 <%} %> 
<c:if test="${LoginMember.passuser == 2}">
<a href="DriverStart">기사용 시작하기</a><br><br>
<a href="DriverMyPage">마이페이지 기사용</a><br><br>
</c:if>
<c:if test="${LoginMember.passuser == 1}">
<a href="UserStart">유저용 시작하기</a><br><br>
<a href="UserMyPage">마이페이지 유저용</a><br><br>
</c:if>



<%-- 로그인 아이디 확인 :<%=id %><br><br>
<%=request.getAttribute("LoginMember") %><br><br>
아이디: ${LoginMember.id}<br><br>
주소 :  ${LoginMember.address}<br><br>
패스유저 : ${LoginMember.passuser } --%>
</body>
</html>
