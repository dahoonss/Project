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
아이디 값 : <%=session.getAttribute("id") %><br>
<form action="CreateRoom2" method="post">
방 번호 <input type="text" name="RoomId"><br>
출발지 <input type="text" name="Starts"><br>
도착지 <input type="text" name="Arrive"><br>
예상거리 <input type="text" name="Street"><br>
예상금액 <input type="text" name="Price"><br>
동승자 성별선택 :<input type=radio name="gender" value="남">남자
	  <input type="radio" name="gender" value="여">여자
	  <input type="radio" name="gender" value="상관없음">상관없음<br>
<input type="submit" value="바로만들기">
</form>

<a href="Reservation">예약만들기</a><br>



</body>
</html>