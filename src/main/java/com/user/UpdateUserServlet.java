package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String username = (String)request.getSession().getAttribute("username");
        
        if(UserDButil.updateUserDetails(fname, lname, mobile, email, username)) {
        	response.sendRedirect("profile.jsp");
        } else {
        	request.setAttribute("error", "Email already exist in the system.");
		    request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
	}

}
