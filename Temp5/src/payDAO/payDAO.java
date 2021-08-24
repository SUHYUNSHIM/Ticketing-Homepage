package payDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import payDBConn.PayDBConn;
import payVO.ForpayVO;
import payVO.PayVO;


public class payDAO {

   private Connection con;
   PreparedStatement pstmt = null;
   Statement stmt = null;
   ResultSet rs = null;
   
   public payDAO() throws ClassNotFoundException, SQLException {
      con = new PayDBConn().getConnection();
   }
   
   public boolean insertInfo(String name, String email, String phone, String adr, int pay, String book, String payway) {
      String sql = "insert into payment values (?,?,?,?,?,?,?)";
      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, name);
         pstmt.setString(2, email);
         pstmt.setString(3, phone);
         pstmt.setString(4, adr);
         pstmt.setInt(5, pay);
         pstmt.setString(6, book);
         pstmt.setString(7, payway);
         pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
         System.out.println("insert Exception");
         return false;
      }
      return true;
   }
   
   public ForpayVO payInfo(String name) throws SQLException{
         ForpayVO pv = null;
         String sql = "select name, email, phone, address from member where name=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, name);
         rs = pstmt.executeQuery();    
         System.out.println("payinfo--");
         if(rs.next()) {
           System.out.println("db연동완료---");
            String name1 = rs.getString(1);
            String email = rs.getString(2);
            String phone = rs.getString(3);
            String address = rs.getString(4);
            
            pv = new ForpayVO(name1, email, phone, address);
            System.out.println(pv.toString());
         
         }else {
            pv = null;
         }
         System.out.println(pv + "pv값 출력");
         return pv;
      }
   
   
   
}