<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<script language='javascript'>
 function passWrite()
 {
  location.href = "passWrite.jsp?str_aid="+${view.aid}+"";
 }
 
 function modifypassWrite(){
  location.href = "modifypassWrite.jsp?str_aid="+${view.aid}+"";
	 
	 
 }
</script>
<style>
 
   #main_picture {
		            /*가로너비*/
		            width: 100%;
		            /*세로높이*/
		            height: 140px;
		            /*높이만큼 보여짐*/
		            overflow: hidden;
		            /*배경이미지*/
		            background-image: url(../image/bg26.png);
		            /*배경이미지 반복여부*/
		            background-repeat: no-repeat;
		            /*배경이미지 스크롤에 따른 이동*/
		            background-attachment: scroll;
		            /*배경이미지 사이즈*/
		            background-size: 100% 464px;
		            /*안쪽 그림자 효과 css3generator.com*/
		            -webkit-box-shadow: inset 3px 2px 25px 10px rgba(0, 0, 0, 0.8);
		            box-shadow: inset 3px 2px 25px 10px rgba(0, 0, 0, 0.8);
		        }
		    
 
 #view {			            
			              /*가로너비*/
		            width: 1175px;
		            /*높이만큼 늘어남*/
		            overflow: hidden;
		            /*상대위치*/
		            position: relative;
		            /*block속성일 때 가운데 정렬*/
		            margin: 0px auto;			            
	} 
	 aside {
		            /*가로너비*/
		            width: 300px;
		            /*세로높이*/
		            height: 500px;
		            /*왼쪽기준정렬*/
		            float: left;
		            /*높이만큼 보여짐*/
		            overflow: hidden;
		            /*상대위치*/
		            position: relative;
		            /*배경색상*/
		            background-color: #1e1e1e;
		            	background-image: url(../image/side3.PNG);
					background-size: 100%;	
		            
		        }
	
	section {
		            /*가로너비*/
		            width: 800px;
		            /*세로높이*/
		            height: 500px;
		            /*오른쪽 기준정렬*/
		            float: right;
		            /*높이만큼 보여짐*/
		            overflow: hidden;
		            /*상대위치*/
		            position: relative;		            
		        }
		        
	table{
		border-collapse: collapse; 
	}
	
	#table{
		margin: 44px 70px; 
	}
	
	.view_table{
		border-top:2px solid navy;
		border-bottom:2px solid navy;
		margin-bottom:10px;	
	}
	
	.view_table tr{
		border-bottom:1px solid #ccc;
	}
	
	.view_table th, .view_table td{
		padding: 3px;
	
	}
	
	.btn{
		background-color:#eee;
		
		border:1px solid #eee;
		padding: 5px 10px;
		
	}
	.btnT{
		text-align:center;
	
	}
	
	.board_title{
		
		font-size:17px;
		margin-bottom:7px;
		
	}
</style>
</head>
<body>
		<header>
	        <div id="menuBar">
	            <!--로고-->
	            <a href="../main/ticketMain.jsp" class="logo"></a>
	
	            <!--메뉴-->
	            <ul>
	                <li><a href="../main/ticketMain.jsp">티켓박스 홈</a></li>
	                <li><a href="#">뮤지컬</a></li>
	                <li><a href="#">콘서트</a></li>
	                <li><a href="#">마이페이지</a></li>
	                <li><a href="BoardList">공연 후기 게시판</a>
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
	    <!--메인이미지 박스-->
	 <div id="main_picture">

	 </div>

	<div id="view">
		<aside>	
		</aside>
		
		<section>
			<div id="table">
			
				<table class="board_title">
								<tr>
									<td>
										<b>솔직하고 생생한 후기</b>
									</td>				
								</tr>			
				</table>
							
				<!-- <table cellspacing = 0 cellpadding = 5 border = 1 width=500> -->
				<table class="view_table" width=500>
					<tr><td style="border-right:1px solid #ccc;"><b>글번호</b></td><td>${view.aid}</td></tr>
					<tr><td style="border-right:1px solid #ccc;"><b>조회수</b></td><td>${view.hits}</td></tr>
					<tr><td style="border-right:1px solid #ccc;"><b>이름 </b></td><td>${view.name}</td></tr>
					<tr><td style="border-right:1px solid #ccc;"><b>제목 </b></td><td>${view.subject}</td></tr>
					<tr>
						<td style="height:200px; vertical-align:top; border-right:1px solid #ccc;">
							<b>내용 </b>
						</td>
						<td width=350 style="vertical-align:top;">${view.content}</td>
					</tr>
				</table>
			 
				<!-- <table  cellspacing = 0 cellpadding = 0 border = 0 width=500> -->
				<table width=500 class="btnT" >
					<tr><td>
						<input type=button value="목록" OnClick="window.location='BoardList'" class="btn">
						<input type=button value="수정" OnClick="javascript:modifypassWrite();" class="btn">
						<input type=button value="삭제" OnClick="javascript:passWrite();" class="btn">
					</td></tr>
				</table>
			</div>
		</section>
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