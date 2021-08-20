package seatInfoVO;

import java.sql.Date;
public class SeatInfoVO {

	private String select_seat; //좌석번호
	//private int num;   //선택한 좌석 수 
	//private String seat_class; //좌석 등급 -> 결제가격 매기기 위해서 

	//일단 클래스 제외, 좌석 정보만.
	
	public SeatInfoVO(String temp_seat) {
		//super();
		this.select_seat = temp_seat;
	}
	
	
	public String getTemp_seat() {
		return select_seat;
	}

	public void setTemp_seat(String temp_seat) {
		this.select_seat = temp_seat;
	}
	
	
}
