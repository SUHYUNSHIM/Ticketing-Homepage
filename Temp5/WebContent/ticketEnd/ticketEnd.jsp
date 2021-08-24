<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료/확인</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-1.7.2.min.js"></script>
<script src="../js/main.js"></script>
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
		                
		            </ul>
		
		            <select>
		                <option>Language</option>
		                <option>ENGLISH</option>
		                <option>한국어</option>
		            </select>
		        </div>
		    </header> 
		       
		  
		    
			    <div class="thumbs">
					<ul>
						<li class="first"><img src="../image/111.png"></li>
						<li class="second"><img src="../image/222.png"></li>
					</ul>
				</div>
			<br>
		<!-- ----------------------------------------------- -->
		
		<div>
		
			
		
			<img src="../image/11.png" width="400px" height="300px" style="display: block; margin: 0px auto;">
		
		
		<br>
		<table border=2 style="margin-left: auto; margin-right: auto;">
		<tr>
			<td style="text-align: center;">
			<h3>결제 확인</h3>
		
		
			<!-- 이름 넣기  --> 고객님께서 주문하신 내역입니다.<br>
			상품명 <!--  상품명 넣기  -->입니다.<br>
			좌석 번호 <!-- 좌석 번호 넣기  -->입니다.<br>
			상품 수령 <!-- 상품 수령 방식 넣기 --> 입니다.<br>
			
			<br></br>
			
			확인해주시기 바랍니다. 잘못된 부분이이 있다면 고객센터: 1899-xxxx 연락 바랍니다.
			<br></br>
			
			<input type="button" value="넘어가기"  onclick="window.open('../main/ticketMain.jsp','pay','resizable=no width=1500 height=800'); return false;">
			</td></tr>
		</table>
		</div>

           
		
		<footer>
			
		        <div>
		             <img src="../image/ticket7.png" alt="이미지대체 텍스트">
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