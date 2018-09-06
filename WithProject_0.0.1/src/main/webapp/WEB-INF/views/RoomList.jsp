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
<h2>방 목록 페이지</h2>
<table border=1>

<tr align=center><td colspan=2>방</td></tr>

<c:forEach var="room" items="${roomList}">
<tr align=center>
	<td>방 번호<a href="RoomView?RoomId=${roomList.RoomId}">${roomList.RoomId}</a>

</c:forEach>

</table>
</body>
</html>