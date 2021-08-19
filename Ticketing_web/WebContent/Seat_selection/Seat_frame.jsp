<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택화면</title>
<link rel="stylesheet" href="css/seat_style.css"/>
<script src="js/jquery-3.3.1.js"></script>
</head>

<body>
<div id="holder">	
	<div id ="area_divider" style="margin-bottom:40px">
	<ul>	
	<li style="margin-left:100px;">A</li>
	<li style="margin-left:200px;">B</li>	
	<li style="margin-left:230px;">C</li>	
	</ul>	
	</div>
	
	<div style="float:left"> <!--ul place 아래  좌석 frame이 li 형태로 들어온다.   -->
	<ul id="place">		
	</ul>
	</div>
	<div style="float:left; margin-top:390px; margin-left:440px">
	<ul id="seatDescription">
		<li style="background:url('images/check.png') no-repeat scroll 0 0 transparent;">잔여석</li>
		<li style="background:url('images/close.png') no-repeat scroll 0 0 transparent;">이미 선택된 좌석</li>
		<li style="background:url('images/select.png') no-repeat scroll 0 0 transparent;">선택한 좌석</li>
	</ul>
	</div>	
</div>
	
	<!--좌석 선택 main화면의 옆으로 옮겨야 한다. 버튼이 아니라 결과를 사이드에 출력하도록 수정해야 한다.-->
	<div style="clear:both;width:100%">
	<input type="button" id="btnShowNew" value="선택한 좌석"/> <!--선택한 좌석, 잔여석(전체 좌석-선택된 모든 좌석) 계산과 화면 출력을 위한 전송은 controller를 거친다.  -->
	<input type="button" id="btnShow" value="선택된 좌석 모두 보기"/>
	</div>
	
	<form method="post" action="seatController">	
	<input type="submit" id=".seat" name="seats"> <!--과연 한 좌석씩 눌렀을 때 controller에 보내지고, jsp에 출력되는 가. -->
	</form>
		
<script src="js/seat_settings.js"></script>
</body>
</html>