package com.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String phone = request.getParameter("phone");
		String type = request.getParameter("type");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User user = new User(fname, lname, phone, type, username, email, password);
		boolean isCreated = UserDButil.createUser(user);
		
		if(isCreated) {
			response.sendRedirect("signin.jsp");
		}
		else {
			request.setAttribute("error", "Username already exists.");
			RequestDispatcher rq = request.getRequestDispatcher("signup.jsp");
			rq.forward(request, response);
		}
	}

}
