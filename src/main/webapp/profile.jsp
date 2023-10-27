<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="com.user.User" %>
<%@ page import="com.user.UserDButil" %>
<%
    HttpSession ses = request.getSession();
    if (ses.getAttribute("username") == null) {
        response.sendRedirect("signin.jsp");
    }
%>
<%
	String username = (String) ses.getAttribute("username");
	User user = UserDButil.getUser(username);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile</title>
    <link rel="stylesheet" href="styles/profile.css" />
    <link rel="stylesheet" href="styles/navbar.css" />
  </head>
  <body>
    <div class="nav-desktop-component">
      <nav class="nav-desktop">
        <div class="logo-container">
          <a href="">
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
    <div class="signup-form-container">
      <h1 class="heading">Profile Settings</h1>
      <form class="signup-form" action="updateuser" method="post">
        <div class="form-item">
          <label class="label" for="firstname">Fisrt Name</label>
          <input
            class="input"
            id="firstname"
            name="fname"
            type="text"
            placeholder="Enter Your First Name"
            minlength="4"
            value="<%=user.getFname() %>"
            required
          />
        </div>
        <div class="form-item">
          <label class="label" for="lastname">Last Name</label>
          <input
            class="input"
            id="lastname"
            name="lname"
            type="text"
            placeholder="Enter Your Last Name"
            minlength="4"
            value="<%=user.getLname() %>"
            required
          />
        </div>
        <div class="form-item">
          <label class="label" for="mobile">Mobile</label>
          <input
            class="input"
            id="mobile"
            name="mobile"
            type="tel"
            placeholder="Enter Your Phone Number"
            pattern="[0-9]*"
            minlength="10"
            value="<%=user.getPhone() %>"
            required
          />
        </div>
        <div class="form-item">
          <label class="label" for="email">Email</label>
          <input
            class="input"
            id="email"
            name="email"
            type="email"
            placeholder="Enter Your Email"
            value="<%=user.getEmail() %>"
            required
          />
        </div>
        <% if (request.getAttribute("error") != null) { %>
        <p style="color: red; margin: 1rem 0 0 0.5rem"><%= request.getAttribute("error") %></p>
        <% } %>
        <button class="btn" type="submit">Update Profile</button>
      </form>
      <form class="signup-form" action="updatepassword" method="post">
        <div class="form-item">
          <label class="label" for="password">Current Password</label>
          <input
            class="input"
            name="crtpwd"
            id="password"
            type="password"
            placeholder="Current Password"
            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
            title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
            required
          />
        </div>
        <div class="form-item">
          <label class="label" for="newpassword">New Password</label>
          <input
            class="input"
            name="newpwd"
            id="newpassword"
            type="password"
            placeholder="New Password"
            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
            title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
            required
          />
        </div>
         <% if (request.getAttribute("pwderror") != null) { %>
        <p style="color: red; margin: 1rem 0 0 0.5rem"><%= request.getAttribute("pwderror") %></p>
        <% } %>
        <button class="btn" type="submit">Change Password</button>
      </form>
    </div>
    <script>
      document
        .getElementById("accounttype")
        .addEventListener("change", function () {
          document.getElementById("accounttype").style.color = "black";
        });
    </script>
  </body>
</html>
