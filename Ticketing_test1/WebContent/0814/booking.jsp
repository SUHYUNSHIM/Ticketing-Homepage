<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/main.js"></script>

<!-- jQueryUI css파일 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>
<!-- jQuery 기본 js 파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- 예약페이지 js파일 -->
<script src="js/booking.js"></script>

<%
String name= request.getParameter("name");
%>
</head>


<body>
   			<header>
		        <div id="menuBar">
		            <!--로고-->
		            <a href="ticketMain.jsp" class="logo"></a>
		
		            <!--메뉴-->
		            <ul>
		                <li><a href="ticketmain.jsp">티켓박스 홈</a></li>
		                <li><a href="#">뮤지컬</a></li>
		                <li><a href="#">콘서트</a></li>
		                <li><a href="#">마이페이지</a></li>
		                <li><a href="#">공연 후기 게시판</a>
		                <li><a href="#">*Login</a></li>
		               	<li><a href="#">*Join</a></li>
		               	<li><a href="#">*Join</a></li>
		            </ul>
		
		            <select>
		                <option>Language</option>
		                <option>ENGLISH</option>
		                <option>한국어</option>
		            </select>
		        </div>
		    </header> 		
<!-- ------------------------------header 끝-------------------------------- -->
		<div id="musicalImg">
			<img src="image/hedwig.jpg">
		</div>

	<div id="select">
	
		<div id="selectDate">
			<input type="date" id="input_date">
		</div>

		<div id="selectTime">
			<ul>
				<li><div class="hour1">11시 20분</div></li>
				<li><div class="hour1">15시 20분</div></li>
				<li><div class="hour1">19시 20분</div></li>
			</ul>
		
		</div>
		
		<div id="currentSeat">
			<!-- 이자리에 좌석  -->


		</div>
			
	</div>
<!-- -----------------------------footer시작----------------------------------- -->
	<footer>
		        <div>
		             <img src="image/ticket7.png" alt="이미지대체 텍스트">
		            <p>
		               ㈜티켓박스 컴퍼니 경기도 성남시 분당구, 5층 대표이사 : 홍길동 사업자등록번호 : 333-5326-753<br>
				고객센터(평일/주말 09:00~18:00) : 1899-xxxx (유료)<a href="#">개인정보처리방침</a>
		                <br>
		                <span>Copyright ⓒTicket Box Company Corp</span>
		            </p>
		            <div>
		                
		                <select>
		                    <option>관련사이트</option>
		                </select>
		            </div>
		        </div>
	
	</footer>
</body>
</html>