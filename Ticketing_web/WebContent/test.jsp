<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--선택된 자리  --> 
	<h5>선택한 좌석</h5>
	<div class = "s_seat" id="s_seat">	
		1층C구역06열21번 VIP
		<br>
		1층C구역07열21번 VIP
		<br>	
		1층C구역08열21번 VIP		 		
	</div> 
	<br></br>
	
	<script>
		var element = document.getElementById('s_seat'); //s_seat이라는  div 태그 안의 텍스트 내용을 반환하도록.		
		var temp;
		var seats = [];		
				
		var temp2 = element.innerHTML;
		temp = temp2.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'); //<br> 태그를 줄바꿈으로 바꿈.
		
		temp.trim();
		console.log(temp);
		seats = temp.split('\r\n');
				
		console.log(seats[0]);
		console.log(seats[1]);
		console.log(seats[2]);
	</script>

</body>
</html>