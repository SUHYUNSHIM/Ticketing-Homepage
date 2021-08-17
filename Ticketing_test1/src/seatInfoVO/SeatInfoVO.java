package seatInfoVO;

import java.sql.Date;

public class SeatInfoVO {
	//선언해야 하는 필드명
	//공연 이름, 공연 시각, 공연날짜, 전체 좌석수, VIP 좌석수, R석 좌석 수, S석 좌석수
	//공연 장소 , 출연진(캐스팅 보드)
	private String pName;
	private Date pDate; //Date sql로 타입을 지정했음. 오류가 나는지 확인.
	private String pTime;
	private int total_seat;
	
	private int vip_seat;
	private int r_seat;
	private int s_seat;
	
	private String pLocate; //어디까지 넣어야 할까.
	private String casting_board;
	
	public SeatInfoVO() {}
	public SeatInfoVO(String pName, String pTime, Date pDate, int total_seat ) { //좌석 정보 테이블과 공연 정보 테이블을 어떻게 나누고, relation이 될지 고민중...
		this.pName= pName;
		this.pTime = pTime;
		this.pDate = pDate;
		this.total_seat = total_seat;
	}
	//생성자를 어느 정도까지 만들어야 하나 고민중.
	//등급 별로 잔여석을 만들어야 할까 
}
