//rows -> 가로 15줄 
//cols -> 세로 30줄

//좌석번호 예시) 1층 B구역 7열 17번
//11줄부터 15줄은 2층, S석으로 구분된다.
//중앙 5열 블록부터 10열블록까지 + A구역, C구역 두 줄까지 VIP 석으로 지정
//1층의 VIP 석 제외의 구간은 R구역이다.
//VIP, R,S 구역에 따라서 좌석 색깔을 다르게 한다.*****
//좌석 열번호(통로), 구역명칭은 표기되어야 한다. 사용자의 편의를 위해.
//1인당 판매 좌석수를 4개로 제한시킨다.이것을 집계하는 함수도 controller에서 처리한다.
//선택한 좌석 번호를 controller에 보낸다. 잔여좌석을 계산하여 mainframe view 우측에 출력한다.
//2층은 count가 1열부터 다시 된다.
//+선택한 좌석을 결제 종료 후 화면에서 좌석도로 다시 볼 수 있을까?

//데이터베이스 저장시 편의를 위해 만든 것. java 문자열 자르기로 출력 가능. 
var settings = {
        rows: 10, //1층
        cols: 10,
        
        rows2: 5, //2층은 5줄이다.
        cols2: 10,
        	
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
        
        seatWidth: 20,
        seatHeight: 20,
        seatCss: 'seat',
        selectedSeatCss: 'selectedSeat',
        disableSeatCss: 'disableSeat', //시야 방해석이라서 선택하지 않고 공간으로 두는 css를 적용한다.
        selectingSeatCss: 'selectingSeat'
    };



//1. 블록 표시하기

//재선언 불가. const 지정값. 안보여서 일단 var로 바꿔봄.
var bookedSeats = ['seat 1FB0111', 'seat 1FA0909', 'seat 1FC0521']; /*예매된 좌석 번호를 임의로 지정해 주었음. */
//시야 제한석이라서 화면에 보이지 않게 될 좌석 배열.
var disableSeats = ['seat 1FA0101','seat 1FA0102','seat 1FA0103','seat 1FA0104','seat 1FC0127','seat 1FC0128','seat 1FC0129','seat 1FC0130',
					'seat 1FA0201','seat 1FA0202','seat 1FA0203', 'seat 1FC0228','seat 1FC0229','seat 1FC0230',
					'seat 1FA0301','seat 1FA0302', 'seat 1FC0329','seat 1FC0330',
					'seat 1FA0401','seat 1FC0430'];
var str= [];

