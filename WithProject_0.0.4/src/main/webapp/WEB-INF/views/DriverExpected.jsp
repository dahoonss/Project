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
<h2>기사 운행예정</h2>
<%-- 
<form action="DriverExpected?=${driverId}"  method="get">
 --%>

<c:forEach var="roomlist" items="${roomlist}">

${roomlist.roomId}번방
출발점:${roomlist.rStart}
도착점:${roomlist.rEnd}
예상시간:${roomlist.preTime}
예상거리:${roomlist.preDistance}
예상금액:${roomlist.preMoney}
날짜:${roomlist.dayDay}
시간:${roomlist.times}<br>

 <c:if test="${roomlist.rId1 != null}">
첫번째 손님:${roomlist.rId1}<br>
</c:if>
<c:if test="${roomlist.rId2 != null}">
두번째 손님:${roomlist.rId2}<br>
</c:if>
<c:if test="${roomlist.rId3 != null}">
세번째 손님:${roomlist.rId3}<br>
</c:if>
<c:if test="${roomlist.rId4 != null}">
네번째 손님:${roomlist.rId4}<br>
</c:if>

<br>
</c:forEach>
<!--  </form> -->
 
 
 
 <!-- 잘못됨 -->
<%-- <c:if test="${roomlist.rId1 != null}">
${roomlist.rId1} 님이 예약 하셨습니다.
</c:if><br>

<c:if test="${roomlist.rId2 != null}">
${roomlist.rId2} 님이 예약 하셨습니다.
</c:if><br>

<c:if test="${roomlist.rId3 != null}">
${roomlist.rId3} 님이 예약 하셨습니다.
</c:if><br>

<c:if test="${roomlist.rId4 != null}">
${roomlist.rId4} 님이 예약 하셨습니다.
</c:if><br>  --%>




</body>
</html>