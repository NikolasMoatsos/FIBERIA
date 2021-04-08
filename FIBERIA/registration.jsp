<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="errorPage.jsp"%>

<!doctype html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
  <link rel="icon" href="images/favicon.ico">
    <title>Sign Up</title>
    <link href="css/register.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sign-in/">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <!-- Bootstrap core CSS -->
  <link href="bootstrap-4.5.2-dist\css\bootstrap.min.css" rel="stylesheet">
  <link href="css/nav_bar.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    
  </head>
  <body>

    <%@include file="generalnav.jsp"%>

    <div class="sign_up">
      <form class="form-signin" method="POST" action="registrationController.jsp">
          <div class="text-center mb-4">
              <i class="fa fa-refresh fa-spin" style="font-size: 50px; color: #ed8074;"></i>
              <h1 style="font-size: 50px;color: #ed8074;">Fiberia</h1>
            </div>
            
            <% if(request.getAttribute("message") != null) { %>		
              <div class="alert alert-danger" role="alert"><%=(String)request.getAttribute("message") %></div>
            <% } %>
            
        <div class="row">
            <div class="col">
        <label  class="sr-only">Name</label>
        <input type="text" id="name" name="name" class="form-control" placeholder="Name" required></div>
        <div class="col">

        <label  class="sr-only">Surname</label>
        <input type="text" id="lastame" name="surname" class="form-control" placeholder="Surname" required></div></div>

        <label class="sr-only">Username</label>
        <input type="text" id="username" name="username" class="form-control" placeholder="Username">

        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required>

        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>

        <label for="inputPassword" class="sr-only">Confirm Password</label>
        <input type="password" id="inputPassword" name="confirm" class="form-control" placeholder="Confirm Password" required>
          <br>
        <div class="radio mb-3">
          <label>
            <input type="checkbox" name="terms" value="remember-me" required> I agree with the terms and conditions
          </label>
        </div>

        <div class="buttons text-center"><button  type="submit">Sign up</button></div>  
        <p class="text-center marginTop">Already have and Account? Sign in <a href="log_in.jsp" class="link">here</a></p>
      </form>
    </div>

    <%@ include file = "Footer.jsp" %>
  </body>
</html>
