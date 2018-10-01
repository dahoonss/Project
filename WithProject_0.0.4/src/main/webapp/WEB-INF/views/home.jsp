<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>With</title>
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
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size: 16px;
position: fixed;
max-width:100%;
max-height:100%;
min-width:100%;
min-height:100%;

}
header{


}
.w3-image {display: none;

}
#a{

margin-left:25%;

}

#b{
margin-left:55%;

}


</style>
<body >

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="homes"><img src="resources/KakaoTalk_20180918_160253898.png" width="80px" height="30px"></a>
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
       
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="RoomList">방목록보기</a></li>
            <li><a href="RoomList1">예약가능한 방목록보기</a></li>
            
          </ul>
        </li>
       
      </ul>
    </div>
  </div>
</nav>





<!-- Header with Slideshow -->
<header class="w3-display-container w3-center">
  <button class="w3-button w3-block w3-green w3-hide-large w3-hide-medium" onclick="document.getElementById('download').style.display='block'">Download <i class="fa fa-android"></i> <i class="fa fa-apple"></i> <i class="fa fa-windows"></i></button>
  <div class="mySlides w3-animate-opacity">
    <img class="w3-image" src="resources/road.jpg"   width="100%" height="100%" >
     <img class="w3-image" src="resources/road2.jpg"   width="100%" height="100%">
      <img class="w3-image" src="resources/road1.jpg"   width="100%" height="100%">
    <div class="w3-display-left w3-padding w3-hide-small" style="width:25%; height:45%;" id="a">
      <div class="w3-black w3-opacity w3-hover-opacity-off w3-padding-large w3-round-large" >
        <h1 class="w3-xlarge">With 승객용</h1>
        <hr class="w3-opacity">
        
        <p><button class="w3-button w3-block w3-green w3-round" onclick="location.href='UserStart'" style="height:85px;">시작하기</button></p>
      </div>

    </div>
     <div class="w3-display-left w3-padding w3-hide-small" style="width:25%; height:45%;"   id="b">
      <div class="w3-black w3-opacity w3-hover-opacity-off w3-padding-large w3-round-large" >
        <h1 class="w3-xlarge">With 기사용</h1>
        <hr class="w3-opacity">
        
        <p><button class="w3-button w3-block w3-green w3-round" onclick="location.href='RoomList'">바로시작하기 </button></p>
         <p><button class="w3-button w3-block w3-green w3-round" onclick="location.href='RoomList1'">예약시작하기 </button></p>
      </div>

    </div>
    
  </div>
  

</header>








<script>
// Slideshow
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("w3-image");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("w3-image");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 4000); // Change image every 2 seconds
}
</script>

</body>
</html>
