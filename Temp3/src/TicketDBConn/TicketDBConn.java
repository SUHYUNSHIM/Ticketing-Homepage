package TicketDBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class TicketDBConn {
	
	private Connection con;
	
	public TicketDBConn() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
		
		
	}
	
	public Connection getConnection() {
		return con;
	}

}
