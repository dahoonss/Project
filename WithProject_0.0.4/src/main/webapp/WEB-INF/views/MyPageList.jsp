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
<h2>자신이 이용한 기록보기</h2>


<form action="mypagelist" method="post">

<c:forEach var="mypagelist" items="${mypagelist }">

${mypagelist.eroomId }번방
출발점:${mypagelist.erStart}
도착점:${mypagelist.erEnd}
시간:${mypagelist.epreTime}
거리:${mypagelist.epreDistance}
금액:${mypagelist.epreMoney}
<a href="Grade?=${mypagelist.edriverId}">${mypagelist.edriverId}:기사님 평점 주기</a><br>

</c:forEach>

</form>



</body>
</html>