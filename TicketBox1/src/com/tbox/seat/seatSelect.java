package com.tbox.seat;

import java.io.IOException;
import java.io.PrintWriter;

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
			response.setContentType("text/html; charset=UTF-8");

			
			PrintWriter writer = response.getWriter();
			
			String PageUrl = request.getContextPath()+"/Seat_selection/Seat_main.jsp";
			writer.println("<script>alert('좌석을 한 개 이상 선택해 주세요'); location.href='"+PageUrl+"';</script>"); 
			writer.close();
			
			response.sendRedirect(PageUrl);  //좌석을 선택하지 않고 다음화면으로 넘어가려고 하는 경우

		}
		
		System.out.println("좌석 배열 첫번째 값: "+ seatArr[0]); //잘 들어갔는지 테스트. -> 잘들어감.
		
		//DB와 연결하는 부분.//////////////////////////////////////**좌석 값을 순서대로 쓰는 함수를 dao에서 가져온다.
		SeatInfoDAO sidao = null;
		SeatInfoVO sv = null;
		
		
		
		
		///////////////////////////////////////*************************************************
		
		HttpSession session = request.getSession();
		
		if(seatArr.length==1) {
			String s1_id = seatArr[0]; //첫 번째 좌석.
			session.setAttribute("s1_id", s1_id);
			session.setAttribute("s2_id", ""); ///값이 없을 경우-> 한개, 두 개만 선택했을 경우, 남은 좌석 번호는 ""로 보낸다.
			session.setAttribute("s3_id", "");
		}
		else if(seatArr.length==2) {
			String s1_id = seatArr[0]; //첫 번째 좌석.
			String s2_id = seatArr[1]; //두 번째 좌석.
			session.setAttribute("s1_id", s1_id);
			session.setAttribute("s2_id", s2_id);
			session.setAttribute("s3_id", "");
		}
		else if(seatArr.length==3) {
			String s1_id = seatArr[0]; //첫 번째 좌석.
			String s2_id = seatArr[1];
			String s3_id = seatArr[2];
			
			session.setAttribute("s1_id", s1_id);
			session.setAttribute("s2_id", s2_id);
			session.setAttribute("s3_id", s3_id);
		}
		
		//////////////////////////////////금액 계산하는 부분
		
		int total_pay = 0;
		
		for(int i=0;i<seatArr.length;i++) {
			
			char[] arr = seatArr[i].toCharArray();	
			
			for(int j=0;j<arr.length;j++) { 
				if(arr[j] == 'V') {
				 total_pay+=150000;	
				}
				else if(arr[j] == 'R') {
					total_pay +=130000;
				}
				else if(arr[j] =='S') {
					total_pay += 100000;
				}
			}
		}
		
		session.setAttribute("total_pay", total_pay); //총 지불 금액.(기본가)
		
		response.sendRedirect("Payment/total_payment.jsp");
		
		//RequestDispatcher rd1 = request.getRequestDispatcher("../Payment/total_payment.jsp");
		//rd1.forward(request, response);
		
	}

}
