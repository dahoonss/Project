<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<form action="WithPays" method="get">
<div class="container">
  <h2>바로 만들어진 동승 리스트</h2>
  <p>진행중인 동승리스트를 볼 수 있습니다.</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>방번호</th>
        <th>출발지</th>
        <th>도착지</th>
        <th>예상시간</th>
        <th>예상거리</th>
        <th>예상금액</th>
        <th>성별옵션</th>
        <th>최대인원</th>
        <th>기사</th>
        <th>입장</th>
        
      </tr>
    </thead>
    <tbody id="myTable">
    <c:forEach var = "room" items="${RoomList}">
      <tr>
      
        <td>${room.roomId}</td>
          <td>${room.rStart}</td>
          	<td>${room.rEnd}</td>
          	 <td>${room.preTime}</td>
          	 <td>${room.preDistance}</td>
          	  <td>${room.preMoney}</td>
          	  <td>${room.opGender }</td>
          	  <td>${room.maximum }</td>
          	  <td>${room.driverId }</td>
          	  
          	  <th><a href="RoomInfo?roomId=${room.roomId }">입장!</a></th>
      </tr>
      
     </c:forEach>
    </tbody>
  </table>
  
  
</div>
</form>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

</body>
</html>
