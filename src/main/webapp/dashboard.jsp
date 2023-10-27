<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.user.Ticket" %>
<%@ page import="com.user.UserDButil" %>
<%@ page import="java.util.ArrayList" %>
<% 	
	
	HttpSession ses = request.getSession();
	if (ses.getAttribute("username") == null) { 
		response.sendRedirect("signin.jsp"); 
	}
%> 
<% 
	String username = (String)session.getAttribute("username");
	ArrayList<Ticket> dataList = new ArrayList<>();
	dataList = UserDButil.getTickets(username);
	String[] status = UserDButil.getStatus(username);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>
    <link rel="stylesheet" href="styles/dashboard.css" />
    <link rel="stylesheet" href="styles/navbar.css" />
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
    <div class="container">
      <section class="dashboard">
        <div class="widget-container">
          <div>
            <p class="grey-text">Total Booked Tickets</p>
            <h2><%=status[2] %></h2>
          </div>
          <div class="img-container1">
            <img class="ticket-img" src="images/ticket-alt-solid.svg" alt="" />
          </div>
        </div>
        <div class="widget-container">
          <div>
            <p class="grey-text">Total Pending Tickets</p>
            <h2><%=status[1] %></h2>
          </div>
          <div class="img-container2">
            <img class="ticket-img" src="images/ticket-alt-solid.svg" alt="" />
          </div>
        </div>
        <div class="widget-container">
          <div>
            <p class="grey-text">Total Regected Tickets</p>
            <h2><%=status[0] %></h2>
          </div>
          <div class="img-container3">
            <img class="ticket-img" src="images/ticket-alt-solid.svg" alt="" />
          </div>
        </div>
        <h3>Welcome, <%=username %></h3>
        <div class="table-container">
          <table class="table">
            <thead>
              <tr>
                <th>TICKET ID</th>
                <th>STARTING POINT</th>
                <th>DROPPING POINT</th>
                <th>JOURNEY DATE</th>
                <th>BOOKED SEATS</th>
                <th>FARE(Each)</th>
                <th>STATUS</th>
                <th>ACTIONS</th>
              </tr>
            </thead>
            <tbody>
            <% for(Ticket t:  dataList) {%>
                <tr>
                  <td><%=t.getTicketID() %></td>
                  <td><%=t.getStartingPoint() %></td>
                  <td><%=t.getDroppingPoint() %></td>
                  <td><%=t.getDate() %></td>
                  <td><%=t.getSeats() %></td>
                  <td><%=t.getFare() %></td>
                  <td><%=t.getStatus() %></td>
                  <td class="actions"><a href="updateseatbooking.jsp?ticketId=<%= t.getTicketID() %>" style="color: green;" >Update</a><a href="#" onclick="popup<%= t.getTicketID() %>()" style="color: red;" >Delete</a></td>
                </tr>
              <% }%>
            </tbody>
          </table>
        </div>
      </section>
    </div>
    <% for(Ticket t:  dataList) {%>
    <div class="are-you-sure-component" id="are-you-sure-component<%= t.getTicketID() %>">
      	<p>Are you sure?</p>
      	<div><a href="delete?ticketId=<%= t.getTicketID() %>">Yes</a><button onclick="popup<%= t.getTicketID() %>()">No</button></div>
    </div>
    <script>
      function popup<%= t.getTicketID() %>() {
        document
          .getElementById("are-you-sure-component<%= t.getTicketID() %>")
          .classList.toggle("popup");
      }
    </script>
    <% }%>
  </body>
</html>
