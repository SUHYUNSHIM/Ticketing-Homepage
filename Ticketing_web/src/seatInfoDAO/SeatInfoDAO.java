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
	
	//insert
	public boolean insert_tempSeat(String seats) {
		String sql = "insert into temp_selecting values(?)";
		//좌석 선택 창에서 선택한 좌석이 들어간다.
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, seats); //좌석 문자열 넣기
			pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println("좌석 입력 오류");
			return false;
		}
		return true;
	}
	
}
