<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp"%>
<%@ page import="fiberia_classes.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>


<%

ProductDAO dao = new ProductDAO();
List<Product> products = new ArrayList<Product>();

try{
    products = dao.getProducts();
}catch(Exception e){
    request.setAttribute("message",e.getMessage());
    %>
    <jsp:forward page="mainPage.jsp"/>
    <%
}

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Fiberia Product Display</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/nvb.css">
    <link rel="stylesheet"
    href = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet"
    href = "https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>

    <%@ include file = "generalnav.jsp" %>
    
    <div class = "container">

    <h2>New Arrivals</h2>

    
    <div class = "row">  
    <%
    for(Product prod : products){
    %>
    <div class = "col-md-3">
    <div class = "product-top text-center">

        <img src = "../file_uploads/<%=prod.getImageName()%> ">

        <div class = "overlay">
        <a href = "product.jsp?id=<%=prod.getId()%>" ><button type = "button" class = "btn btn-
        secondary" title = "View Product"><i class="fa 
        fa-eye" aria-hidden="true"></i></a></button>
        <button type = "button" class = "btn btn-
        secondary" title = "Add to Whishlist"><i class="fa 
        fa-heart-o" aria-hidden="true"></i></button>
        <button type = "button" class = "btn btn-
        secondary" title = "Add to Cart"><i class="fa 
        fa-shopping-cart" aria-hidden="true"></i></button>
        </div>

    </div>


    <div class="product-bottom text-center" style="text-align: center">
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star"></i>
    <i class="fa fa-star-half-o"></i>
        <h3><%= prod.getProductName() %></h3>
        <h5><%= prod.getPrice() %> $</h5>
            </div>

    </div>
    <% 
    }
    %>
    </div>
    <!-- footer -->
		<footer class="navbar-inverse navbar-dark">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<p class="text-center" style="color: floralwhite;">&copy; Copyright 2019 by ismgroup69</p>
					</div>
				</div>
			</div>
		</footer>
    <!-- End footer -->
    <!-- jQuery library -->
		<script src="js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="js/bootstrap.min.js"></script>
</body>
</html>