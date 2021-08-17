package seatInfoVO;

public class SeatInfoVO {
	//선언해야 하는 필드명
	//공연 이름, 공연 시각, 공연날짜, 전체 좌석수, VIP 좌석수, R석 좌석 수, S석 좌석수
	//공연 장소 , 출연진(캐스팅 보드)
	private String pName;
	private String pTime;
	private int total_seat;
	private int vip_seat;
	private int r_seat;
	private int s_seat;
	
	private String plocation;
	private String casting_board;
	
	public SeatInfoVO() {}
	public SeatInfoVO(String pName, String pTime, int total_seat ) {
		this.pName= pName;
		this.pTime = pTime;
		this.total_seat = total_seat;
	}
	//생성자를 어느 정도까지 만들어야 하나 고민중.
	//등급 별로 잔여석을 만들어야 할까 
}
