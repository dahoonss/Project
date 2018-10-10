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
<h2>기사 운행기록</h2>

<form action="Drivingrecord?=${edriverId}"  method="get">


<!--  -->
<c:forEach var="endroomvo" items="${endroomvo}">


출발점:${endroomvo.erStart}
도착점:${endroomvo.erEnd}
시간:${endroomvo.epreTime}
거리:${endroomvo.epreDistance}
금액:${endroomvo.epreMoney}
날짜:${endroomvo.edayDay}
시간:${endroomvo.etimes}<br>

<c:if test="${endroomvo.erId1 != null}">
${endroomvo.erId1} 님이 이용하셨습니다.
</c:if><br>

<c:if test="${endroomvo.erId2 != null}">
${endroomvo.erId2} 님이 이용하셨습니다.
</c:if><br>

<c:if test="${endroomvo.erId3 != null}">
${endroomvo.erId3} 님이 이용하셨습니다.
</c:if><br>

<c:if test="${endroomvo.erId4 != null}">
${endroomvo.erId4} 님이 이용하셨습니다.
</c:if><br> 



</c:forEach>
</form>

</body>
</html>