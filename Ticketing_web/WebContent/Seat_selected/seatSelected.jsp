<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--할인수단 선택.. 혹시나 시간이 없어서 할인 쿠폰/ 이벤트 적용 못하더라도 frame 적용 가능하게 frame 짜기 -->	
<head>
<meta charset="UTF-8">
<title>할인수단 선택</title>
<link rel="stylesheet" href="css/selected_frame.css"/>
</head>
<body>

<div class ="info" style="font-family:'S-CoreDream-3Light'">가격 선택 &nbsp;&nbsp;&nbsp;
</div>
<p></p>	
<!--이전페이지에서 선택한 좌석 정보를 controller에서 받아서 다음 페이지인 지금 화면의 side에 출력해 줄 것이다.  -->
<div class ="content-box" style="font-family:'S-CoreDream-3Light'">		
	<p></p>
	<!--include를 사용해서 할인 수단 선택 jsp가 들어가도록 한다.  *****************-->
	<%@ include file="seatSelected_dc.jsp" %>														
</div>
<p></p>


<div class ="selected_info">
	<img src="images/cube.png" class="resizing"> 
	
	<!--사용자가 선택한 공연 이름이 h5 태그안에 써지도록 한다. 지금은 임시로 공간 잡아놓은 것.  -->
	<h5>공연 이름</h5>
	<div class ="seat"> 
		<div style="white-space: pre-line;float:left;">	
		<ul id="selected_description" >
			<!--여기에 좌석 구역 li로 가져온 것처럼 정보 li로 넣기  -->
			<!--공연 제목  -->
			<!--공연 날짜 , 시간 한줄로  -->	
			
			<!--총 선택한 좌석수  -->
			<!--선택한 등급, 층, 구역,열, 번호 -->
			<!--선택한 등급, 층, 구역,열, 번호 -->
			<!-- DB에서 arraylist로 멤버 목록 가져오는 것. object. 객체 베열. -->
		</ul>
	</div>	
	</div>

	<!--등급별, 배송료는 현재 무료로 표기된 상태. 결제 금액이 표시된다.티켓금액+ 수수료+ 할인 금액 계산한 것 보여주기. 역시나 controller를 거친 것.  -->
	<h5>결제금액</h5>
	<div class="s_cost" id="s_cost">
	<!--  controller에서 받은 결제 금액 정보들 나타나는 곳.  -->	
	<ul id="cost_decription">
	<!-- Seat_frame 참조, but 그것을 controller, servelet에서 처리해서 여기서 출력해 주는 것.  -->
	</ul>
	</div>
	<!-- 
	<br></br> -->
	<ul class="flex-contatiner" style="list-style:none;  ">
		<li>
		<button id= "select_return" value="BACK" onclick="history.go(-1)">이전 단계</button>
		</li>
		<li >
		<!-- <form action="../Payment/total_payment.jsp" method="get"> --> <!-- 최종 결제 화면으로 넘어간다. -->
		<button type="submit" id= "select_complete" onclick ="../Payment/total_payment.jsp" >선택 완료<!--controller에게 값을 넘겨주고, controller가 할인수단 선택 화면 view(jsp)로 좌석 정보를 전달받는다.메소드 넣기 -->	
		</button>
		<!-- </form> -->
		</li>
	
	</ul>

</div>
</body>
</html>