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

			
				<tr>
					<td>${reservation.roomId}</td>
					<td>${reservation.rStart}</td>
					<td>${reservation.rEnd}</td>
					<td>${reservation.preTime}</td>
					<td>${reservation.preDistance}</td>
					<td>${reservation.preMoney}</td>
					<td>${reservation.opGender}</td>
					<td>${reservation.dayDay}</td>
					<td>${reservation.times}</td>
					
			
	</table>
</body>
</html>