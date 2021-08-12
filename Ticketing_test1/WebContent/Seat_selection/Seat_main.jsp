<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
<link rel="stylesheet" href="css/seat_frame.css"/>
</head>

<body>
<div class ="info" style="font-family:'S-CoreDream-3Light'">공연 제목 &nbsp;&nbsp;&nbsp; <!--공연정보, 선택 창 상단영역  --> <!--공연 제목은 추후 사용자가 선택한 공연의 이름을 전 페이지에서 가져오는 것으로 한다.-->
<select name="perform_list">
	<option value="8월 20일 14:00시">8월 20일 14:00시<br> <!--공연마다 회차 정보를 DB에 저장후 잔여석을 불러와야 한다.  -->
	<option value="8월 20일 19:00시">8월 20일 19:00시<br>
</select>
</div>
<p></p>
<div class ="content-box" style="font-family:'S-CoreDream-3Light'">		
	<div id="stage">무대</div> 
	<p></p>	
	<!--좌석 선택 영역 temp... 다른 좌석 선택 파일과 합칠 예정.-->
	<%@ include file="Seat_frame.jsp" %>	
														
	
</div>
<!-- 멀티 스레드, 동시 접속 및 실시간 좌석 변동을 할 수 있는지. 일단 잔여 좌석 정보는 DB에 저장한 다음 불러오기를 해야 한다. -->
<!-- 페이지가 바뀜 없이 서버와 통신하는 방법 - ajax -->

<p></p>

<div class="seat_info" >
	<!--이미지 삽입  -->
	<img src="images/cube.png" class="resizing"> <!--이미지를 클릭하면 메인 홈으로 이동할 수 있도록 링크를 달 예정. -->
	
	<!--남아있는 자리  -->
	<h5>좌석등급/잔여석</h5>
	<div class ="p_seat">
		<div style="white-space: pre-line;float:left;">		
		<ul id="seatDescription" > <!--등급, 잔여석 기술  -->
		<li id ="vip" style="background:url('images/question.png') no-repeat scroll 0 0 transparent;font-size:13px;">VIP석     150,0000원 20석</li><br>
		<li id ="r" style="background:url('images/plus.png') no-repeat scroll 0 0 transparent;font-size:13px;">R석       130,0000원 50석</li><br>		
		<li id ="s" style="background:url('images/check.png') no-repeat scroll 0 0 transparent;font-size:13px;">S석      100,000원 70석</li> 
		</ul>
	</div>
	</div> 

	<!--선택된 자리  --> 
	<h5 >선택한 좌석</h5>
	<div class = "s_seat" id="s_seat">
		당신이 선택한 좌석번호가 나타납니다.
	</div> 
	<br></br>
	<form action="seatSelected.jsp" method="get">
	<button id= "select_complete" type="submit" onclick()=" ">선택 완료</button><!--controller에게 값을 넘겨주고, controller가 할인수단 선택 화면 view(jsp)로 좌석 정보를 전달받는다.메소드 넣기 -->	
	</form>
</div>
</body>
<script type="text/javascript" src="seat_order.js"></script>  <!--하단에 선언해야 에러가 나지 않는다.  -->
</html>