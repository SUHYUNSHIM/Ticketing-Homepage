package seatInfoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import seatInfoDBConn.SeatInfoDBConn;
import seatInfoVO.SeatInfoVO;


public class SeatInfoDAO {

	private Connection con;	
	PreparedStatement pstmt=null;
	ResultSet rs=null;				
	
	
	public SeatInfoDAO() throws ClassNotFoundException, SQLException {
		con=new SeatInfoDBConn().getConnection();  	 
											
	}
	
	public void pstmtClose() throws SQLException {
		if(pstmt != null) 
			pstmt.close();
	}
	
	public void getAllInfoClose() throws SQLException {
		if(rs != null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(con != null)
			con.close();
	}
	
	//잔여석 계산을 위해 선택된 좌석 정보를 모두 가져오는 method --> count 함수를 쓰자.------------------------------*****
	public ArrayList<SeatInfoVO> getAllInfo() throws SQLException{
		ArrayList<SeatInfoVO> siarray = new ArrayList<SeatInfoVO>();
		String sql = "select s1_id,s2_id,s3_id from member_seat where pid=?";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			String s_id = rs.getString("s-id");
			
			SeatInfoVO sv = new SeatInfoVO(s_id);
			siarray.add(sv);
		}
		return siarray;
	}
	
	//사용자가 선택한 모든 좌석정보들을 가져오기 위해서 아이디로 검색. 유저아이디, 좌석번호, 공연시리얼번호, 공연이름이 출력된다.**************
	public SeatInfoVO getInfo(String id) throws SQLException{
		SeatInfoVO sv = null;
		String sql = "select * from member_seat where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			String u_id = rs.getString("id"); //유저아이디
			String s1_id = rs.getString("s1_id"); //좌석번호1
			String s2_id = rs.getString("s2_id"); //좌석번호2
			String s3_id = rs.getString("s3_id");//좌석번호3
			String p_id = rs.getString("p_id"); //공연 시리얼번호
			String p_name = rs.getString("p_name"); //공연이름
			sv = new SeatInfoVO(id,s1_id,s2_id, s3_id,p_id,p_name);
		}else {
			sv = null;
		}
		return sv; //객체 반환
	}
	//회차 선택 시 만들어지는 테이블. 2개 이상의 좌석을 선택 시, insert s
	//사용자는 공연 회차 선택 단계에서 member_seat 테이블에 사용자 id, 공연이름 pname, 공연시리얼 번호 p_id만 썼다. 
	public boolean insert_selected_perform (String id, String p_id, String p_name) {
		String sql="insert into member_seat(id,p_id,p_name) values(?,?,?)";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, p_id);
			pstmt.setString(3, p_name);
	
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Insert Exception");
			return false;
		}
		return true;
	}
	
	
	
	
	//**********************************************************좌석 선택 시 udpate 되는 테이블 ****************************//	
	//좌석 선택 창에서 선택한 좌석이 들어간다.member_seat 테이블의 좌석 칼럼(s1_id, s2_id, s3_id)에만 값을 더한다.
	//s1_id가 null인 경우를 조건에 넣은 이유는 s1,s2,s3 순서로 넣기 때문에, 제일 처음 값이 null이면 좌석 선택 단계를 거치지 않은 것이기 떄문이다.
	//사용자는 공연 회차 선택 단계에서 member_seat 테이블에 사용자 id, 공연이름 pname, 공연시리얼 번호 p_id만 썼다. 좌석 선택 칼럼만 null인 상태.
	public boolean update_seat(String id, String p_id, String s1_id, String s2_id, String s3_id) {
		String sql = "update member_seat set s1_id =?, s2_id =?, s3_id =? where s1_id is null and id=? and p_id =?";		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, s1_id); //좌석번호1
			pstmt.setString(2, s2_id); //좌석번호2
			pstmt.setString(3, s3_id); //좌석번호3
			pstmt.setString(4, id); //사용자 id
			pstmt.setString(5, p_id); //공연회차 id
			
			pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println("좌석 입력 오류");
			return false;
		}
		return true;
	}
	
	//이전 단계 버튼을 누르면 자신이 선택한 좌석 정보가 날라간다. 지금 예매 중인 사용자의 아이디,공연회차 id 검색해서 해당 좌석만 테이블에서 지워지도록 한다.
	public boolean delete_seat(String id,String p_id) {
		String sql="delete from member_seat where id=? and p_id=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);   //유저 아이디
			pstmt.setString(2, p_id); //공연회차 id(시리얼 번호)
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Delete Exception");
			return false;
		}
		return true;
	} 
	
}
