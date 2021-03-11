<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="errorPage.jsp"%>
<%@ page import="fiberia_classes.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>


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
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="/bootstrap-4.5.2-dist/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="/bootstrap-4.5.2-dist/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<meta name="generator" content="Jekyll v4.1.1">

<link href="css/cart2.css" rel="stylesheet">
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/navbar-fixed/">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="icon" href="images/favicon.ico">
<!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

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
<link href="navbar-top-fixed.css" rel="stylesheet">
<script src="https://use.fontawesome.com/c560c025cf.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/nav_bar.css" rel="stylesheet">
<link href="css/footer.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


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
    </head>
    <body>
      <%@include file="generalnav.jsp"%>  
<div class="container cont" style=" margin-top: 100px;">
   <div class="card shopping-cart">
            <div class="card-header  " style="background-color: #ed8074; color: white;" >
                
                <h5 style="float: left; margin-top: 5px;"> <i class="fa fa-shopping-cart" aria-hidden="true"></i> Shopping cart </h5>
                <%
                if(products.size() >0){
                  %>
                <div class="buttons pull-right col-sm-2" style=" margin-top: 5px;" >
                  <a href="collection.jsp"><button >Continue shopping</button></a>
                </div>
                <%
                 }
                 %>
                
                <div class="clearfix"></div>
            </div>
            <div class="card-body">
                    <!-- PRODUCT -->
                    <% if(request.getAttribute("cartdelete") != null) { %>		
                      <div class="alert alert-success" role="success"><%=(String)request.getAttribute("cartdelete") %><button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button></div>
                    <%}
                    int total = 0;
                    if(products.size() >0){
                  
                      for(Product prod: products){
                      %>
                      <div class="row">
                          <div class="col-12 col-sm-12 col-md-2 text-center">
                                  <img class="img-responsive" src="../file_uploads/<%=prod.getImageName()%>" alt="prewiew" width="110" height="120">
                          </div>
                          <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                              <h4 class="product-name"><strong><%= prod.getProductName()%></strong> </h4>
                              <h5>
                                  <small>seller : <%= prod.getUsername()%></small><br><small>size : <%= prod.getSize()%></small>
                              </h5>
                          </div>
                          <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                              <div class="col-3 col-sm-3 col-md-6 text-md-center" >
                                  <h5 style="padding-top: 38px"><strong><%= prod.getPrice()%>€</strong></h5>
                              </div>
                              
                              <div class="col-4 col-sm-4 col-md-4 text-right" style="padding-top: 30PX;">
                                <form action="deleteFromCartController.jsp"  method="POST">
                                  <input type="hidden" name="id" value="<%=prod.getId()%>"> 
                                  <button type="submit" class="btn btn-outline-danger btn-xs">
                                      <i class="fa fa-trash" aria-hidden="true"></i>
                                  </button>
                                </form>
                              </div>
                          </div>
                      </div>
                      <hr>
                      <%
                      total+=prod.getPrice();
                      }
                      %>
                    </div>
                    <div class="card-footer" style="background-color: #ed807425;">
                        
                        <div   style="margin: 10px; ">
                          <div class="buttons pull-right col-sm-2" >
                            <a href="order.jsp"><button >Checkout</button></a>
                          </div>
                            
                            <div class="pull-right col-3 col-sm-3 col-md-3" style="margin: 5px; margin-right:15px; text-align: right; font-size: large;">
                                Total price: <b><%=total %>€</b>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }else{
                      %>
                      <div class="row">
                        <div style="margin: 0 auto" >
                          <p style="font-size: large;">Your cart is empty <i class="far fa-frown"></i></h1>. Search throw our gallery and select the products you want to acquire </p>
                        </div>
                      </div>
                      </div>
                      <div class="card-footer" style="background-color: #ed807425;">
                          
                          <div   style="margin: 10px; ">
                            <div class="buttons pull-right col-sm-2" >
                              <a href="collection.jsp"><button >Shop Now</button></a>
                            </div>
                          </div>
                      </div>
                  </div>
                   <%   
                    }
                  %>
                    <!-- END PRODUCT -->
               
          
</div>
<%@ include file = "Footer.jsp" %>
</body>
</html>