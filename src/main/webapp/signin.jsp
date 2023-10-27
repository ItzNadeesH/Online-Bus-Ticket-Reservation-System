<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign In</title>
    <link rel="stylesheet" href="styles/signin.css" />
  </head>
  <body>
    <div class="hero-image-container">
      <img class="hero-image" src="images/new.jpg" alt="login-hero" />
    </div>
    <div class="login-form-container">
      <h1 class="heading">Welcome to Bus Booking</h1>
      <p class="grey-text">Sign In your Account</p>
      <form action="dashboard" method="post" novalidate>
        <label class="label" for="username">Username</label>
        <div class="input-group">
          <input
            class="input"
            name="username"
            type="text"
            placeholder="Enter Your Username"
            minlength="4"
            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
            title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
            required
          />
        </div>
        <label class="label" for="password">Password</label>
        <input
          class="input"
          id="password"
          name="password"
          type="password"
          placeholder="Enter Your Password"
        />
        <% if (request.getAttribute("error") != null) { %>
        <p style="color: red"><%= request.getAttribute("error") %></p>
        <% } %>
        <div class="options-container">
          <div class="container">
            <input id="remember" type="checkbox" />
            <label for="remember">Remember Me</label>
          </div>
          <a href="" class="grey-text link">Forgot Password?</a>
        </div>
        <button class="btn" type="submit">Sign In</button>
      </form>
      <div class="signup-option-container">
        <p class="grey-text">Don't have any Account?</p>
        <a class="link grey-text" href="signup.jsp">Sign Up</a>
      </div>
    </div>
  </body>
</html>
