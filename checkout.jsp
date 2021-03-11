<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>
<!doctype html>
<html lang="en">
<head>
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
    <link href="css/nav_bar.css" rel="stylesheet">
<link rel="icon" href="images/favicon.ico">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="navbar-top-fixed.css" rel="stylesheet">
    
    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/navbar-fixed/">


    <script src="https://use.fontawesome.com/c560c025cf.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/footer.css" rel="stylesheet">

   
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
<body >
 <%@include file="generalnav.jsp" %>

 <% User user =(User)session.getAttribute("userobj"); %>
<section>
        <div class="container">
            <div class="accordion" id="accordionExample">
                <div class="steps">
                    <progress id="progress" value=0 max=100 ></progress>
                    <div class="step-item">
                        <button class="step-button text-center" type="button" data-toggle="collapse"
                            data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            1
                        </button>
                        <div class="step-title">
                            Checkout
                        </div>
                    </div>
                    <div class="step-item">
                        <button class="step-button text-center collapsed" type="button" data-toggle="collapse"
                            data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            2
                        </button>
                        <div class="step-title">
                            Shipping Form
                        </div>
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
                    <div  id="headingOne">
                       
                    </div>
 
                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                        data-parent="#accordionExample">
                        <div class="card-body">
    
                            
                                <div class="card shopping-cart">
                                         <div class="card-header  " style="background-color: #ed8074; color: white;" >
                                             
                                             <h5 style="float: left; margin-top: 5px;"> <i class="fa fa-shopping-cart" aria-hidden="true"></i>My Order </h5>
                                             
                                             
                                             <div class="clearfix"></div>
                                         </div>
                                         <div class="card-body">
                                                 <!-- PRODUCT -->
                                                 <div class="row">
                                                     <div class="col-12 col-sm-12 col-md-2 text-center">
                                                             <img class="img-responsive" src="images\0962300676_6_1_1.webp" alt="prewiew" width="110" height="120">
                                                     </div>
                                                     <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                                                         <h4 class="product-name"><strong>Product Name</strong> </h4>
                                                         <h5>
                                                             <small>Sellers' Name</small><br><small>Size</small><br><small>Brand</small>
                                                         </h5>
                                                     </div>
                                                     <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                                                         <div class="col-3 col-sm-3 col-md-6 text-md-center" >
                                                             <h5 style="padding-top: 38px"><strong>25.00 </strong></h5>
                                                         </div>
                                                         
                                                         
                                                     </div>
                                                 </div>
                                                 <hr>
                                                 <!-- END PRODUCT -->
                                                 <!-- PRODUCT -->
                                                 <div class="row">
                                                     <div class="col-12 col-sm-12 col-md-2 text-center">
                                                             <img class="img-responsive" src="images\3351d444824746bab381226af833e6857939787b.webp" alt="prewiew" width="110" height="120">
                                                     </div>
                                                     <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                                                         <h4 class="product-name"><strong>Product Name</strong></h4>
                                                         <h5>
                                                             <small>Sellers' Name</small><br><small>Size</small><br><small>Brand</small>
                                                         </h5>
                                                     </div>
                                                     <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                                                         <div class="col-3 col-sm-3 col-md-6 text-md-center" >
                                                             <h5 style="padding-top: 38PX;"><strong>25.00</strong></h5>
                                                         </div>
                                                         
                            
                                                     </div>
                                                 </div>
                                                 
                                                 <!-- END PRODUCT -->
                                            
                                         </div>
                                         
                                     </div>
                             
                        </div>
                    </div>
                </div>
               
                <div class="card" >
                    <% if(request.getAttribute("message") != null) { %>		
                        <div class="form-row">
                        <div class="form-group col-md-12 alert alert-danger text-center" role="alert" ><%=(String)request.getAttribute("message") %></div>
                      </div>
                      <% } %>
                    <div  id="headingTwo">
                       
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                        <div class="card-body">
                            <form class="form-signin" method="POST" action="checkoutController.jsp" >
                               
                                <div class="row row-center">
                                  <div class="col-md-6 mb-3">
                                      <label for="FirstName" >First Name</label>
                                    <input type="text" class="form-control"  id="FirstName" name="firstname" value="<%= user.getName()%>" required>
                                  </div>
                                  <div class="col-md-6 mb-3">
                                    <label for="LastName">Last Name</label>
                                    <input type="text" class="form-control"  id="LastName" name="lastname" value="<%= user.getSurname()%>" required>
                                  
                                </div>
                                </div>
                                
                                    
                                <div class="row row-center">
                                    <div class="col-md-12 mb-3">
                                        <label for="E-mail">Email</label>
                                      <input type="email" class="form-control"  id="E-mail" name="email" required>
                                    </div>
                                    
                                </div>
                                <div class="row row-center">
                                    <div class="col-md-6 mb-3">
                                        <label for="Phone">Phone</label>
                                        <input type="text" class="form-control"  id="Phone" name="phone" required>
                                      </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="control-label"for="Address">Address</label>
                                      <input type="text" class="form-control"  id="Address" name="address" required>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="Adnum">Num</label>
                                      <input type="text" class="form-control"  id="Adnum">
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="Zipcode">Zip Code</label>
                                        <input type="text" class="form-control"  id="Zipcode" name="zipcode" required>
                                      </div>
                                  </div>
                                  <div class="row" style=" padding-top: 20px;">
                                  <button type="submit" class="btn btn-info btn-md btn-block" >SAVE</button>
                              </div>
                            </form>  
                            
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div  id="headingThree">
                       
                    </div>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                        data-parent="#accordionExample">
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
                              <button class="subscribe btn btn-primary btn-block" type="button" style="background-color: #ed8074;"> Confirm  </button>
                              </form>
                            </div> <!-- tab-pane.// -->
                            <div class="tab-pane fade" id="nav-tab-paypal">
                            <p>Paypal is easiest way to pay online</p>
                            <p>
                            <form action="https://www.paypal.com/uk/signin"><button type="submit" class="btn btn-primary" style="background-color:#ed8074;">  Log in my Paypal </button></form>
                            </p>
                            
                            </div>
                            
                            </div> <!-- tab-content .// -->
                            
                            </div> <!-- card-body.// -->
                            </article> <!-- card.// -->
                            
                            
                              </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                            
                            </div> 
                            <!--container end.//-->
                            
                            <br><br>
                            
                        </div>
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