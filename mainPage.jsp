<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp"%>
<%@ page import="fiberia_classes.*"%>
<!doctype html>
<html lang="en">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Fiberia</title>
    <link href="css/footer.css" rel="stylesheet">
    <link rel="canonical" href="bootstrap-4.3.1/site/docs/4.3/examples/carousel/index.html">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" href="images/favicon.ico">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
    <link href="css/carousel.css" rel="stylesheet">
    <link href="css/nav_bar.css" rel="stylesheet">
    <!--link href="bootstrap-4.3.1/site/docs/4.3/examples/product/FIBERIA.htmlcss" rel="stylesheet"-->
  </head>
<body style="background-color: #fffcf8;">
    <header>
      <!--<nav class="site-header sticky-top py-1">
        <div class="container d-flex flex-column flex-md-row justify-content-between">
          <a class="py-2" href="#">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="d-block mx-auto" role="img" viewBox="0 0 24 24" focusable="false"><title>Product</title><circle cx="12" cy="12" r="10"/><path d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83m13.79-4l-5.74 9.94"/></svg>
          </a>
          <a class="py-2 d-none d-md-inline-block" href="#">Tour</a>
          <a class="py-2 d-none d-md-inline-block" href="#">Product</a>
          <a class="py-2 d-none d-md-inline-block" href="#">Features</a>
          <a class="py-2 d-none d-md-inline-block" href="#">Enterprise</a>
          <a class="py-2 d-none d-md-inline-block" href="#">Support</a>
          <a class="py-2 d-none d-md-inline-block" href="#">Pricing</a>
          <a class="py-2 d-none d-md-inline-block" href="#">Cart</a>
        </div>
      </nav>-->
      <%@ include file = "generalnav.jsp" %>
  </header>
  <main role="main">
    <% if(request.getAttribute("message") != null) { %>		
      <div class="alert alert-danger" role="alert"><%=(String)request.getAttribute("message") %></div>
    <% } %> 
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="assets/slide2_image.jpg" alt="Italian Trulli">
        <div class="container">
          <div class="carousel-caption text-left">
            <h1>Second hand: The new trend</h1>
            <p >Second hand clothing is going viral around the globe. Insted of wasting hundrend of dolars in retail clothes, try second hand shopping. Everything is cheaper, plus you are helping the enviroment.</p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img src="assets/Ted-Baker-Klarna-Blog-1920x720.jpg" alt="Italian Trulli">
        <div class="container">
          <div class="carousel-caption">
            <h1>Selling clothes is as easy as that</h1>
            <p>The only thing you need is an account, clothes you no longer need, and the will to make some easy money! Sign in now to learn more on selling your clothes</p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img src="assets/d30787e435ba88c6b7e5cc4410c27e8e.jpg" alt="Italian Trulli">
        <div class="container">
          <div class="carousel-caption text-right">
            <h1>Designed for everyone</h1>
            <p>All kind of clothing material can be found in Fiberia. Men and Women around the globe are selling and buying their clothes, plus you can sell and buy clothes for your kids!</p>
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>


  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing"><!--edw ftiaxnw ta pisw xrwmata-->

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
        <img class="circle" src="assets/forward1.png">
        <h2 class="BC_Header">Sign up</h2>
        <p class="Below_carousel">To get you going with <span style="color: #ed8074;"><b>Fiberia</b> </span>you"ll need to set up an account, with all the important information<div class="buttons"><form action="registration.jsp"><button type="submit">Register</button></form></div></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img class="circle" src="assets/tshirt1.png">
        <h2 class="BC_Header">Select clothes</h2>
        <p class="Below_carousel">Clothes you dont need? No problem! Just list them on your account so everyone can see and buy them <div class="buttons"><form action="product_registration.jsp"><button type="submit">Sell Clothes</button></form></div></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img class="circle" src="assets/rating1.png">
        <h2 class="BC_Header">Buy clothes</h2>
        <p class="Below_carousel">Select your clothes of choice and buy them based on their review<div class="buttons"><form action="collection.jsp"><button type="submit">View Collection</button></form></div></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">Kids, Women and Men <span class="text-muted">Everyone is involved</span></h2>
        <p class="lead" style="color: #000000;">No matter who you are, <span style="color: #ed8074;"><b>Fiberia</b></span> is the one place where everyone can find clothing material that they love and can afford. </p>
      </div>
      <div class="col-md-5">
        <img src="assets/pexels-ivan-oboleninov-2853909.jpg" width="100%" height="100%" alt="baby">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
        <p class="lead">Search throgh our deep gallery to find anything you may want. Socialize with the community of second hand clothing and create bonds with people around the globe.</p>
      </div>
      <div class="col-md-5 order-md-1">
        <img src="assets/pexels-mika-borgia-1317712.jpg" width="100%" height="100%" alt="baby">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">Become an Enviromentalist<span class="text-muted"> Save the world.</span></h2>
        <p class="lead">Save the planet by simply buying second hand clothes and recycling clothing material</p>
      </div>
      <div class="col-md-5">
        <img src="assets/pexels-cottonbro-4713558.jpg" width="100%" height="100%" alt="baby">
      </div>
    </div>

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->
  
  <!-- /ONCLICK DROPDOWN MENU -->


  <!-- FOOTER -->

  <%@ include file = "Footer.jsp" %>
  
  </main>
  <script>
    /* When the user clicks on the button, 
    toggle between hiding and showing the dropdown content */
    function myFunction() {
      document.getElementById("myDropdown").classList.toggle("show");
    }
    
    // Close the dropdown if the user clicks outside of it
    window.onclick = function(event) {
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
  </body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script><script src="/docs/4.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script></body>
</html>
