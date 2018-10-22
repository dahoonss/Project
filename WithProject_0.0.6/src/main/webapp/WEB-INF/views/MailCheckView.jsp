<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script type="text/javascript">
var count;
count =3;
zerocount = 0;
function EmailCheck() {
	var CheckEmail = document.getElementById("Check").value; 
	var CheckEmail1 = <%=session.getAttribute("random")%>
	if(count==zerocount){
		alert("인증이 3회 틀렸습니다. 다시 확인해주시기 바랍니다.")
		history.back(-3);
	}
	else if(CheckEmail != CheckEmail1){
		count = count-1;
		alert("인증번호가 다릅니다.");
		event.preventDefault();
	}
	if(CheckEmail == CheckEmail1){
		alert("회원가입이 완료되었습니다.");
		document.getElementById('frm').submit();
	}
	
}
</script>
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
<h1>MailCheckView.jsp입니다.</h1>
<h2>입력하신 메일로 인증번호를 전송했습니다. 인증번호를 입력해주세요.</h2>
<form action="UserJoinPro" method="get" id="frm">
<input type="hidden" name="Id" value="<%=request.getParameter("Id")%>">
<input type="hidden" name="Password" value="<%=request.getParameter("Password")%>">
<input type="hidden" name="Name" value="<%=request.getParameter("Name")%>">
<input type="hidden" name="Gender" value="<%=request.getParameter("Gender")%>">
<input type="hidden" name="Email" value="<%=request.getParameter("Email")%>">
<input type="hidden" name="Tel" value="<%=request.getParameter("Tel")%>">
<input type="hidden" name="Address" value="<%=request.getParameter("Address")%>">
인증번호 입력 : <input type="text" name="Check" id="Check">
<%=session.getAttribute("random")%>
</form>
<input type="submit" value="확인" onclick="EmailCheck()">

</body>
</html>