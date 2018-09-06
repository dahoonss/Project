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
			data : {"id" : frm.id.value},
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
<form name="joinForm" action="join" method="post" id="frm">
<h2>회원가입</h2>
아이디<input type="text" name="id">
<input type="button" onclick="idOverlap()" value="중복확인"><br>
비밀번호<input type="password" name="password"><br>
이름<input type="text" name="name"><br>
나이<input type="text" name="age"><br>
성별<input type="text" name="gender"><br>
이메일<input type="text" name="email"><br>
<a href="javascript:joinForm.submit()">회원가입</a>
</form>

</body>
</html>