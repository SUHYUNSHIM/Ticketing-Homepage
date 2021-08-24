package com.tbox.seat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import seatInfoDAO.SeatInfoDAO;
import seatInfoVO.SeatInfoVO;

/**
 * Servlet implementation class seatController
 */
@WebServlet("/seatSelect")
//@WebServlet("*.do") 
public class seatSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public seatSelect() {
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
	
		String seats =  request.getParameter("seats");
		System.out.println("좌석들 "+ seats);
				
		String[] seatArr = {};
		
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
		
		System.out.println("좌석 배열 첫번째 값: "+ seatArr[0]); //잘 들어갔는지 테스트. -> 잘들어감.
		
		//DB와 연결하는 부분.
		SeatInfoDAO sidao = null;
		SeatInfoVO sv = null;
	/*	for(int i=0;i<seatArr[i].length();i++) {
			
		}*/
		
		String s1_id = seatArr[0];
		String s2_id = seatArr[1];
		String s3_id = seatArr[2];
		
	/*	if()*/
		
		//request.setAttribute("s1_id", s1_id);
		//request.setAttribute("s2_id", s2_id);
		//request.setAttribute("s3_id", s3_id);
		HttpSession session = request.getSession();
		session.setAttribute("s1_id", s1_id);
		session.setAttribute("s2_id", s2_id);
		session.setAttribute("s3_id", s3_id);
		
		response.sendRedirect("Payment/total_payment.jsp");
		
		//RequestDispatcher rd1 = request.getRequestDispatcher("../Payment/total_payment.jsp");
		//rd1.forward(request, response);
		
	}

}
