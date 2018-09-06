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

<table border=1>
<tr align=center><td colspan=2>회원목록</td></tr>
<c:forEach var="member" items="${memberList}">
<tr align=center>
	<td>
		<a href="memberView?id=${member.id}">
				${member.id}</a><!-- 회원정보기 -->
</td>
<td> <a href="memberDelete?id=${member.id}">삭제</a>
</td>
</c:forEach>
</table>

</body>
</html>