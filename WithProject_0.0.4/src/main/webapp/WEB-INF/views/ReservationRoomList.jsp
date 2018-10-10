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
<h2>내가 예약한거 보기</h2>

<form action=ReservationRoomList method="get">
<c:forEach var="reservationList" items="${reservationList}">

${reservationList.eroomId }번방
출발점:${reservationList.erStart}
도착점:${reservationList.erEnd}
시간:${reservationList.epreTime}
거리:${reservationList.epreDistance}
금액:${reservationList.epreMoney}
날짜:${reservationList.edayDay }
시간:${reservationList.etimes}<br>

</c:forEach>
</form>

</body>
</html>