<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택화면</title>
</head>
<body>
<link rel="stylesheet" href="style.css"/>
<script src="js/jquery-3.3.1.js"></script>
<!-- <script type="text/javascript" src="setting.js"></script> -->

</head>

<body>
<div id="holder">
	<ul id="place">
	</ul>
</div>
	<div style="float:left;">
	<ul id="seatDescription">
		<li style="background:url('images/check.png') no-repeat scroll 0 0 transparent;">잔여석</li>
		<li style="background:url('images/close.png') no-repeat scroll 0 0 transparent;">이미 선택된 좌석</li>
		<li style="background:url('images/select.png') no-repeat scroll 0 0 transparent;">선택한 좌석</li> 
		
	</ul>
	</div>
	<div style="clear:both;width:100%">
	<input type="button" id="btnShowNew" value="선택한 좌석"/>
	<input type="button" id="btnShow" value="선택된 좌석 모두 보기"/>
	</div>
<script>
var settings = {
        rows: 5,
        cols: 20,
        
        //블록 나누기를 위해서 간격을 주어야 한다.
        rowCssPrefix: 'row-',
        colCssPrefix: 'col-',
        seatWidth: 22,
        seatHeight: 22,
        seatCss: 'seat',
        selectedSeatCss: 'selectedSeat',
        selectingSeatCss: 'selectingSeat'
    };

var init = function (reservedSeat) { //영역 별로 좌석 등급이 다름. 다른 색깔의 버튼으로 block 만들기.숫자 좌석위에서 지우기. 숫자 방향 바꾸기.
    var str = [], seatNo, className;
    for (i = 0; i < settings.rows; i++) {
        for (j = 0; j < settings.cols; j++) {
            seatNo = (i + j * settings.rows + 1);
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
//처음 티켓 오픈했을 경우.
//init();

//이미 예매된 좌석이 있는 경우.
var bookedSeats = [5, 10, 25]; /*예매된 좌석 번호를 임의로 지정해 주었음. */
init(bookedSeats);

$('.' + settings.seatCss).click(function () {
	if ($(this).hasClass(settings.selectedSeatCss)){
	    alert('다른 고객님이 결제 중인 좌석입니다.');
	}
	else{
	    $(this).toggleClass(settings.selectingSeatCss);
	    }
	});
	 
	$('#btnShow').click(function () {
	    var str = [];
	    $.each($('#place li.' + settings.selectedSeatCss + ' a, #place li.'+ settings.selectingSeatCss + ' a'), function (index, value) {
	        str.push($(this).attr('title'));
	    });
	    alert(str.join(','));
	})
	 
	$('#btnShowNew').click(function () {
	    var str = [], item;
	    $.each($('#place li.' + settings.selectingSeatCss + ' a'), function (index, value) {
	        item = $(this).attr('title');                   
	        str.push(item);                   
	    });
	    alert(str.join(','));
	})

</script>
</body>
</html>