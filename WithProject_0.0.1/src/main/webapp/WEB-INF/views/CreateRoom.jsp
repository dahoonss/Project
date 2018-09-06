<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>방 만들기 페이지</h2>
<%=session.getAttribute("id") %>
<form action="CreateRoom2" method="post">
방 번호 <input type="text" name="RoomId" required autofocus>
출발지 <input type="text" name="Starts" required autofocus><br>
도착지 <input type="text" name="Arrive" required autofocus><br>
예상거리 <input type="text" name="Street" required autofocus><br>
예상금액 <input type="text" name="Price" required autofocus><br>
동승자 성별선택 :<input type=radio name="gender" value="남" required autofocus>남자
	  <input type="radio" name="gender" value="여" required autofocus>여자
	  <input type="radio" name="gender" value="상관없음" required autofocus>상관없음<br>
<input type="submit" value="바로만들기">
</form>

<a href="Reservation">예약만들기</a><br>



</body>
</html>