<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>DriverMyPage.jsp</h3>
<h3><%=session.getAttribute("id") %>님의 MyPage</h3>
<a href="PasswordForm">상세보기 및 개인정보 수정</a><br><br> <!-- 비밀번호 치고 들어가기 -->
<a href="RideTogetherList">현재 동승을 원하는 방 목록보기</a><br><br>
<!-- 곧 운행할 예정이라면 현재 입장중인 방페이지로가고 운행예정이없으면 얼럿창 -->
<a href="OperationSchedule">운행예정</a><br><br>
<a href="RideRecord">운행기록</a><br><br>
<a href="home">메인으로</a>
</body>
</html>