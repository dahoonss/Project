<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>평점주기 test</h1>

	<form action="Gradeform" method="get">
		<select name="Grade">
			<option value="1">1점</option>
			<option value="2">2점</option>
			<option value="3">3점</option>
			<option value="4">4점</option>
			<option value="5">5점</option>
	
		</select><br>

<input type="hidden"  name="edriverId"  value="${driverId}">
		<input type="submit" value="평점주기"><br>
	  
	</form>
	여기여기
	
	 ${driverId}
	<h2>---------------------------------------------</h2>
	<table>

			<tr>
				<td>평점</td>
				<td>${gogo.finalgrade}</td>
				
			</tr>

		</table>

</body>
</html>