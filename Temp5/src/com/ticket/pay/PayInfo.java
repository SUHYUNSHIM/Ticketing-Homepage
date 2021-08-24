package com.ticket.pay;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payDAO.payDAO;
import payVO.ForpayVO;
import payVO.PayVO;

/**
 * Servlet implementation class PayInfo
 */
@WebServlet("/PayInfo")
public class PayInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @param  
     * @see HttpServlet#HttpServlet()
     */
    public PayInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		String name = request.getParameter("name");
		String kaja = null;
		ForpayVO pv1 = null;
		System.out.println(name);
		try {
			payDAO pd1 = new payDAO();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		request.setAttribute("pv1", pv1);
		kaja = "./Pay/result1.jsp";
		RequestDispatcher rd1 = request.getRequestDispatcher(kaja);
		rd1.forward(request, response);
	}

}
