<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<head>
<meta charset="UTF-8">
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>


<title>ChangedPersonalInfo</title>

<!-- Bootstrap core CSS -->
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">




<style>
body {
	height: 100%;
}

body {
	display: -ms-flexbox;
	display: flex;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-changed {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}

.form-changed .checkbox {
	font-weight: 400;
}

.form-changed .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

.form-changed .form-control:focus {
	z-index: 2;
}

.form-changed input[type="text"] {
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-changed input[type="email"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

</style>





</head>

<body class="text-center">

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
<c:if test="${UserAlterInfo.passuser == 1}">
	<form class="form-changed"
		action="UserInfoAlter" method="post">
		<img class="mb-4" src="resources/shareTexi.png" alt="" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">개인정보 수정 및 변경</h1>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<td scope="col">${UserAlterInfo.id}</td>
				</tr>
			</thead>

			<!-- <thead>
				<tr>
					<label for="inputPassword" class="sr-only">비밀번호</label>
					<th scope="col">Password</th>
					<td scope="col"><input type="password" name="password"
						id="password" class="form-control" placeholder="Password" required>
					</td>
				</tr>
			</thead> -->

			<thead>
				<tr>
					<th scope="col">Gender</th>
					<td scope="col">
					${UserAlterInfo.gender}
					</td>
					<!-- <label for="inputId" class="sr-only">이름</label> -->
				</tr>
			</thead>
			<thead>
				<tr>
					<th scope="col">Name</th>
					<td scope="col"><input type="text" name="Name"
						id="Email" class="form-control" value="${UserAlterInfo.name}"
						required autofocus></td>
					<!-- <label for="inputId" class="sr-only">닉네임</label> -->
				</tr>
			</thead>
			<thead>
				<tr>
					<th scope="col">E-Mail</th>
					<td scope="col"><input type="email" name="Email"
						id="Email" class="form-control" value="${UserAlterInfo.email}"
						required autofocus></td>
					<!-- <label for="inputId" class="sr-only">닉네임</label> -->
				</tr>
			</thead>

			<thead>
				<tr>
					<th scope="col">Tel</th>
					<td scope="col"><input type="text" name="Tel" id="Tel"
						class="form-control" value="${UserAlterInfo.tel}" required
						autofocus></td>
					<!-- <label for="inputId" class="sr-only">이메일</label> -->
				</tr>
			</thead>
			<thead>
				<tr>
					<th scope="col">Address</th>
					<td scope="col"><input type="text" name="Address" id="Address"
						class="form-control" value="${UserAlterInfo.address}" required
						autofocus></td>
					<!-- <label for="inputId" class="sr-only">이메일</label> -->
				</tr>
			</thead>
			<tr>
					<th scope="col">Certificate</th>
					<td id="ja"scope="col"><img class="mb-4" src="${pageContext.request.contextPath}/resources/${UserAlterInfo.certificate}" alt="" width="180" height="120">
					<input type="file" name="file"></td>
					<!-- <label for="inputId" class="sr-only">이메일</label> -->
				</tr>
			</thead>
			<thead>
				<tr>
					<th scope="col">기사자격 승인여부 </th>
					<td scope="col">
					<c:set var="signtype" value="${UserAlterInfo.signtype}" />
<c:choose>
    <c:when test="${signtype eq 'SUCCESS'}">
     승인완료
    </c:when>
    <c:when test="${signtype eq 'request'}">
       미승인
    </c:when>
    <c:otherwise>
        기사자격을 부여할 수 없습니다.
    </c:otherwise>
</c:choose>

		</table>
		<button class="btn btn-lg btn-primary btn-block" type="submit">변경</button>
		<h3><a href="home">취소</a></h3>


	</form>
	</c:if>
	<!-- 
<c:if test="${LoginMember.passuser == 2}">
<a href="DriverStart">기사용 시작하기</a><br><br>
<a href="DriverMyPage">마이페이지 기사용</a><br><br>
</c:if>
<c:if test="${LoginMember.passuser == 1}">
<a href="UserStart">유저용 시작하기</a><br><br>
<a href="UserMyPage">마이페이지 유저용</a><br><br>
</c:if> 
-->
<c:if test="${UserAlterInfo.passuser == 2}">
	<form class="form-changed"
		action="DriverInfoAlter" method="post" enctype="multipart/form-data">
		<img class="mb-4" src="resources/shareTexi.png" alt="" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">개인정보 수정 및 변경</h1>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<td scope="col">${UserAlterInfo.id}</td>
				</tr>
			</thead>

			<!-- <thead>
				<tr>
					<label for="inputPassword" class="sr-only">비밀번호</label>
					<th scope="col">Password</th>
					<td scope="col"><input type="password" name="password"
						id="password" class="form-control" placeholder="Password" required>
					</td>
				</tr>
			</thead> -->

			<thead>
				<tr>
					<th scope="col">Gender</th>
					<td scope="col">
					${UserAlterInfo.gender}
					</td>
					<!-- <label for="inputId" class="sr-only">이름</label> -->
				</tr>
			</thead>
			<thead>
				<tr>
					<th scope="col">Name</th>
					<td scope="col"><input type="text" name="Name"
						id="Email" class="form-control" value="${UserAlterInfo.name}"
						required autofocus></td>
					<!-- <label for="inputId" class="sr-only">닉네임</label> -->
				</tr>
			</thead>
			<thead>
				<tr>
					<th scope="col">E-Mail</th>
					<td scope="col"><input type="email" name="Email"
						id="Email" class="form-control" value="${UserAlterInfo.email}"
						required autofocus></td>
					<!-- <label for="inputId" class="sr-only">닉네임</label> -->
				</tr>
			</thead>

			<thead>
				<tr>
					<th scope="col">Tel</th>
					<td scope="col"><input type="text" name="Tel" id="Tel"
						class="form-control" value="${UserAlterInfo.tel}" required
						autofocus></td>
					<!-- <label for="inputId" class="sr-only">이메일</label> -->
				</tr>
			</thead>
			<thead>
				<tr>
					<th scope="col">Certificate</th>
					<td id="ja"scope="col"><img class="mb-4" src="${pageContext.request.contextPath}/resources/${UserAlterInfo.certificate}" alt="" width="180" height="120">
					<input type="file" name="file"></td>
					<!-- <label for="inputId" class="sr-only">이메일</label> -->
				</tr>
			</thead>
			
			<thead>
				<tr>
					<th scope="col">기사자격 승인여부 </th>
					<td scope="col">
					<c:set var="signtype" value="${UserAlterInfo.signtype}" />
<c:choose>
    <c:when test="${signtype eq 'SUCCESS'}">
     승인완료
    </c:when>
    <c:when test="${signtype eq 'request'}">
       미승인
    </c:when>
    <c:otherwise>
        기사자격을 부여할 수 없습니다.
    </c:otherwise>
</c:choose>
		</table>
		<button class="btn btn-lg btn-primary btn-block" type="submit">변경</button>
		<h3><a href="home">취소</a></h3>



	</form>
	</c:if>

</body>

</html>
