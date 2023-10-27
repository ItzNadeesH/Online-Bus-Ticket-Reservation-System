<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%><%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bus.Bus" %>
<%@ page import="com.bus.BusDButil" %>
<%@ page import="java.util.ArrayList" %>
<% 	
	HttpSession ses = request.getSession(); 
	if (ses.getAttribute("username") == null) {
		response.sendRedirect("signin.jsp"); 
	}
%>
<% 
	String username = (String)session.getAttribute("username");
	ArrayList<Bus> dataList = new ArrayList<>();
	dataList = BusDButil.getBuses();
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	if (from != null) dataList.removeIf(n -> !n.getFrom().equals(from));
	if (from != null) dataList.removeIf(n -> !n.getTo().equals(to));
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tickets</title>
    <link rel="stylesheet" href="styles/tickets.css" />
    <link rel="stylesheet" href="styles/calander.css" />
    <link rel="stylesheet" href="styles/navbar.css" />
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
    <div class="ticket-search-form-container">
      <form class="ticket-search-form" action="search" method="post">
        <div class="form-item">
          <img class="icon" src="images/location-arrow-solid.svg" alt="location-arrow" />
          <select class="input" name="spoint" id="spoint" required>
            <option value="" disabled selected hidden=ture>Select Starting Point</option>
              <option value="Matara">Matara</option>
              <option value="Galle">Galle</option>
              <option value="Kaluthara">Kaluthara</option>
              <option value="Colombo">Colombo</option>
          </select>
        </div>
        <div class="form-item">
          <img class="icon" src="images/location-dot-solid.svg" alt="location-arrow" />
          <select class="input" name="dpoint" id="dpoint" required>
            <option value="" disabled selected hidden=ture>Select Dropping Point</option>
              <option value="Matara">Matara</option>
              <option value="Galle">Galle</option>
              <option value="Kaluthara">Kaluthara</option>
              <option value="Colombo">Colombo</option>
          </select>
        </div>
        <div class="form-item">
          <img class="icon" src="images/calendar-solid.svg" alt="" />
          <input
            placeholder="Date of Journey"
            class="input"
            type="text"
            id="datepicker"
            autocomplete="off"
            required
          />
        </div>
        <button class="btn" type="submit">Find Schedules</button>
      </form>
    </div>
    <div class="container">
      <div class="ticket-filter">
        <div class="section-1">
          <h3>Filter</h3>
          <a class="link grey-text" href="">Reset All</a>
        </div>
        <div class="section-2">
          <h4>Bus Type</h4>
          <div>
            <input type="checkbox" name="" id="" />
            <label class="grey-text label" for="">Classic</label>
          </div>
          <div>
            <input type="checkbox" name="" id="" />
            <label class="grey-text label" for="">Laxuary</label>
          </div>
        </div>
      </div>
      <% for(Bus b: dataList) { %>
        <div class="ticket-container">
          <div class="section">
            <h3><%= b.getFrom() %> - <%= b.getTo() %></h3>
            <span class="grey-text small-text">Seat Layout - 2 x 2</span>
            <p class="grey-text"><%= b.getType() %></p>
          </div>
          <div class="section times">
            <div class="section">
              <span class="time"><%= b.getDtime() %></span>
              <p class="grey-text"><%= b.getFrom() %></p>
            </div>
            <div class="section">
              <img
                class="right-arrow-icon"
                src="images/arrow-right-solid.svg"
                alt=""
              />
            </div>
            <div class="section">
              <span class="time"><%= b.getAtime() %></span>
              <p class="grey-text"><%= b.getTo() %></p>
            </div>
          </div>
          <div class="section">
            <span class="price">Rs.<%= b.getPrice()%>.00</span>
            <a href="seatbooking.jsp?busId=<%= b.getBusid() %>">
            	<button class="btn">View Details</button>
            </a>
          </div>
          <div class="bottom-section">
            <h4 class="grey-text">Facilities -</h4>
            <span class="grey-text">Water Bottle</span>
            <span class="grey-text">Pillow</span>
            <span class="grey-text">Wifi</span>
          </div>
        </div>
      <% } %>
    </div>
  </body>
</html>
