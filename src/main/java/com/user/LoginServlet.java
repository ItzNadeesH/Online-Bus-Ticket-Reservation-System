package com.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		boolean isAuthenticated = UserDButil.authenticateUser(username, password);
		
		if(isAuthenticated) {
			HttpSession session = request.getSession();
            session.setAttribute("username", username);
            
            List<Ticket> dataList = new ArrayList<>();
            dataList = UserDButil.getTickets(username);
            session.setAttribute("dataList", dataList);
            
            User user;
            user = UserDButil.getUser(username);
            session.setAttribute("user", user);
            
			//redirected to dashboard
			RequestDispatcher rq = request.getRequestDispatcher("index.jsp");
			rq.forward(request, response);
		}
		else {
			request.setAttribute("error", "Invalid username or password.");
		    request.getRequestDispatcher("signin.jsp").forward(request, response);
		}
	}

}
