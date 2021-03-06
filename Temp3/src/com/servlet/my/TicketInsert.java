package com.servlet.my;

import java.io.IOException;
import java.sql.SQLException;

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
		
		
		//??????????????? ???????????? ??????.
		 System.out.println(MovieDate);
		 System.out.println(MovieTime);
		 System.out.println(ticketName);
		 System.out.println("--------------");
		 
		 
		//????????? ??? ???????????? ??????????????? result1??? ?????? ????????????. //????????? ??????????????? ?????? ?????????
		if(b) {request.setAttribute("result1", "???????????????");
		}
		else {request.setAttribute("result1", "????????????");
		}
		RequestDispatcher rd1 = request.getRequestDispatcher("result.jsp");
		rd1.forward(request, response);
	}

}
