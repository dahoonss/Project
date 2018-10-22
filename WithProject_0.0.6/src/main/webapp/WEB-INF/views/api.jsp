<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 
값 받아오고 , 받아서 여기서 넘겨야지 point
-->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
</script>

</head>

<body>
<h2>api 테스트</h2>
<input type="hidden" value="${point}" id="point">
${point}
<input type="text" value="${member.point}" id="Point">
<input type="text" value="${roomId}" id="roomId">
<input type="text" value="${finalMoney}" id="finalMoney">



<script>
var point = document.getElementById("point").value;
IMP.init('imp00619307'); //iamport 대신 자신의 "가맹점 식별코드"를 사용하시면 됩니다
IMP.request_pay({
    pg : ' html5_inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : 'Point 충전',
    amount : point,
    buyer_name : '구매자이름',
    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        location.href='AddPointPro?Point=${point}&roomId=${roomId}&finalMoney=${finalMoney}';

        
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
});

</script>
</body>
</html>