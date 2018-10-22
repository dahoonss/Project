<%@page import="org.springframework.web.bind.annotation.RequestParam"%>
<%@page import="org.springframework.web.context.request.RequestAttributes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%-- <%@page import="com.with.project.vo.RoomVO" %> --%>
    <%-- <%@ page import="bean.EditorBean"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="home"><img src="resources/KakaoTalk_20180918_160253898.png" width="80px" height="30px"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      <%
	String id = (String)session.getAttribute("id");
%>
       <% if(id != null){ %>
<li><a href="Logout">로그아웃</a></li>
<% }else {%>
<li><a href="Login">로그인</a></li>
<li><a href="UserJoin">사용자 회원가입</a></li>
<li><a href="DriverJoin">기사 회원가입</a></li>
 <%} %> 
 <c:if test="${LoginMember.passuser == 2}">

<li><a href="DriverMyPage">마이페이지 기사용</a></li>
</c:if>
<c:if test="${LoginMember.passuser == 1}">
<li><a href="UserMyPage">마이페이지 유저용</a></li>
</c:if>
<c:if test="${LoginMember.signtype eq 'emptys'}">
<li><a href="License">라이센스 등록하기</a><br><br></li>
</c:if>
<%if("admin".equals(id)){%>
<li><a href="AdminHome">관리자모드 실행하기</a></li>
<% } %>
       
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="RoomList">방목록보기</a></li>
            <li><a href="RoomList1">예약가능한 방목록보기</a></li>
            <li><a href="findid">아이디 찾기</a></li>
			<li><a href="findps">비밀번호 찾기</a></li>
			<!-- <li><a href="cacaoAPI">카카오페이 TEST</a></li> -->
          </ul>
        </li>
       
      </ul>
    </div>
  </div>
</nav>
성별 옵션: ${Room.opGender }<br>
<%int num = 0; %>
<c:if test="${Room.rId1 != null}">
<% num += 1; %>
</c:if>
<c:if test="${Room.rId2 != null }">
<% num +=1; %>
</c:if>
<c:if test="${Room.rId3 != null }">
<% num +=1; %>
</c:if>
<c:if test="${Room.rId4 != null }">
<% num +=1; %>
</c:if>
인원 수: <%=num %> / ${Room.maximum}<br>
<c:if test="${Room.rId1 != null}">
현재 입장중인 ID: ${Room.rId1}<br>
</c:if>
<c:if test="${Room.rId2 != null}">
현재 입장중인 ID: ${Room.rId2}<br>
</c:if>
<c:if test="${Room.rId3 != null}">
현재 입장중인 ID: ${Room.rId3}<br>
</c:if>
<c:if test="${Room.rId4 != null}">
현재 입장중인 ID: ${Room.rId4}<br>
</c:if>
<c:if test="${Room.driverId == null}">
기사 ID : 현재 입장중인 기사가 없습니다.<br>
</c:if>
<c:if test="${Room.driverId != null}">
기사 ID : <a href="DriverInfo?Id=${Room.driverId}">${Room.driverId}</a><br>
</c:if>
<br>
출발지 : ${Room.rStart}<br>
도착지 : ${Room.rEnd }<br>
예상거리 : ${Room.preDistance }<br>
(예상금액 / 최대인원 한 값)예상금액 : ${Room.finalMoney }원<br>
예상시간 : ${Room.preTime }<br><br>
예약 날짜 / 시간 : ${Room.dayDay } / ${Room.times }<br>
<a href="ChattingRoom">채팅방 입장</a><br>
<c:if test="${pay.okCash == null}">
결제 미완료<br>
<a href="Rpay?finalMoney=${Room.finalMoney }&roomId=${Room.roomId}">예약 및 결제</a><br>

</c:if>
<c:if test="${pay.okCash == '1'}">
동승중<br>
<a href="payCancel2?roomId=${Room.roomId }">예약 취소</a><br>
</c:if>

<c:if test="${pay.okCash == null}">
<a href="RoomOut2?roomId=${Room.roomId }">방 나가기</a><br>
</c:if>
<c:if test="${member.passuser == 2}">
<br>
<a href="EndDriver?roomId=${Room.roomId}">운행완료 ^^7</a>
</c:if>
<!--  
<c:if test="${LoginMember.passuser == 2}">
<a href="DriverStart">기사용 시작하기</a><br><br>
<a href="DriverMyPage">마이페이지 기사용</a><br><br>
</c:if>
-->

</body>
</html>