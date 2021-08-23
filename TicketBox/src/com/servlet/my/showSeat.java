package com.servlet.my;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.*;
import com.google.gson.Gson;
/*import org.json.simple.JSONObject; 
import org.json.simple.parser.JSONParser;*/
import org.json.simple.parser.JSONParser;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

import TicketDAO.TicketDAO;

/**
 * Servlet implementation class showSeat
 */
@WebServlet("/showSeat")
public class showSeat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showSeat() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		TicketDAO td1= null;
		try {
			td1 = new TicketDAO();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		String MovieName = request.getParameter("MovieName");
		String MovieDate = request.getParameter("MovieDate");
		String MovieTime = request.getParameter("MovieTime");
		
		String p_id1 = MovieName.substring(0,2).toUpperCase();
		String [] imsi = MovieDate.split("-");
		String p_id = (p_id1 + imsi[1]+imsi[2]+MovieTime);
		
		System.out.println(p_id);
		List<Integer> aa = td1.showSeat(p_id);
		System.out.println(aa);
		
		response.setContentType("application/json");
		//response.setContentType("application;charset=json");
		PrintWriter pw = response.getWriter();
		JsonObject json = new JsonObject();
		
		json.addProperty("vip", aa.get(0));
		json.addProperty("r", aa.get(1));
		json.addProperty("s", aa.get(2));
		
		
		pw.print(json.toString());

		
	}

}
