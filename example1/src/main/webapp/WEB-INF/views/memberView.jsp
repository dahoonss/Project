<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보 보기</h1>

아이디 :${viewMember.id}<br>
비밀번호 :${viewMember.password}<br>
이름 :${viewMember.name}<br>
나이 :${viewMember.age}<br>
성별 :${viewMember.gender}<br>
이메일 :${viewMember.email}<br>
<a href="memberList">리스트로 돌아가기</a>
</body>
</html>