<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp"%>
<%@ page import="fiberia_classes.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>


<%
String cat = (String)request.getParameter("cat");
String gend = (String)request.getParameter("gend");

if (gend != null){
    if(gend.equals("null")){
        gend = null;
    }
}

if (cat != null){
    if(cat.equals("null")){
        cat = null;
    }
}

List<Product> products = new ArrayList<Product>();
String titl = "";
if (gend == null) {
    ProductDAO dao = new ProductDAO();
    titl = "All Products";
    try{
        products = dao.getProducts();
    }catch(Exception e){
        request.setAttribute("message",e.getMessage());
        %>
        <jsp:forward page="mainPage.jsp"/>
        <%
    }
} else {

    String new_gend = "";
    if (gend.equals("Male")){
        new_gend = "Men";
    } else if (gend.equals("Female")){
        new_gend = "Women";
    } else {
        new_gend = "Kids";
    }

    if (cat !=null){
        titl = new_gend + " / " + cat;
    } else {
        titl = new_gend;
    }

    ProductDAO dao = new ProductDAO();
    
    try{
        products = dao.getProductsByCategory(gend,cat);
    }catch(Exception e){
        request.setAttribute("message",e.getMessage());
        %>
        <jsp:forward page="mainPage.jsp"/>
        <%
    }
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Collection</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="icon" href="images/favicon.ico">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/nvb.css">
    <link href="css/footer.css" rel="stylesheet">
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
    
    <div class = "container cont">

        <h2><span class="badge bd"><%=titl%></span></h2>
    <% 
    if(session.getAttribute("userobj")!=null){%>
        <% if(request.getAttribute("cart") != null) { %>		
            <div class="alert alert-success" role="success"><%=(String)request.getAttribute("cart") %> <i class="fa fa-shopping-cart" aria-hidden="true"></i><button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button></div>
        <% } %> 
        <% if(request.getAttribute("cartProblem") != null) { %>		
            <div class="alert alert-danger" role="success"><%=(String)request.getAttribute("cartProblem") %><button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button></div>
        <% } %> 
        <% if(request.getAttribute("wishlist") != null) { %>		
        <div class="alert alert-success" role="success"><%=(String)request.getAttribute("wishlist") %> <i class="fa 
            fa-heart" aria-hidden="true"></i></button><button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button></div>
        <% } %> 
        <% if(request.getAttribute("wishlistProblem") != null) { %>		
            <div class="alert alert-danger" role="success"><%=(String)request.getAttribute("wishlistProblem") %><button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button></div>
        <% }  
    }else{
    %> 
    <div class="alert alert-info" role="success"> You have to <b>Sign in</b> before you add a product to your cart<button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button></div>
    <%
    }
    %>

    <div class = "row rowCust">  

    <%
    boolean productsExist = false;
    for(Product prod : products){
        if(prod.getOrderId() == 0){
            productsExist = true;
    %>
    <div class = "col-md-3">
    <div class = "product-top text-center">
        <img src = "../file_uploads/<%=prod.getImageName()%> ">

        <div class = "overlay">
        <a href = "product.jsp?id=<%=prod.getId()%>" ><button type = "button" class = "btn btn-
        secondary" title = "View Product"><i class="fa 
        fa-eye" aria-hidden="true"></i></a></button>
        <%
        if(session.getAttribute("userobj")!=null){%>
        <form action="addWishlistController.jsp" method="POST">
            <input type="hidden" name="id" value="<%=prod.getId()%>">
            <input type="hidden" name="gend" value="<%=gend%>">
            <input type="hidden" name="cat" value="<%=cat%>">
            <button type = "submit" class = "btn btn-
            secondary" title = "Add to Whishlist"><i class="fa 
            fa-heart-o" aria-hidden="true"></i></button>
        </form>
        <form action="addCartController.jsp" method="POST">
            <input type="hidden" name="id" value="<%=prod.getId()%>"> 
            <input type="hidden" name="gend" value="<%=gend%>">
            <input type="hidden" name="cat" value="<%=cat%>">
            <button type = "submit" class = "btn btn-secondary btn-success" title = "Add to Cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i>
            </button>
        </form>
        <%
        }
        %>
        </div>

    </div>


    <div class="product-bottom text-center" style="text-align: center">
        <h3><%= prod.getProductName() %></h3>
        <h5><%= prod.getPrice() %> €</h5>
    </div>

    </div>
    <%  }
    }
    %>
    </div>

    <%
    if (!productsExist) {
    %>

    <div class="alert alert-warning text-center" role="alert" style="margin-bottom: 550px;">
        <strong>No Products for Sale</strong> 
    </div>
    
    <%
    }
    %>

    </div>
    <!-- footer -->
    <%@ include file = "Footer.jsp" %>
    <!-- End footer -->
    <!-- jQuery library -->
		<script src="js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="js/bootstrap.min.js"></script>
</body>
</html>