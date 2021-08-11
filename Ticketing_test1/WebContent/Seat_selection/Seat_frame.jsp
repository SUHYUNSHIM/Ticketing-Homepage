<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택화면</title>
<!-- <link rel="stylesheet" href="css/style.css"/> --> 
<link rel="stylesheet" href="css/temp.css"/>
<script src="js/jquery-3.3.1.js"></script>
</head>

<body>
<div id="holder">	
	<div id ="area_divider" style="margin-bottom:50px">
	<ul>	
	<li style="margin-left:100px;">A</li>
	<li style="margin-left:170px;">B</li>
	<li style="margin-left:190px;">C</li>	
	</ul>
	</div>
	<div style="float:left;margin-right:10px;">
	<ul id="place">
<!-- 	<li>좌석1</li>
	<li>좌석2</li>
	<li>좌석3</li> 
	"<li class="seat1FA0101 disableSeat"style="top:22px;left:22px"><a title="1층A구역01열01번"> </a></li>" 그런데 지금 li를 넣어도 안보인다.
	-->
	</ul>
	</div>
</div>
	<div style="float:left;">
	<ul id="seatDescription">
		<li style="background:url('images/check.png') no-repeat scroll 0 0 transparent;">잔여석</li>
		<li style="background:url('images/close.png') no-repeat scroll 0 0 transparent;">이미 선택된 좌석</li>
		<li style="background:url('images/select.png') no-repeat scroll 0 0 transparent;">선택한 좌석</li>
	</ul>
	</div>
	<!--좌석 선택 main화면의 옆으로 옮겨야 한다. -->
	<div style="clear:both;width:100%">
	<input type="button" id="btnShowNew" value="선택한 좌석"/>
	<input type="button" id="btnShow" value="선택된 좌석 모두 보기"/>
	</div>
<!-- <script src="js/seat_setting.js"></script> -->
<script src="seat_temp.js"></script>
</body>
</html>