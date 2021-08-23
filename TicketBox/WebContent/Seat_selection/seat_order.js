//누른 좌석의 번호가 선택된 좌석 표시 영역에 써지도록 한다. 이건 테스트 파일.
const write_seat = document.getElementById('s_seat'); //document.querySelector('아이디 또는 클래스 이름');
function seat_click1(){										//querySelectorAll() css 선택자로 찾은 모든 element 목록을 리턴한다.
		write_seat.innerHTML +='<br>1번좌석 선택';
		console.log("1번");
}
function seat_click2(){	
		write_seat.innerHTML +='<br>2번좌석 선택';
		console.log("2번");
}
	
//총 몇 석을 선택하고 예상 결제 금액이 얼마인지도 아래에 써주어야 한다.
