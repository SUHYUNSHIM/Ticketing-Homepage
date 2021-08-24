<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송/결제</title>
<link rel="stylesheet" href="css/selected_frame.css"/>
<%
String s1_id = request.getParameter("s1_id");
String s2_id = request.getParameter("s2_id");
String s3_id = request.getParameter("s3_id");
%>

</head>
<body>
<div class ="info" style="font-family:'S-CoreDream-3Light'">배송/결제 &nbsp;&nbsp;&nbsp;
</div>
<p></p>	
<!--이전페이지에서 선택한 좌석 정보를 controller에서 받아서 다음 페이지인 지금 화면의 side에 출력해 줄 것이다.  -->
<div class ="content-box" style="font-family:'S-CoreDream-3Light'">		
	<p></p>
	<!--include를 사용해서 결제 수단 선택 및 결제 관련 페이지의 jsp가 들어가도록 한다.  *****************-->
	<%-- <%@ include file="seatSelected_dc.jsp" %>	 --%>													
</div>
<p></p>


<div class ="selected_info"> <!--이전 페이지와 같다.  -->
	<img src="images/cube.png" class="resizing"> 
	
	<!--사용자가 선택한 공연 이름이 h5 태그안에 써지도록 한다. 지금은 임시로 공간 잡아놓은 것.  -->
	<h5>공연 이름</h5>
	<div class ="seat"> 
		<div style="white-space: pre-line;float:left;">	
		<ul id="selected_description" >
			<%=s1_id %><br>
			<%=s2_id %><br>
			<%=s3_id %><br>
		</ul>
	</div>	
	</div>

	<!--등급별, 배송료는 현재 무료로 표기된 상태. 결제 금액이 표시된다.티켓금액+ 수수료+ 할인 금액 계산한 것 보여주기. 역시나 controller를 거친 것.  -->
	<h5>결제금액</h5>
	<div class="s_cost" id="s_cost">
	<!--  controller에서 받은 결제 금액 정보들 나타나는 곳.  -->	
	<ul id="cost_decription">
	<!-- Seat_frame 참조, but 그것을 controller, servelet에서 처리해서 여기서 출력해 주는 것.  -->
	<!--이전 페이지에서 적용된 할인 금액이 계산되어서 출력된다.  -->
	</ul>
	</div>
	<br></br>
	<form action="temp.jsp" method="get"> <!-- 메인 페이지의 결제 완료 - 마이 페이지로 넘어간다. -->
	<button id= "select_complete" type="submit" onclick()=" ">결제 완료</button>	<!--결제 완료 버튼 후 kg 이니시스로 결제를 하고 현재 창이 닫히고 큰화면으로 대체된다.  -->
	</form>
</div>
</body>
</html>