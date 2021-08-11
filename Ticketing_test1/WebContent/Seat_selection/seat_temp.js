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
        //시리얼 7자리를 위해 prefix 사용.
        floorCssPrefix1: '1F',
        floorCssPrefix2: '2F', //2층의 경우 모두 S석이다.
        
        //A,B,C 구역으로 나누게 된다.
        //area에 따른 css를 쓸지는 모르겠지만 일단 css.
        areaCssPrefix1: 'A', 
        areaCssPrefix2: 'B',
        areaCssPrefix3: 'C',
        
        /*rowCssPrefix: 'row',
        colCssPrefix: 'col', 일단 순서만으로 구분하도록 하자*/
        
        /*blockCssPrefix: '',*/
        
        seatWidth: 22,
        seatHeight: 22,
        seatCss: 'seat',
        selectedSeatCss: 'selectedSeat',
        disableSeatCss: 'disableSeat', //시야 방해석이라서 선택하지 않고 공간으로 두는 css를 적용한다.
        selectingSeatCss: 'selectingSeat'
    };



//1. 블록 표시하기

//재선언 불가. const 지정값. 안보여서 일단 var로 바꿔봄.
var bookedSeats = ['seat1FB0111', 'seat1FA0909', 'seat1FC0521']; /*예매된 좌석 번호를 임의로 지정해 주었음. */
//시야 제한석이라서 화면에 보이지 않게 될 좌석 배열.
var disableSeats = ['seat1FA0101','seat1FA0102','seat1FA0103','seat1FA0104','seat1FC0127','seat1FC0128','seat1FC0129','seat1FC0130',
					'seat1FA0201','seat1FA0202','seat1FA0203', 'seat1FC0228','seat1FC0229','seat1FC0230',
					'seat1FA0301','seat1FA0302', 'seat1FC0329','seat1FC0330',
					'seat1FA0401','seat1FC0430'];

function blockA (already,blocked){ //이미 예약된 좌석 정보가 있는지 배열로 넣어두어야 한다. 지금은 인자를 안받는 함수로 했는데... 또 오류 나면 disable, selected를 인자로 받도록 수정할 예정.
	var str= [];
	var className;
	//블록A-------------------------------------------------------------------------------------------//
	for (i=1;i<=settings.rows;i++){ //여기서 rows는 10
		for(j=1;j<=settings.cols;j++){ //여기서 cols는 10
			
			//string으로 구성된 7자리 좌석 시리얼 넘버. 예시 1FA0101  1층 A구역 1열 1번  ----> 그런데 class 이름에  따라 style을 부가하기 위해서 앞에 seat을 붙여줌
			//한 자리 수일 경우 앞에 0을 붙여준다. 	 value.toString().length<2?'0'+value:value
			//문자열 연결 방식
			className = settings.seatCss.concat(settings.floorCssPrefix1,settings.areaCssPrefix1, i.toString().length<2?'0'+i:i, j.toString().length<2?'0'+j:j);
			console.log(className); //예시 seat1FA0101
			
			//clasName을 잘라서 화면에 나올 때는 보기 좋도록 수정한다.
			var floor = className.toString().slice(4,5); //첫번째 글자는 층을 의미.
			var area  = className.toString().slice(6,7); //세번째 글자는 구역을 의미.
			var line =  className.toString().slice(7,9); //4,5 번째 글자는 열 번호를 의미.
			var number = className.toString().slice(9,11); //6,7번째 글자는 번. 왼쪽으로부터 몇 번째 칸인지 번지를 의미.			
			var seat_info = floor+"층"+area+"구역"+line+"열"+number+"번";
			console.log(seat_info);
			
			if ($.isArray(already) && $.inArray(className,already) != -1) {   //const로 선언한 배열을 사용하는데... 오류가 나지않는지 확인하자.
															//선택 불가 좌석 목록에 속해 있다면
                className += ' ' + settings.selectedSeatCss; //selectedSeat이라는 태그가 뒤에 붙는다.
                console.log(className)
            }
			else if($.inArray(className,blocked) !=-1){ //시야 방해석 해당 좌석이라면 화면에 출력하지 않는다. 배열에서 빼기.
				className += ' ' + settings.disableSeatCss; //disableSeat이라는 태그가 뒤에 붙는다. 배경색과 똑같은 색으로 처리. 없는 것처럼.
				console.log(className)
			}
            str.push('<li class="' + className + '"' + 
            		'style="top:' + (i * settings.seatHeight).toString() + 'px;left:' 
            					  + (j * settings.seatWidth).toString() + 'px">'+
            					'<a title="' +seat_info+ '">'+' '+ '</a>'  //좌석 정보가 나오도록. 좌석에 번호가 씌여있지는 않지만 마우스를 갖다대면 정보가 출력된다.
            					+'</li>'); //float:left -> 가로 방향으로 좌석을 배치한다. li 특성.
             //0: "<li class=\"seat1FA0101\"style=\"top:22px;left:22px\"><a title=\"1층A구역01열01번\"></a></li>"
        }
		
		}
	console.log(str);
	$('#place').html(str.join('')); //place라는 id 태그에 붙는다. 해당 태그는 ul이다.
};
/*
const sumArr =[
	bookedSeats, disableSeats
]; */
blockA(bookedSeats,disableSeats); //실행--------------------//

$('.' + settings.seatCss).click(function () {
	if ($(this).hasClass(settings.selectedSeatCss)){ //버튼의 해당 클래스를 쫓아서 간다.
	    alert('다른 고객님이 결제 중인 좌석입니다.');
	}
	else{
	    $(this).toggleClass(settings.selectingSeatCss); //선택 좌석은 토글 방식으로, 선택 or 취소 자유로움.
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
