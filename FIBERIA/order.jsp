<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="authorize.jsp"%>
<%
User user =(User)session.getAttribute("userobj");
CartDAO dao = new CartDAO();
List<Product> products = new ArrayList<Product>();

try{
    products = dao.getProductsFromCart(user.getUsername());
}catch(Exception e){
    request.setAttribute("message",e.getMessage());
}

%>
<!doctype html>
<html lang="en">
<head>
	<title>Checkout</title>
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
    <link rel="icon" href="images/favicon.ico">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="navbar-top-fixed.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
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
<section style="margin-top: 80px;">
    <div class="container">
        <div class="accordion" id="accordionExample">
            <div class="steps">
                <progress id="progress" value=0 max=100 ></progress>
                <div class="step-item">
                   <a href="order.jsp"> <button class="step-button text-center" type="button" data-toggle="collapse"
                        data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        1
                    </button>
                </a>
                    <div class="step-title">
                        Checkout
                    </div>
                </div>
                <div class="step-item">
                   <a href="shipping.jsp"> <button class="step-button text-center collapsed" type="button" data-toggle="collapse"
                        data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        2
                    </button>
                </a>
                    <div class="step-title">
                        Shipping Form
                    </div>
                </div>
                <div class="step-item">
                   <a href="payment.jsp"> <button class="step-button text-center collapsed" type="button" data-toggle="collapse"
                        data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        3
                    </button>
                </a>
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
                                      <% int total = 0;
                                        for(Product prod: products){
                                            %>
                                             <!-- PRODUCT -->
                                             <div class="row">
                                                 <div class=" col-lg-4 col-12 col-sm-12 col-md-6 text-center">
                                                         <img class="img-responsive" src="../file_uploads/<%=prod.getImageName()%>" alt="prewiew" width="110" height="120">
                                                 </div>
                                                 <div class="col-lg-4 col-7 text-sm-center col-sm-7 text-md-left col-md-3">
                                                     <h4 class="product-name"><strong><%=prod.getProductName() %></strong> </h4>
                                                     <h5>
                                                         <small>seller : <%= prod.getUsername()%></small><br><small>size : <%=prod.getSize() %></small>
                                                     </h5>
                                                 </div>
                                                 <div class="col-lg-4 col-5 col-sm-3 text-sm-center col-md-3 text-md-right row">
                                                     <div class="col-8 col-sm-6 col-md-6 text-md-center" >
                                                         <h5 style="padding-top: 38px"><strong><%=prod.getPrice() %> €</strong></h5>
                                                     </div>
                                                     
                                                     
                                                 </div>
                                             </div>
                                             <% 
                                             
                                             total+=prod.getPrice();
                                             }
                                             %>
                                             <div class="card-footer" style="background-color: #ed807425;">
                                             <div id="total" class="pull-right col-12 col-sm-3 col-md-3" style="margin: 5px; margin-right:15px; text-align: right; font-size: large;">
                                                Total price: <b><%=total %> €</b>
                                            </div>
                                            <br><br>
                                        </div>
                                             <!-- END PRODUCT -->
                                             <!-- PRODUCT -->
                                             
                                             <!-- END PRODUCT -->
                                        
                                     </div>
                                     
                                 </div>
                                 <a href="shipping.jsp" ><button id="next" type="submit" class="btn btn-info btn-md btn-block" >Next</button></a>   
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