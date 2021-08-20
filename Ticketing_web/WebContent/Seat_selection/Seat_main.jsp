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
	<option value="8월 20일 14:00시">8월 20일 14:00시<br> 
	<option value="8월 20일 19:00시">8월 20일 19:00시<br>
	<!--회차 정보를 이전 페이지에서 가져와야 한다. 이전 페이지와 연동된 공연정보 DB  -->
</select>
</div>
<p></p>
<div class ="content-box" style="font-family:'S-CoreDream-3Light'">		
	<div id="stage">무대</div> 
	<p></p>		
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
		<li id ="vip" style="background:url('images/question.png') no-repeat scroll 0 0 transparent;font-size:13px;">VIP석     150,000원</li><br>
		<li id ="r" style="background:url('images/plus.png') no-repeat scroll 0 0 transparent;font-size:13px;">R석       130,000원 </li><br>		
		<li id ="s" style="background:url('images/check.png') no-repeat scroll 0 0 transparent;font-size:13px;">S석      100,000원 </li> 
		<!--공연장 정보에 따라서 VIP석, R석, S석이 몇 석인지 기록되어 있고, 결제 완료된 좌석을 빼어서 위의 li에 innerHTML하게 될 것이다.  -->
		</ul>
	</div>
	</div> 

	<!--선택된 자리  --> 
	<h5>선택한 좌석</h5>
	<div class = "s_seat" id="s_seat">	
		<!--당신이 선택한 좌석 정보가 나타납니다.  -->		
	</div> 
	<br></br>
	<script>
	function getInnerText(){
		const element = document.getElementById('s_seat'); //s_seat이라는  div 태그 안의 텍스트 내용을 반환하도록.
		return element.innerHTML;
		//console.log("seat 정보:"+element); //과연 되는가. 빈칸 단위로 문자열을 잘라서 배열로 만들어서 보내야 한다.
	}
	
	/* 
	//누른 좌석의 번호가 선택된 좌석 표시 영역에 써지도록 한다. 이건 테스트 파일.
	const write_seat = document.getElementById('s_seat'); //document.querySelector('아이디 또는 클래스 이름');
	function seat_click1(){										//querySelectorAll() css 선택자로 찾은 모든 element 목록을 리턴한다.
		write_seat.innerHTML +='<br>1번좌석 선택';
		console.log("1번");
	}	
	*/
	
	</script>
	
	<!--controller로 값 넘겨주고, ../Seat_selected/seatSelected.jsp로 가게 한다.  -->
	<!-- <form action="../Seat_selected/seatSelected.jsp" method="get"> -->
	<form action ="seatController">
	<button id= "select_complete" type="submit" onclick='getInnerText()'>선택 완료</button> <!--onclick 하면 그 값을 넘기는가?  -->
	<!--<input type="submit" id="select_complete" value="선택완료">  
	submit은 form 태그 내에 입력된 데이터를 서버로 전송해준다. -->
	<!--controller에게 값을 넘겨주고, controller가 할인수단 선택 화면 view(jsp)로 좌석 정보를 전달한다. -->	
	</form>
</div>
<script src="js/seat_settings.js"></script> <!--선택한 좌석 정보 쓰기 위해서!!  -->
</body>
</html>