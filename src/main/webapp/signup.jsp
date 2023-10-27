<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign Up</title>
    <link rel="stylesheet" href="styles/signup.css" />
  </head>
  <body>
    <div class="hero-image-container">
      <img class="hero-image" src="images/new.jpg" alt="login-hero" />
    </div>
    <div class="signup-form-container">
      <h1 class="heading">Welcome to Bus Booking</h1>
      <p class="grey-text">Sign Up your Account</p>
      <form class="signup-form" action="signup" method="post">
        <div class="form-item">
          <label class="label" for="firstname">Fisrt Name</label>
          <input
            class="input"
            id="firstname"
            name="fname"
            type="text"
            placeholder="Enter Your First Name"
            minlength="4"
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
            required
          />
        </div>
        <div class="form-item">
          <label class="label" for="mobile">Mobile</label>
          <input
            class="input"
            id="mobile"
            name="phone"
            type="tel"
            placeholder="Enter Your Phone Number"
            pattern="[0-9]*"
            minlength="10"
            required
          />
        </div>
        <div class="form-item">
          <label class="label" for="accounttype">Account Type</label>
          <select class="input" name="type" id="accounttype" required>
            <option class="default" value="" disabled selected hidden="true">
              Select Account Type
            </option>
            <option value="Passenger Account">Passenger Account</option>
            <option value="Bussiness Account">Bussiness Account</option>
          </select>
        </div>
        <div class="form-item">
          <label class="label" for="username">Username</label>
          <input
            class="input"
            id="username"
            name="username"
            type="text"
            placeholder="Enter Your Username"
            minlength="4"
            required
          />
        </div>
        <div class="form-item">
          <label class="label" for="email">Email</label>
          <input
            class="input"
            id="email"
            name="email"
            type="text"
            placeholder="Enter Your Email"
            minlength="8"
            required
          />
        </div>
        <div class="form-item">
          <label class="label" for="password">Password</label>
          <input
            class="input"
            id="password"
            name="password"
            type="password"
            placeholder="Enter Your Password"
            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
            title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
            required
          />
        </div>
        <div class="form-item">
          <label class="label" for="confirmpassword">Confirm Password</label>
          <input
            class="input"
            id="confirmpassword"
            type="password"
            placeholder="Confirm Password"
            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
            title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
            required
          />
        </div>
        <div class="options-container">
          <input id="t&c" type="checkbox" required />
          <label class="grey-text" for="t&c"
            >I agree to the terms and conditions and the privacy policy</label
          >
        </div>
        <button class="btn" type="submit">Sign Up</button>
      </form>
      <div class="signin-option-container">
        <p class="grey-text">Already have an Account?</p>
        <a class="link grey-text" href="signin.jsp">Sign In</a>
      </div>
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
