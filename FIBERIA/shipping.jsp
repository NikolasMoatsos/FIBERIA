<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>
<%@ include file="authorize.jsp"%>
<!doctype html>
<html lang="en">
<head>
	<title>Shipping Form</title>
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

<%@include file="generalnav.jsp" %>

<% User user =(User)session.getAttribute("userobj"); %>
<body>
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
                <button class="step-button text-center collapsed" type="button" data-toggle="collapse"
                    data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    2
                </button>
                <div class="step-title" style="width: max-content;">
                    Shipping Form
                </div>
            </div>
            <div class="progress" style="width: 50%; height: 10px; margin-left: -50px; margin-right: -50px; margin-bottom: 20px;">
              <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <div class="step-item">
              <a href="payment.jsp"><button class="step-button text-center collapsed" type="button" data-toggle="collapse"
                  data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                  3
              </button></a>
              <div class="step-title">
                  Payment
              </div>
          </div>
            </div>

           <div class="card" >
             <h4 id="shipping">Shipping Form</h4>
                <% if(request.getAttribute("message") != null) { %>		
                    <div class="form-row">
                    <div class="form-group col-md-12 alert alert-danger text-center" role="alert" ><%=(String)request.getAttribute("message") %></div>
                  </div>
                  <% } %>
                <!--<div  id="headingTwo">
                   
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample"> -->
                    <div class="card-body">
                        <form class="form-signin" method="POST" action="shippingController.jsp" >
                           
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
                              <a href="payment.jsp" id="next"><button type="submit" class="btn btn-info btn-md btn-block" >Next</button></a>
                          </div>
                        </form>  
                        
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