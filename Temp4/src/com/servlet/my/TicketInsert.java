package com.servlet.my;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import TicketDAO.TicketDAO;
//table
/*ticketName varchar2(30) not null,
MovieDate varchar2(20) not null,
MovieTime varchar2(20) not null,
MovieSeat varchar2(20) not null */ 

/////////////////////////////////////////////////////////////

/**
 * Servlet implementation class TicketInsert
 */
@WebServlet("/TicketInsert")
public class TicketInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TicketInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		TicketDAO td1= null;
		try {
			td1 = new TicketDAO();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int id = 111;   //Integer.parseInt(request.getParameter("id"));
		String ticketName = request.getParameter("ticketName");
		String MovieDate = request.getParameter("selectedDate");
		String MovieTime = request.getParameter("MovieTime"); 
		String MovieSeat = "A3"; //request.getParameter("MovieSeat");
		
	
		
		Boolean b = td1.insertTicketData(id, ticketName, MovieDate, MovieTime, MovieSeat);
		//넘어가는지 확인하기 위해.
		 System.out.println(MovieDate);
		 System.out.println(MovieTime);
		 System.out.println(ticketName);
		 System.out.println("--------------");
		 
		 
		//결과가 잘 나왔는지 확인하려면 result1의 값을 설정한다. //여기는 입력확인을 위한 페이지
		//완성본에선 삭제 해야할 부분. 
		if(b) {request.setAttribute("result1", "입력잘됐음");
		}
		else {request.setAttribute("result1", "입력오류");
		}
		RequestDispatcher rd1 = request.getRequestDispatcher("result.jsp");
		rd1.forward(request, response);
	}

}