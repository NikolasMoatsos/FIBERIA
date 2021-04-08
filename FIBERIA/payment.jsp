<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>
<%@ include file="authorize.jsp"%>
<!doctype html>
<html lang="en">
<head>
	<title>Payment</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link href="css/checkoutsteps2.css" rel="stylesheet"><!--Edw bale to css pou ekanes copy me to onoma pou tou exeis dwsei nmz checkoutsteps2.css-->
<!------ Include the above in your HEAD tag ----------> 

<!------ Include the above in your HEAD tag ---------->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
        integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/c560c025cf.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/nvb.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
    <link rel="icon" href="images/favicon.ico">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="navbar-top-fixed.css" rel="stylesheet">
    
    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/navbar-fixed/">


    <script src="https://use.fontawesome.com/c560c025cf.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


   
<!---->

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
    >   
</head>
<body>
<%@include file="generalnav.jsp" %>

<% User user =(User)session.getAttribute("userobj"); %>

<section style="margin-top: 80px;">
    <div class="container">
        <div class="accordion" id="accordionExample">
          <div class="steps">
            <div class="step-item" style="margin-right: -50px;">
              <a href="order.jsp"><button class="step-button text-center" type="button" data-toggle="collapse"
                        data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        1
                    </button></a>
                    <div class="step-title">
                        Checkout
                    </div>
                  </div>
              <div class="progress" style="width: 50%; height: 10px; margin-right: -50px; margin-bottom: 20px; ">
                <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 100%;color: #ed8074;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <div class="step-item">
                <a href="shipping.jsp"><button class="step-button text-center collapsed" type="button" data-toggle="collapse"
                    data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    2
                </button></a>
                <div class="step-title" style="width: max-content;">
                    Shipping Form
                </div>
            </div>
            <div class="progress" style="width: 50%; height: 10px; margin-left: -50px; margin-right: -50px; margin-bottom: 20px;">
              <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <div class="step-item">
              <button class="step-button text-center collapsed" type="button" data-toggle="collapse"
                  data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                  3
              </button>
              <div class="step-title">
                  Payment
              </div>
          </div>
            </div>

            <div class="card">
                <!-- <div  id="headingThree">
                   
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                    data-parent="#accordionExample"> -->
                    <div class="card-body">
                      <article class="card">
                        <div class="card-body p-5">
                        
                        <ul class="nav bg-light nav-pills rounded nav-fill mb-3" role="tablist">
                          <li class="nav-item" >
                            <a class="nav-link active" data-toggle="pill" href="#nav-tab-card" >
                            <i class="fa fa-credit-card"></i> Credit Card</a></li>
                          <li class="nav-item" >
                            <a class="nav-link" data-toggle="pill" href="#nav-tab-paypal">
                              Paypal</a></li>
                          
                        </ul>
                        
                        <div class="tab-content">
                        <div class="tab-pane fade show active" id="nav-tab-card">
                          
                          <form role="form">
                          <div class="form-group">
                            <label for="username">Full name (on the card)</label>
                            <input type="text" class="form-control" name="username" placeholder="" required="">
                          </div> <!-- form-group.// -->
                        
                          <div class="form-group">
                            <label for="cardNumber">Card number</label>
                            <div class="input-group">
                              <input type="text" class="form-control" name="cardNumber" placeholder="">
                              <div class="input-group-append">
                                <span class="input-group-text text-muted">
                                   
                                </span>
                              </div>
                            </div>
                          </div> <!-- form-group.// -->
                        
                          <div class="row">
                              <div class="col-sm-8">
                                  <div class="form-group">
                                      <label><span class="hidden-xs">Expiration</span> </label>
                                    <div class="input-group">
                                      <input type="number" class="form-control" placeholder="MM" name="">
                                        <input type="number" class="form-control" placeholder="YY" name="">
                                    </div>
                                  </div>
                              </div>
                              <div class="col-sm-4">
                                  <div class="form-group">
                                      <label data-toggle="tooltip" title="" data-original-title="3 digits code on back side of the card">CVV <i class="fa fa-question-circle"></i></label>
                                      <input type="number" class="form-control" required="">
                                  </div> <!-- form-group.// -->
                              </div>
                          </div> <!-- row.// -->
                          <button class="subscribe btn btn-primary btn-block" type="button" style="background-color: #ed8074;border-color: #ed8074;"> Confirm  </button>
                          </form>
                        </div> <!-- tab-pane.// -->
                        <div class="tab-pane fade" id="nav-tab-paypal">
                        <p>Paypal is easiest way to pay online</p>
                        <p>
                        <form action="https://www.paypal.com/uk/signin"><button type="submit" class="btn btn-primary" style="background-color:#ed8074;border-color: #ed8074;">  Log in my Paypal </button></form>
                        </p>
                        
                        </div>
                        
                        </div> <!-- tab-content .// -->
                        
                        </div> <!-- card-body.// -->
                        </article> <!-- card.// -->
                        </div>
                        </div>
                        </div>
                        </div>
                        </section> 
                        <%@ include file = "Footer.jsp" %>
                      </body>
                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
                        <script src="js/checkoutsteps2.js"></script>
                    </html>