<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>

<!doctype html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Log In</title>
  <link rel="canonical" href="bootstrap-4.3.1/site/docs/4.3/examples/carousel/index.html">
  <link rel="icon" href="images/favicon.ico">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="css/nav_bar.css" rel="stylesheet">
  <link href="css/sign_in.css" rel="stylesheet">
  <link href="css/footer.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
  <script src="bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>
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
</head>
<body>

  <%@ include file = "generalnav.jsp" %>

  <div class="sign_in">
    <form class="form-signin" action="loginController.jsp" method="POST" onsubmit="return display()">
      <div class="text-center mb-4">
        <i class="fa fa-refresh fa-spin" style="font-size: 50px; color: #ED8074"></i>
        <h1 style="font-size: 50px;color: #ED8074">Fiberia</h1>
      </div>

      <div class="alert alert-info">
        <p>email: giorgosmrkou@gmail.com<br>password: 1234567</p>
      </div>

      <% if(request.getAttribute("message") != null) { %>		
        <div class="alert alert-danger" role="alert"><%=(String)request.getAttribute("message") %></div>
      <% } %>

      <label for="inputEmail" class="sr-only"></label>
      <input type="text" id="inputEmail" name="email" class="form-control" placeholder="Email" required autofocus>
      <br>
      <label for="inputPassword" class="sr-only"></label>
      <input type="password" id="inputPassword" class="form-control" name="password" placeholder="Password" required>
      <br>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox">
        <label class="form-check-label">Remember me</label>
      </div>
      <p></p>
      <div class="buttons text-center"> <button type="submit">Sign in</button></div>
    <p class="marginTop">You don't have and Account? Sign up <a href="registration.jsp" class="link">here</a></p>
    </form>
  </div>

  <%@ include file = "Footer.jsp" %>
</body>

<script>
  /* When the user clicks on the button, 
  toggle between hiding and showing the dropdown content */
  function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
  }

  // Close the dropdown if the user clicks outside of it
  window.onclick = function (event) {
    if (!event.target.matches('.dropbtn')) {
      var dropdowns = document.getElementsByClassName("dropdown-content");
      var i;
      for (i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }
</script>

</html>