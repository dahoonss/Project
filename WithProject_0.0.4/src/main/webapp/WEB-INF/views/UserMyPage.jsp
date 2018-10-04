<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>UserMyPage.jsp</h3>
<h3><%=session.getAttribute("id") %>님의 MyPage</h3>
<a href="PasswordForm">상세보기 및 개인정보 수정</a><br><br> <!-- 비밀번호 치고 들어가기 -->
<a href="ReservationRoomList">예약내역 보기</a><br><br>
<a href="MyPageList">자신이 이용했던 기록 보기(안에서 평점)</a><br><br>
<a href="home">메인으로</a>

</body>
</html>