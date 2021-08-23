package com.tbox.seat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class seatController
 */
@WebServlet("/seatController")
public class seatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public seatController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//String seats = request.getParameter("seats");
	/*	String[] paramValue = request.getParameterValues("seats"); //(String[]) cast	
		System.out.println(paramValue.length);
		System.out.println("원래 나와야 하는 것: "+paramValue[0]);*/
		
		String seats =  request.getParameter("seats");
		System.out.println(seats);
		
		String seat_class[] = {"VIP","R","S"};
		while(true) {
			//seats
			//seats 일치하는 단어가 있으면 자른다. 자른 문자열의 원소로 들어간다.
		}
	
		
		
		//RequestDispatcher rd1 = request.getRequestDispatcher("../Payment/total_payment.jsp");
		//rd1.forward(request, response);
		
	}

}
