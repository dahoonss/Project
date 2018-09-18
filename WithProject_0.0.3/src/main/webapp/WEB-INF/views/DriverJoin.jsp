<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- ajax를 이용한 아이디 중복확인 기능 -->
<!-- Asynchronous Javascript and XML -->

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>

/* JSON() JavaScript Object Notation */
 
function idOverlap() {
		$.ajax({
			type : "post",
			url : "idOverlap", //서버로 간다능 (컨트롤러)
			data : {"id" : frm.Id.value},
			dataType : "text", //retrun Type
			success : function(data){
				if(data=="1"){
					alert("이 아이디는 사용 가능합니다.");
				}else {
					alert("이 아이디는 사용 할 수 없습니다.");
				}
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
		});
	}
</script>
</head>
<body>
<h2>DriverJoin.jsp</h2>
<form action="DriverJoinPro" method="post" enctype="multipart/form-data" id="frm">
아이디 : <input type="text" name="Id" required autofocus> <input type="button" onclick="idOverlap()" value="중복확인"><br>
비밀번호 : <input type="password" name="Password" required autofocus><br>
이름 : <input type="text" name="Name" required autofocus><br>
성별 : <input type="radio" name="Gender" value="men" required autofocus>남자
	<input type="radio" name="Gender" value="women" required autofocus>여자<br>
이메일 : <input type="email" name="Email" required autofocus><br>
전화번호 : <input type="text" name="Tel" required autofocus><br>
주소 : <input type="text" name="Address" required autofocus><br>
자격증 사진을 넣어주세요. <input type="file" name="file"><br>
<input type="submit" value="가입">
</form>
</body>
</html>