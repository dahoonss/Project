<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function innerHTMLCard(){
	document.getElementById('Send').innerHTML="카드결제입니다.<br><br>카드종류<input type='text' id='Cards'><br><br>카드번호<input type='text' id='Cardnum' ><br><br>비밀번호<input type='text' size='1' id='Password'>**<font color=#527a7a size='1'>비밀번호앞자리 2자리를입력해주세요</font><br><br>유효기간<input type='text' size='1' id='Month'>월<input type='text' size='1' id='Day'>일<font color=#527a7a size=1>예)08년11일</font><br><br>생년월일<input type='text' size=3 id='Birthday'>-*******<br>";
}
function innerHTMLSend(){
	document.getElementById('Send').innerHTML="계좌이체 입니다. 가상계좌의 번호는<br> 농협: 312-0120-9203-61 입니다.<br> "
}
function innerHTMLSelect(){
	document.getElementById('Send2').innerHTML="금액을 입력해주세요.<input type='number' name='Point'><br>"
}
function innerHTMLInput(){
	document.getElementById('Send2').innerHTML="결제금액을 골라주세요 <select name='Point'><option>5000</option><option>10000</option><option>15000</option></select><br>"
}
function Paymethod(){
	if(Pay.Cards.value.length==0){	
		Pay.Cards.focus();
		return false;	
	}
	else if(Pay.Cardnum.value.length==0){
		alert('카드번호를 입력해주세요');
		Pay.Cardnum.focus();
		return false;
	}else if(Pay.Password.value.length==0){
		alert('비밀번호를 입력해주세요');
		Pay.Password.focus();
		return false;
	}else if(Pay.Month.value.length==0 || Pay.Day.value.length==0){
		alert('유효기간을 입력해주세요');
		Pay.Month.focus();
		return false;
	}else if(Pay.Birthday.value.length==0){
		alert('생년월일을 입력해주세요');
		Pay.Birthday.focus();
		return false;
	}else{
		return true;
	}
} 
</script>
<form action="AddPointPro2" id="Pay" method="POST" >
<strong>포인트 충전페이지입니다</strong><br>
<input type="hidden" value="${roomId}" name="roomId">
<input type="hidden" value="${finalMoney}" name="finalMoney">
<strong><input type="button" value="선택!" onclick="innerHTMLInput()" >
<input type="button" value="입력!" onclick="innerHTMLSelect()" >
</strong><br>
<span id="Send2"></span>
포인트 충전결제방식을 골라주세요. 
 <strong><input type="button" value="카드" onclick="innerHTMLCard()" >
 <input type="button" value="계좌이체" onclick="innerHTMLSend()" ></strong><br>
<span id="Send"></span>
<input type="submit" value="포인트충전하기" onclick="Paymethod()">
</form>

</body>
</html>