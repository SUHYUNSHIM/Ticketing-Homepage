<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page language="java" import="java.util.*, java.sql.*, javax.servlet.http.*" %>
<%@ page import="java.io.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">

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
	  #write {
		              /*가로너비*/
		            width: 1175px;
		            /*높이만큼 늘어남*/
		            overflow: hidden;
		            /*상대위치*/
		            position: relative;
		            /*block속성일 때 가운데 정렬*/
		            margin: 0px auto;			            
		} 
	
	#board{
	
		 margin: 100px 70px; 

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
		              	background-image: url(../image/write1.PNG);
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
		            /*배경색상*/	            
		        }
	
	caption{
		font-size:17px;
		font-weight:bold;
		margin-bottom:12px;
		text-align:left;
	
	}
	
	
	table{

		border-collapse: collapse; 
	
	}
	
	.btn{
		background-color:#eee;
		
		border:1px solid #eee;
		padding: 5px 10px;
		
	}
	.btnT{
		text-align:center;
	
	}
	
	.wirte_table{
		border-top:2px solid navy;
		border-bottom:2px solid navy;
		margin-bottom:10px;
	
	}
	
	.wirte_table tr{
		border-bottom:1px solid #ccc;
	}
	
	.input{		
		border-top:none;
		border-left:none;
		border-right:none;
		border-bottom:1px solid black;
		margin-left:10px;
	}
	
	
</style>
<script language="javascript">
function send_check(){
	var f = document.f;	
	
	if( f.subject.value.trim() == '' ){
		alert("제목을 입력해야 합니다");
		f.subject.focus();
		return;
	}
	
	if( f.name.value.trim() == '' ){
		alert("작성자를 입력해야 합니다");
		f.name.focus();
		return;
	}
	
	if( f.content.value.trim() == '' ){
		alert("내용을 입력해야 합니다");
		f.content.focus();
		return;
	}
	
	 if( f.pwd.value.trim() == '' ){
		alert("비밀번호를 입력해야 합니다");
		f.pwd.focus();
		return;
	} 
	
	f.submit();
}

function fn_onload(){
	document.f.subject.focus();
	
}
</script>
 
</head>
<body onload="fn_onload()">

   			
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
		       
		<div id="write">  
 				<aside>
		        </aside>
			<section>
			<div id="board">
			<form name="f" method="post" action="boardInsert">
			
					<table class="wirte_table" >					
						 <caption>생생하고 솔직한 후기 작성   >>  </caption>
						
						<tr>
							<th width="120" height="25" style="border-right:1px solid #ccc;">작품명</th>
							<td colspan="3">
								<input name="subject" style="width:470px" maxlength="40" required class="input">
							</td>
						</tr>
						
					 	<tr>
							<th width="120" height="25" style="border-right:1px solid #ccc;">비밀번호</th>
							<td colspan="3">
								<input name="pwd" type="password" style="width:470px"  maxlength="20" required class="input">
							</td>
						</tr>  
						<tr>
							<th width="120" height="25" style="border-right:1px solid #ccc;">작성자</th>
							<td colspan="3">
								<input name="name" style="width:470px" class="input">
							</td>
						</tr>	
						
						<tr>
							<th width="120" height="25" style="border-right:1px solid #ccc;">내용</th>
							<td colspan="3">
								<textarea name="content" rows="9" cols="70"></textarea>
							</td>
						</tr>	
					</table>			
				</form>
				<table class="btnT">
					<tr>
						<td style="width:600px; colspan="3">
							<input type=button value="등록" OnClick="send_check();" class="btn">
							<input type=button value="리스트" OnClick="location.href='BoardList'" class="btn">
							<input type=reset value="취소" class="btn">
						</td>
					</tr>
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