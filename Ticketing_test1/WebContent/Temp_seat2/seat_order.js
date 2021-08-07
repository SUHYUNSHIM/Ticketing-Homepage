/*let x;
let write_seat = document.getElemetByClassName('s_seat');
			
			write_seat.innerHTML +='<br>1번좌석 선택';
			break
		case '#2':
			write_seat.innerHTML +='<br>2번좌석 선택';*/



//누른 좌석의 번호가 선택된 좌석 표시 영역에 써지도록 한다.
const write_seat = document.getElementById('s_seat'); //document.querySelector('아이디 또는 클래스 이름');
function seat_click1(){										//querySelectorAll() css 선택자로 찾은 모든 element 목록을 리턴한다.
		write_seat.innerHTML +='<br>1번좌석 선택';
		console.log("1번");
}
function seat_click2(){	
		write_seat.innerHTML +='<br>2번좌석 선택';
		console.log("2번");
}
	

