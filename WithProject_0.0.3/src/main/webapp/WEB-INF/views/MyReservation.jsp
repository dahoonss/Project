<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>마이페이지에서 예약내역 보기</h1>


<table border="1">

		<tr>
			<td>글번호</td>
			<td>작성자</td>
			<td>글제목</td>
			<td>작성일자</td>
			<td>조회수</td>

			
			<c:forEach items="${Reservationlist}" var="Reservationlist">
				<tr>
					<td>${Reservationlist.roomId}</td>
					<td>${Reservationlist.rStart}</td>
					<td>${Reservationlist.rEnd}</td>
					<td>${Reservationlist.preTime}</td>
					<td>${Reservationlist.preDistance}</td>
					<td>${Reservationlist.preMoney}</td>
					<td>${Reservationlist.opGender}</td>
					<td>${Reservationlist.dayDay}</td>
					<td>${Reservationlist.times}</td>
					
			</tr>
			</c:forEach>
	</table>
</body>
</html>