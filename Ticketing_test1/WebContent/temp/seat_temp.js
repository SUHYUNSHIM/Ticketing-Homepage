//rows -> 가로 15줄 
//cols -> 세로 30줄

//좌석번호 예시) 1층 B구역 7열 17번
//세로 10줄씩 한 블록이 된다. 
//번호 카운트가 줄별로 세어야 한다.*******
//11줄부터 15줄은 2층, S석으로 구분된다.
//좌우 모퉁이 삼각형 모양으로 좌석 모양 만들기, 선택 불가 버튼으로 대체하는 것이 차선책***
//중앙 5열 블록부터 10열블록까지 + A구역, C구역 두 줄까지 VIP 석으로 지정
//1층의 VIP 석 제외의 구간은 R구역이다.
//VIP, R,S 구역에 따라서 좌석 색깔을 다르게 한다.*****
//좌석 열번호(통로), 구역명칭은 표기되어야 한다. 사용자의 편의를 위해.
//1인당 판매 좌석수를 4개로 제한시킨다.이것을 집계하는 함수도 controller에서 처리한다.
//선택한 좌석 번호를 controller에 보낸다. 잔여좌석을 계산하여 mainframe view 우측에 출력한다.
//2층은 count가 1열부터 다시 된다.
//+선택한 좌석을 결제 종료 후 화면에서 좌석도로 다시 볼 수 있을까?
//영문 변수 저장 --- 1FA0914 1층A구역9열14번.  2FC0327 2층C구역3열27번
//1,2 층 -- 3 구역 -- 4,5 열 -- 6,7 번호(열 기준 번호) 
//데이터베이스 저장시 편의를 위해 만든 것. java 문자열 자르기로 출력 가능. 
var settings = {
        rows: 10,
        cols: 10,
        
        //블록 나누기를 위해서 간격을 주어야 한다.
        rowCssPrefix: 'row-',
        colCssPrefix: 'col-',
        seatWidth: 22,
        seatHeight: 22,
        seatCss: 'seat',
        selectedSeatCss: 'selectedSeat',
        selectingSeatCss: 'selectingSeat'
    };
//1. 블록 표시하기

var init = function(reservedSeat){ //이미 예약된 좌석 정보가 있는지 배열로 넣어두어야 한다.
	var str= [],seatNo, className;
	//블록A
	for (i=1;i<=settings.rows;i++){ //여기서 rows는 10
		for(j=1;j<=settings.cols;j++){ //여기서 cols는 10
			seatNo = (i+j* settings.rows);
			className = settings.seatCss + ' ' + settings.rowCssPrefix + i.toString() + ' ' + settings.colCssPrefix + j.toString();
			if ($.isArray(reservedSeat) && $.inArray(seatNo, reservedSeat) != -1) {
                className += ' ' + settings.selectedSeatCss;
            }
            str.push('<li class="' + className + '"' +
                      'style="top:' + (i * settings.seatHeight).toString() + 'px;left:' + (j * settings.seatWidth).toString() + 'px">' +
                      '<a title="' + seatNo + '">' + seatNo + '</a>' +
                      '</li>');
        }
		}
	$('#place').html(str.join(''));
};


$('.' + settings.seatCss).click(function () {
	if ($(this).hasClass(settings.selectedSeatCss)){
	    alert('다른 고객님이 결제 중인 좌석입니다.');
	}
	else{
	    $(this).toggleClass(settings.selectingSeatCss);
	    }
	});
	 
	$('#btnShow').click(function () { //선택한 좌석---------mvc2 모델로 바꾸기 위해 선택한 좌석을 읽어서 view인 Seat_frame으로 보내주는 controller를 사용할 것이다.
	    var str = [];
	    $.each($('#place li.' + settings.selectedSeatCss + ' a, #place li.'+ settings.selectingSeatCss + ' a'), function (index, value) {
	        str.push($(this).attr('title'));
	    });
	    alert(str.join(',')); //경고창으로 출력이 아니라, 화면에 출력하는 것인데, 그 값을 보내는 것은 controller가 할 것이다. 
	})
	 
	$('#btnShowNew').click(function () { //선택된 좌석 모두 보기
	    var str = [], item;
	    $.each($('#place li.' + settings.selectingSeatCss + ' a'), function (index, value) {
	        item = $(this).attr('title');                   
	        str.push(item);                   
	    });
	    alert(str.join(','));
	})
