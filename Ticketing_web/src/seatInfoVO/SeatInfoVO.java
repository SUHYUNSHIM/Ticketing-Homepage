package seatInfoVO;

import java.sql.Date;
public class SeatInfoVO {

	//좌석 선택 완료 전 선택한 좌석을 seat_main jsp에 출력하기 위한 것들.
	private String temp_seat; //좌석번호
	//private int num;   //선택한 좌석 수 
	//private String seat_class; //좌석 등급 -> 결제가격 매기기 위해서 

	//일단 클래스 제외, 좌석 정보만.
	
	public SeatInfoVO(String temp_seat) {
		//super();
		this.temp_seat = temp_seat;
	}
	
	
	public String getTemp_seat() {
		return temp_seat;
	}

	public void setTemp_seat(String temp_seat) {
		this.temp_seat = temp_seat;
	}
	
	
}
