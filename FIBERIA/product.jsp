<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>
<%
    String id1 = (String)request.getParameter("id");
    ProductDAO productdao = new ProductDAO();
    int id = -1;

    try {
      id =  Integer.parseInt(id1);
    } catch (NumberFormatException e) {

    }
    
    Product theproduct = new Product();
    try{

      theproduct = productdao.findProduct(id); 

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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product display</title>
    <link rel="stylesheet" href="css/nvb.css">
    <link rel="stylesheet" href="css/products.css">
    <link rel="stylesheet" href="all.min.css">
    <link href="css/footer.css" rel="stylesheet">
    <link rel="icon" href="images/favicon.ico">
    <link rel="canonical" href="bootstrap-4.3.1/site/docs/4.3/examples/carousel/index.html">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
      
</head>
<body style="background-color: #fffcf8;">

  <%@ include file = "generalnav.jsp" %>

 
    <br>
    <br>
    <br>
    <br><br><br>
    <div class="container" style="max-width: 80%" >
    <div class="card mb-3" style="max-width: 100%; border-color: #27272c">
        <div class="row no-gutters">
          <div class="col-md-4">
            <img src="../file_uploads/<%=theproduct.getImageName()%>" class="card-img" alt="IMAGE NOT FOUND" style="border-color:#27272c" height="200px" width="400px">
          </div>
          <div class="col-md-8">
            <div class="card-header " style="border-color:#27272c; background-color: #ed8074">
              <h3 class="card-title" style="text-align: center; color: white"><%= theproduct.getProductName() %>
              </h3>
            </div>

            <div class="card-body">
              <div class="card-text" style="text-align: left;"><h4>Product Info</h4></div>
              <p class="card-text">
                <ul class="list">
                  <li>Price: <%= theproduct.getPrice() %> €</li>
                  <li>Brand: <%= theproduct.getBrand() %></li>
                  <li>Size: <%= theproduct.getSize() %></li>
                  <li>Gender: <%= theproduct.getGender() %></li>
                  <li>Color: <%= theproduct.getColor() %></li>
                  <li>Packaged: <%= theproduct.getPackaged() %></li>
                  <li>Purchase Date: <%= theproduct.getPurchaseDate() %></li>  
                  <li>Owner: <%= theproduct.getUsername() %></li> 
                  <li>Owner's Rating: <i class="fa fa-star" style="color: gold;"></i>
                    <i class="fa fa-star" style="color: gold;"></i>
                    <i class="fa fa-star" style="color: gold;"></i>
                    <i class="fa fa-star-half-o" style="color: gold;"></i>
                  </li> 
                </ul>
              </p>
              <p class="card-text" style="text-align: left;"><h4>Description</h4> <%= theproduct.getDescription() %> </p>
              
            </div>
            <div class="card-text" style="text-align: right;margin-right: 5px;"><small class="text-muted">Post Date: <%= theproduct.getPostDate()%></small></div>
            <div class="card-footer" style="border-color: #27272c; padding-bottom: 30px;">
            <div class="buttons" style="padding-top: 25px;">
              <a href="collection.jsp"><button>Go Back</button></a>
              <%
              if(session.getAttribute("userobj")!=null){%>
            <form action="addCartController.jsp" method="POST">
              <input type="hidden" name="id" value="<%=id%>">
              <button type="submit" id="add-to-cart">Add To Cart</button>
            </form>
            <%
            }
            %>
                          
          </div>
        </div>
        </div>

          </div>
            
        </div>
        </div>
      </div>
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
