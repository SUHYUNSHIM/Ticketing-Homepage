package seatInfoVO;

import java.sql.Date;
public class SeatInfoVO {

	//
	private String u_id; //로그인 시 값을 입력받는다. 유저 아이디	
	private String s_id; //좌석번호
	private String p_id; //공연 시리얼 번호
	private String p_name; //공연이름
	
	public SeatInfoVO(String u_id, String s_id, String p_id, String p_name) {
		super();
		this.u_id = u_id;
		this.s_id = s_id;
		this.p_id = p_id;
		this.p_name = p_name;
	}	
	
	//+ 선택한 좌석 수 칼럼 count로 몇 석인지 구할 수 있음
	//+좌석 등급. 현재 목표하는 저장 형식이 ex)1층A구역09열10번 VIP. 
	//여기서 등급이 시작하는 13번째 인덱스 부터 끝까지가 class 이름이다. 문자열 자르기 (java에서 아님 sql에서)
	
	public SeatInfoVO() {}
	
	//선택된 좌석 정보만 가져오기 위한(잔여석 계산 관련) 생성자 
	public SeatInfoVO(String s_id) {
		this.s_id = s_id;
	}	
	
	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public SeatInfoVO(String u_id, String s_id, String  p_name) {
		//super();
		this.u_id = u_id;
		this.s_id = s_id;
		this. p_name=  p_name;
	}
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	
	
	
}