//[블록A 1층] -------------------------------------------------------------------------------------------//
function blockA1 (already,blocked){ //이미 예약된 좌석 정보가 있는지 배열로 넣어두어야 한다. 지금은 인자를 안받는 함수로 했는데... 또 오류 나면 disable, selected를 인자로 받도록 수정할 예정.
	
	var className;	

	for (i=1;i<=settings.rows;i++){ //여기서 rows는 10
		for(j=1;j<=settings.cols;j++){ //여기서 cols는 10
			
			//string으로 구성된 7자리 좌석 시리얼 넘버. 예시 1FA0101  1층 A구역 1열 1번  ----> 그런데 class 이름에  따라 style을 부가하기 위해서 앞에 seat을 붙여줌
			//한 자리 수일 경우 앞에 0을 붙여준다. 	 value.toString().length<2?'0'+value:value
			//문자열 연결 방식
					
			className = settings.seatCss.concat(" ",settings.floorCssPrefix1,settings.areaCssPrefix1, i.toString().length<2?'0'+i:i, j.toString().length<2?'0'+j:j);
			console.log(className);
			
			//clasName을 잘라서 화면에 나올 때는 보기 좋도록 수정한다.
			var floor = className.toString().slice(5,6); //층
			var area  = className.toString().slice(7,8); //구역
			var line =  className.toString().slice(8,10); //열 번호
			var number = className.toString().slice(10,12); //왼쪽으로부터 몇 번째 칸인지 번지를 의미.			
			var seat_info = floor+"층"+area+"구역"+line+"열"+number+"번";
			console.log(seat_info);
			
			if ($.isArray(already) && $.inArray(className,already) != -1) {   
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
           }
		
		}
	console.log(str);
	$('#place').html(str.join('')); //place라는 id 태그에 붙는다. 해당 태그는 ul이다.
};
blockA1(bookedSeats,disableSeats); //실행--------------------//
//[블록A 2층]-----------------------------------------------------------------------------------------//
function blockA2 (already){
	
	var className;	
	
	for (i=1;i<=settings.rows2;i++){ //여기서 rows는 5
		for(j=1;j<=settings.cols2;j++){ //여기서 cols는 10
															//2F
			className = settings.seatCss.concat(" ",settings.floorCssPrefix2,settings.areaCssPrefix1, i.toString().length<2?'0'+i:i, j.toString().length<2?'0'+j:j);
			console.log(className);
			
			//clasName을 잘라서 화면에 나올 때는 보기 좋도록 수정한다.
			var floor = className.toString().slice(5,6); //층
			var area  = className.toString().slice(7,8); //구역
			var line =  className.toString().slice(8,10); //열 번호
			var number = className.toString().slice(10,12); //왼쪽으로부터 몇 번째 칸인지 번지를 의미.			
			var seat_info = floor+"층"+area+"구역"+line+"열"+number+"번";
			console.log(seat_info);
			
			if ($.isArray(already) && $.inArray(className,already) != -1) {   
															//선택 불가 좌석 목록에 속해 있다면
                className += ' ' + settings.selectedSeatCss; //selectedSeat이라는 태그가 뒤에 붙는다.
                console.log(className)
            }
			//2층은 시야 방해되는 곳이 없다고 가정한다.
			var new_height = i*settings.seatHeight+240;
			console.log(new_height);
            str.push('<li class="' + className + '"' + 
            		'style="top:'+(new_height).toString() + 'px;left:' 
            					  + (j * settings.seatWidth).toString() + 'px">'+
            					'<a title="' +seat_info+ '"></a>'  //좌석 정보가 나오도록. 좌석에 번호가 씌여있지는 않지만 마우스를 갖다대면 정보가 출력된다.
            					+'</li>'); //float:left -> 가로 방향으로 좌석을 배치한다. li 특성.  
            //'<a title="' + seatNo + '">' + seatNo + '</a>' +'</li>'); 
            console.log(seat_info);
        }
		
		}
	console.log(str);
	$('#place').html(str.join('')); //place라는 id 태그에 붙는다. 해당 태그는 ul이다.
};
blockA2(bookedSeats);
//[블록 B 1층]-----------------------------------------------------------------------------------------------------------//
function blockB (already){
var className;
		
	for (i=1;i<=settings.rows;i++){ //여기서 rows는 10
		for(j=1;j<=settings.cols;j++){ //여기서 cols는 10
			
			className = settings.seatCss.concat(" ",settings.floorCssPrefix1,settings.areaCssPrefix2, 
					i.toString().length<2?'0'+i:i, 10+j);
			console.log(className);
			
			//clasName을 잘라서 화면에 나올 때는 보기 좋도록 수정한다.
			var floor = className.toString().slice(5,6); //층
			var area  = className.toString().slice(7,8); //구역
			var line =  className.toString().slice(8,10); //열 번호
			var number = className.toString().slice(10,12); //왼쪽으로부터 몇 번째 칸인지 번지를 의미.			
			var seat_info = floor+"층"+area+"구역"+line+"열"+number+"번";
			console.log(seat_info);
			
			if ($.isArray(already) && $.inArray(className,already) != -1) {   
															//선택 불가 좌석 목록에 속해 있다면
                className += ' ' + settings.selectedSeatCss; //selectedSeat이라는 태그가 뒤에 붙는다.
                console.log(className)
            }
			//블록 B와 2층에는 시야 방해되는 곳이 없다. 따라서 빈 좌석 없음. 
			var new_width = j*settings.seatHeight+230;
			
            str.push('<li class="' + className + '"' + 
            		'style="top:' + (i * settings.seatHeight).toString() + 'px;left:' 
            					  + (new_width).toString() + 'px">'+
            					'<a title="' +seat_info+ '">'+' '+ '</a>'  //좌석 정보가 나오도록. 좌석에 번호가 씌여있지는 않지만 마우스를 갖다대면 정보가 출력된다.
            					+'</li>'); //float:left -> 가로 방향으로 좌석을 배치한다. li 특성.
           }
		
		}
	console.log(str);
	$('#place').html(str.join('')); //place라는 id 태그에 붙는다. 해당 태그는 ul이다.
};
blockB(bookedSeats);

//[블록B 2층]----------------------------------------------------------------//
function blockB2 (already){
	var className;		
		
		for (i=1;i<=settings.rows2;i++){ //여기서 rows는 10
			for(j=1;j<=settings.cols2;j++){ //여기서 cols는 10
										
				className = settings.seatCss.concat(" ",settings.floorCssPrefix2,settings.areaCssPrefix2, 
						i.toString().length<2?'0'+i:i, j+10);
				console.log(className);
				
				//clasName을 잘라서 화면에 나올 때는 보기 좋도록 수정한다.
				var floor = className.toString().slice(5,6); //층
				var area  = className.toString().slice(7,8); //구역
				var line =  className.toString().slice(8,10); //열 번호
				var number = className.toString().slice(10,12); //왼쪽으로부터 몇 번째 칸인지 번지를 의미.			
				var seat_info = floor+"층"+area+"구역"+line+"열"+number+"번";
				console.log(seat_info);
				
				if ($.isArray(already) && $.inArray(className,already) != -1) {   
																//선택 불가 좌석 목록에 속해 있다면
	                className += ' ' + settings.selectedSeatCss; //selectedSeat이라는 태그가 뒤에 붙는다.
	                console.log(className)
	            }
				
				var new_height = i*settings.seatHeight+240;
				var new_width = j*settings.seatHeight+230;
	            str.push('<li class="' + className + '"' + 
	            		'style="top:' + (new_height).toString() + 'px;left:' 
	            					  + (new_width).toString() + 'px">'+
	            					'<a title="' +seat_info+ '">'+' '+ '</a>'  //좌석 정보가 나오도록. 좌석에 번호가 씌여있지는 않지만 마우스를 갖다대면 정보가 출력된다.
	            					+'</li>'); //float:left -> 가로 방향으로 좌석을 배치한다. li 특성.
	           }
			
			}
		console.log(str);
		$('#place').html(str.join('')); //place라는 id 태그에 붙는다. 해당 태그는 ul이다.
	};
blockB2(bookedSeats);

//[블록C 1층]----------------------------------------------------------------------//
function blockC (already,blocked){
	var className;
			
		for (i=1;i<=settings.rows;i++){ //여기서 rows는 10
			for(j=1;j<=settings.cols;j++){ //여기서 cols는 10
				
				className = settings.seatCss.concat(" ",settings.floorCssPrefix1,settings.areaCssPrefix3, 
						i.toString().length<2?'0'+i:i, 20+j);
				console.log(className);
				
				//clasName을 잘라서 화면에 나올 때는 보기 좋도록 수정한다.
				var floor = className.toString().slice(5,6); //층
				var area  = className.toString().slice(7,8); //구역
				var line =  className.toString().slice(8,10); //열 번호
				var number = className.toString().slice(10,12); //왼쪽으로부터 몇 번째 칸인지 번지를 의미.			
				var seat_info = floor+"층"+area+"구역"+line+"열"+number+"번";
				console.log(seat_info);
				
				if ($.isArray(already) && $.inArray(className,already) != -1) {   
																//선택 불가 좌석 목록에 속해 있다면
	                className += ' ' + settings.selectedSeatCss; //selectedSeat이라는 태그가 뒤에 붙는다.
	                console.log(className)
	            }
				else if($.inArray(className,blocked) !=-1){ //시야 방해석 해당 좌석이라면 화면에 출력하지 않는다. 배열에서 빼기.
					className += ' ' + settings.disableSeatCss; //disableSeat이라는 태그가 뒤에 붙는다. 배경색과 똑같은 색으로 처리. 없는 것처럼.
					console.log(className)
				} 
				
				var new_width = j*settings.seatHeight+460;
				
	            str.push('<li class="' + className + '"' + 
	            		'style="top:' + (i * settings.seatHeight).toString() + 'px;left:' 
	            					  + (new_width).toString() + 'px">'+
	            					'<a title="' +seat_info+ '">'+' '+ '</a>'  //좌석 정보가 나오도록. 좌석에 번호가 씌여있지는 않지만 마우스를 갖다대면 정보가 출력된다.
	            					+'</li>'); //float:left -> 가로 방향으로 좌석을 배치한다. li 특성.
	           }
			
			}
		console.log(str);
		$('#place').html(str.join('')); //place라는 id 태그에 붙는다. 해당 태그는 ul이다.
	};
blockC(bookedSeats,disableSeats);

//[블록C 2층]----------------------------------------------------------------//
function blockC2 (already){
	var className;		
		
		for (i=1;i<=settings.rows2;i++){ 
			for(j=1;j<=settings.cols2;j++){ 
										
				className = settings.seatCss.concat(" ",settings.floorCssPrefix2,settings.areaCssPrefix3, 
						i.toString().length<2?'0'+i:i, j+20);
				console.log(className);
				
				//clasName을 잘라서 화면에 나올 때는 보기 좋도록 수정한다.
				var floor = className.toString().slice(5,6); //층
				var area  = className.toString().slice(7,8); //구역
				var line =  className.toString().slice(8,10); //열 번호
				var number = className.toString().slice(10,12); //왼쪽으로부터 몇 번째 칸인지 번지를 의미.			
				var seat_info = floor+"층"+area+"구역"+line+"열"+number+"번";
				console.log(seat_info);
				
				if ($.isArray(already) && $.inArray(className,already) != -1) {   
																//선택 불가 좌석 목록에 속해 있다면
	                className += ' ' + settings.selectedSeatCss; //selectedSeat이라는 태그가 뒤에 붙는다.
	                console.log(className)
	            }
				
				var new_height = i*settings.seatHeight+240;
				var new_width = j*settings.seatHeight+460;
	            str.push('<li class="' + className + '"' + 
	            		'style="top:' + (new_height).toString() + 'px;left:' 
	            					  + (new_width).toString() + 'px">'+
	            					'<a title="' +seat_info+ '">'+' '+ '</a>'  //좌석 정보가 나오도록. 좌석에 번호가 씌여있지는 않지만 마우스를 갖다대면 정보가 출력된다.
	            					+'</li>'); //float:left -> 가로 방향으로 좌석을 배치한다. li 특성.
	           }
			
			}
		console.log(str);
		$('#place').html(str.join('')); //place라는 id 태그에 붙는다. 해당 태그는 ul이다.
	};
blockC2(bookedSeats);



$('.' + settings.seatCss).click(function () {
	if ($(this).hasClass(settings.selectedSeatCss)){ //버튼의 해당 클래스를 쫓아서 간다.
	    alert('다른 고객님이 결제 중인 좌석입니다.');
	}
	else if($(this).hasClass(settings.disableSeatCss)){
		alert('좌석을 선택해주세요.')
	}	//시야 방해석-- 화면에 나오지 않는 좌석 영역을 클릭했을 때 반응이 나는 오류를 해결해야 함.
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