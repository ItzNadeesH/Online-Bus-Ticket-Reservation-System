package com.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateTicketServlet")
public class UpdateTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ticketid = request.getParameter("ticketid");
        String spoint = request.getParameter("from");
        String dpoint = request.getParameter("to");
        String fare = request.getParameter("fare");
        String seats = request.getParameter("seats");
        String date = request.getParameter("date");
        String userid = request.getParameter("userid");
        int tid = Integer.parseInt(ticketid);
        
        Ticket ticket = new Ticket(tid, spoint, dpoint, date, seats, fare, "Pending", userid);
        
        if(UserDButil.updateTicket(ticket)) {
        	response.sendRedirect("dashboard.jsp"); 
        } else {
        	RequestDispatcher rq = request.getRequestDispatcher("seatbooking.jsp");
			rq.forward(request, response);
        }
	}

}
