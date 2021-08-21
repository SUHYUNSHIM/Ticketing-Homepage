package seatInfoVO;

import java.sql.Date;
public class SeatInfoVO {

	//
	private String u_id; //로그인 시 값을 입력받는다.
	//private String t_id; //ticket_id 즉 예매번호 --- 결제 번호와는 구분 지어야? p_id (결제번호)
	private String s_id; //좌석번호
	//private int num;   //선택한 좌석 수 --> count 컬럼으로 해결.
	private String seat_class; //좌석 등급 -> 결제가격 매기기 위해서 
	
	
	
}
