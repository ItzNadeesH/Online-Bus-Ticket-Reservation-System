package com.bus;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchBusServlet")
public class SearchBusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String from = request.getParameter("spoint");
		String to = request.getParameter("dpoint");
		
		request.setAttribute("spoint", from);
		request.setAttribute("dpoint", to);
		
		
		response.sendRedirect("tickets.jsp?from="+from+"&to="+to);
	}

}
