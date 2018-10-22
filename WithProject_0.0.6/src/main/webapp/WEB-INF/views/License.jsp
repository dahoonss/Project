<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
function LicenseUpload() {
		alert("���̼��� ����� �Ϸ�Ǿ����ϴ�<br> �������� ������ �Ϸ�Ǹ� ������ �����մϴ�.");
		document.getElementById('frm').submit();
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
<li><a href="Logout">�α׾ƿ�</a></li>
<% }else {%>
<li><a href="Login">�α���</a></li>
<li><a href="UserJoin">����� ȸ������</a></li>
<li><a href="DriverJoin">��� ȸ������</a></li>
 <%} %> 
 <c:if test="${LoginMember.passuser == 2}">

<li><a href="DriverMyPage">���������� ����</a></li>
</c:if>
<c:if test="${LoginMember.passuser == 1}">
<li><a href="UserMyPage">���������� ������</a></li>
</c:if>
<c:if test="${LoginMember.signtype eq 'emptys'}">
<li><a href="License">���̼��� ����ϱ�</a><br><br></li>
</c:if>
<%if("admin".equals(id)){%>
<li><a href="AdminHome">�����ڸ�� �����ϱ�</a></li>
<% } %>
       
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="RoomList">���Ϻ���</a></li>
            <li><a href="RoomList1">���డ���� ���Ϻ���</a></li>
            <li><a href="findid">���̵� ã��</a></li>
			<li><a href="findps">��й�ȣ ã��</a></li>
			<!-- <li><a href="cacaoAPI">īī������ TEST</a></li> -->
          </ul>
        </li>
       
      </ul>
    </div>
  </div>
</nav>
<H1>License.jsp�Դϴ�.</H1>
<h2>���̼��� �ڰݵ���ϱ�</h2>
<h3>�ýÿ����ڰ��� �̹����� ÷�����ֽñ� �ٶ��ϴ�.</h3>
<form action="LicenseUpload" method="post" enctype="multipart/form-data" id="frm">
�������:<input type="file" name="file" id="file">
<input type="hidden" name="Id" value="<%=session.getAttribute("id") %>">
<input type="submit" value="Ȯ��" onclick="LicenseUpload()">
</form>
</body>
</html>