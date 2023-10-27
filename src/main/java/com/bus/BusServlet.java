package com.bus;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BusServlet
 */
@WebServlet("/BusServlet")
public class BusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Bus> busList = BusDButil.getBuses();
        
        request.setAttribute("busList", busList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("tickets.jsp");
        dispatcher.forward(request, response);
		
	}


}
