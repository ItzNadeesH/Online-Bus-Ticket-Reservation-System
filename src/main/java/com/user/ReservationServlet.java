package com.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
        String spoint = request.getParameter("from");
        String dpoint = request.getParameter("to");
        String fare = request.getParameter("fare");
        String seats = request.getParameter("seats");
        String date = request.getParameter("date");
        
        Ticket ticket = new Ticket(0, spoint, dpoint, date, seats, fare, "Pending", userid);
        
        if(UserDButil.bookTicket(ticket)) {
        	response.sendRedirect("dashboard.jsp"); 
        } else {
        	RequestDispatcher rq = request.getRequestDispatcher("seatbooking.jsp");
			rq.forward(request, response);
        }
	}

}
