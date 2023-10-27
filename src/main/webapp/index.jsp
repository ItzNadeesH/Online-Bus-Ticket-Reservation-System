<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.addHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	HttpSession ses =request.getSession();
	boolean isAuthenticated = (ses.getAttribute("username") == null);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BusTicketExpress | Home</title>
    <link rel="stylesheet" href="styles/calander.css" />
    <link rel="stylesheet" href="styles/navbar.css" />
    <link rel="stylesheet" href="styles/styles.css" />
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
		<%
    		if (!isAuthenticated) {
		%>
			<li class="nav-list-item"><a href="dashboard.jsp">Dashboard</a></li>
			<li class="nav-list-item"><a href="logout">Logout</a></li>
		<%
    		} else {
		%>
			<li class="nav-list-item"><a href="signin.jsp">Log In</a></li>
          <li class="nav-list-item signup-btn">
            <a href="signup.jsp">Sign Up</a>
          </li>
		<%
    		}
		%>
        </ul>
      </nav>
    </div>
    <div class="container">
      <h1 class="main_heading">Get Your Ticket Online, Easy and Safely</h1>
      <div class="ticket-search-form-container">
        <form class="ticket-search-form" action="search" method="post">
          <div class="form-item">
            <img class="icon" src="images/location-arrow-solid.svg" alt="" />
            <select class="input" name="spoint" id="spoint" required>
              <option value="" disabled selected hidden=ture>Select Starting Point</option>
              <option value="Matara">Matara</option>
              <option value="Galle">Galle</option>
              <option value="Kaluthara">Kaluthara</option>
              <option value="Colombo">Colombo</option>
            </select>
          </div>
          <div class="form-item">
            <img class="icon" src="images/location-dot-solid.svg" alt="" />
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
          <button class="btn" type="submit">Find Tickets</button>
        </form>
      </div>
      <h2 class="heading">Get Your Tickets With Just 3 Steps</h2>
      <p class="grey-text p">
        Have a look at our popular reason. why you should choose you bus. Just a
        Bus and get a ticket for your great journey. !
      </p>
      <section class="card-section">
        <div class="card-component">
          <img class="icon" src="images/search-solid.svg" alt="search-icon" />
          <h3>Search Your Bus</h3>
          <p class="p grey-text">
            Choose your origin, destination,Just choose a Bus journey dates and
            search for buses
          </p>
        </div>
        <div class="card-component">
          <img
            class="icon"
            src="images/ticket-alt-solid.svg"
            alt="ticket-icon"
          />
          <h3>Choose The Ticket</h3>
          <p class="p grey-text">
            Choose your origin, destination,Just a Bus for your great journey
            dates and search for buses
          </p>
        </div>
        <div class="card-component">
          <img
            class="icon"
            src="images/money-bill-wave-solid.svg"
            alt="money-icon"
          />
          <h3>Pay Bill</h3>
          <p class="p grey-text">
            Choose your origin, destination,choose a Bus for your great journey
            dates and search for buses
          </p>
        </div>
      </section>
    </div>
  </body>
</html>
