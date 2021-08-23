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
		System.out.println("좌석들 "+ seats);
		
		//char seat_class[] = {'V','R','S'}; //VIP이지만 첫글자 V 기준으로 자르려고.
		String[] seatArr = {};
		//char[] arr = seats.toCharArray(); //문자열을 문자 배열로 변환.
		if(seats.length() !=0) { //입력받은 값이 0이 아니라면 			
			seatArr = seats.split("  ");
			
			for(int i=0;i<seatArr.length;i++) {
				System.out.println(seatArr[i]);
			}
		}			
		
		else {
			//아무것도 선택하지 않고 다음을 눌렀을 때는 또 따로 예외처리 해야 한다.
			System.out.println("좌석 선택해야지!");
		}
		
	
		
		
		//RequestDispatcher rd1 = request.getRequestDispatcher("../Payment/total_payment.jsp");
		//rd1.forward(request, response);
		
	}

}
