package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdatePasswordServlet
 */
@WebServlet("/UpdatePasswordServlet")
public class UpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newpwd = request.getParameter("newpwd");
        String crtpwd = request.getParameter("crtpwd");
        String username = (String)request.getSession().getAttribute("username");
        
        if(UserDButil.updatePassword(newpwd, crtpwd, username)) {
        	response.sendRedirect("profile.jsp");
        } else {
        	request.setAttribute("pwderror", "Incorrect current password.");
		    request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
	}

}
