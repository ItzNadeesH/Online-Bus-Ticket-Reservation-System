<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.user.Ticket" %>
<%@ page import="com.user.UserDButil" %>
<%	
	HttpSession ses = request.getSession();
	if (ses.getAttribute("username") == null) { 
		response.sendRedirect("signin.jsp"); 
	} 
	
    String IdParam = request.getParameter("ticketId");
	int ticketId = -1;
	try {
		ticketId = Integer.parseInt(IdParam);
	} catch (NumberFormatException e) {
    	out.println("Invalid Id parameter. Please provide a valid Id.");
	}
	
    Ticket t = UserDButil.getTicketbyId(ticketId);
%>
<% String username = (String)session.getAttribute("username"); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Seat Booking</title>
    <link rel="stylesheet" href="styles/navbar.css" />
    <link rel="stylesheet" href="styles/seatbooking.css" />
    <link rel="stylesheet" href="styles/calander.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
		$(function () {
		    var currentDate = new Date();
		    currentDate.setDate(currentDate.getDate() + 1);
		
		    $("#datepicker").datepicker({
		        minDate: currentDate, 
		        dateFormat: "yy-mm-dd" 
		    });
		});
	</script>
  </head>
  <body>
  <div class="nav-desktop-component">
      <nav class="nav-desktop">
        <div class="logo-container">
          <a href="index.jsp">
            <img src="images/logo.png" alt="logo" />
            <span>BusTicketExpress</span>
          </a>
        </div>
        <ul class="nav-list">
          <li class="nav-list-item"><a href="dashboard.jsp">Dashboard</a></li>
          <li class="nav-list-item"><a href="tickets">Booking</a></li>
          <li class="nav-list-item"><a href="profile.jsp">Profile</a></li>
          <li class="nav-list-item"><a href="logout">Logout</a></li>
        </ul>
      </nav>
    </div>
    <div class="table-container">
    <h1>Seat Booking</h1>
      <form action="update" method="post">
	      <input type="hidden" name="ticketid" value=<%=t.getTicketID() %>>
	      <input type="hidden" name="from" value=<%=t.getStartingPoint() %>>
	      <input type="hidden" name="to" value="<%=t.getDroppingPoint() %>">
	      <input type="hidden" name="fare" value="<%=t.getFare() %>">
	      <input type="hidden" name="status" value="<%=t.getStatus() %>">
	      <input type="hidden" name="userid" value="<%=username %>">
	      <table>
	        <tr>
	          <th>Starting Point</th>
	          <td><%=t.getStartingPoint() %></td>
	        </tr>
	        <tr>
	          <th>Dropping Point</th>
	          <td><%=t.getDroppingPoint() %></td>
	        </tr>
	        <tr>
	          <th>Ticket Price</th>
	          <td>Rs.<%=t.getFare() %>.00</td>
	        </tr>
	        <tr>
	          <th>Choose Date</th>
	          <td><input class="input" type="text" name="date" id="datepicker" autocomplete="off" placeholder="Date of Journey" value="<%=t.getDate() %>" required/></td>
	        </tr>
	        <tr>
	          <th>Seats Count</th>
	          <td>
	            <input class="input" type="number" name="seats" value="<%=t.getSeats() %>" min="1" max="10" />
	          </td>
	        </tr>
	      </table>
	      <button class="btn" type="submit">Book Now</button>
      </form>
    </div>
  </body>
</html>
