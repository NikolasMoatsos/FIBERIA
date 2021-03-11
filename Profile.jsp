<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="authorize.jsp"%>

<%
User user =(User)session.getAttribute("userobj");
List<Product> products = new ArrayList<Product>();
ProductDAO dao = new ProductDAO();
try{
    products = dao.getUserProducts(user.getUsername());
}catch(Exception e){
    
}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/profileMain.css" rel="stylesheet">
        <link href="css/nav.css" rel="stylesheet">
        <link href="css/footer.css" rel="stylesheet">
        <link rel="icon" href="images/favicon.ico">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
    <div class="container">
    
        <%@ include file = "generalnav.jsp" %>
    
        <div class="profile-page tx-13">
            <div class="row">
                <div class="col-12 grid-margin">
                    <div class="profile-header borders">
                        <div class="cover">
                            <div class="gray-shade"></div>
                            <figure>
                                <img src="images/wallpaper.jpg" class="img-fluid" alt="profile cover" style="height: 320px;">
                            </figure>
                            <div class="cover-body d-flex justify-content-between align-items-center">
                                <div>
                                    <img class="profile-pic" src="images/l60Hf.png" alt="profile">
                                    <span class="profile-name" style="margin-right: 10px;"><%= user.getName()%> <%= user.getSurname()%></span>
                                    <span class="fas fa-star starColor "></span>
                                    <span class="fas fa-star starColor " ></span>
                                    <span class="fas fa-star starColor" ></span>
                                    <span class="fas fa-star-half-alt starColor" ></span>
                                    <span class="far fa-star starColor" style="margin-right: 5px;"></span><span id="rate"><b>(7.1)</b></span>
                                </div>
                                <div class="dropdown drop">
                                    <button class="btn btn-secondary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-bars"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                      <a class="dropdown-item" href="#"><i class="fas fa-th-large"></i> Selling</a>
                                      <a class="dropdown-item" href="ProfileOrders.jsp"><i class="far fa-check-square"></i> Orders</a>
                                      <a class="dropdown-item" href="ProfileWhishlist.jsp"><i class="fas fa-heart"></i> Wishlist</a>
                                      <a class="dropdown-item" href="EditProfile.jsp"><i class="fas fa-edit" aria-hidden="true"></i> Edit Profile</a>
                                    </div>
                                </div>
                                <div class="d-none d-md-block">
                                    <form action="EditProfile.jsp">
                                    
                                        <div class="buttons">
                                            <button type="submit" class="btn btn-primary btn-xs editBtn">
                                                <i class="fas fa-edit" aria-hidden="true"></i> Edit profile
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="header-links">
                            <ul class="links d-flex align-items-center mt-3 mt-md-0">
                                <li class="header-link-item d-flex align-items-center active visit">
                                    <a class="pt-1px d-none d-md-block icons" href="#"><i class="fas fa-th-large"></i> Selling</a>
                                </li>
                                <li class="header-link-item ml-3 pl-3 border-left d-flex align-items-center visit">
                                    <a class="pt-1px d-none d-md-block icons" href="ProfileOrders.jsp"><i class="far fa-check-square"></i> Orders</a>
                                </li>
                                
                                <li class="header-link-item ml-3 pl-3 border-left d-flex align-items-center visit">
                                    <a class="pt-1px d-none d-md-block icons" href="ProfileWhishlist.jsp"><i class="fas fa-heart"></i> Wishlist</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
           
            <% if(request.getAttribute("success") != null) { %>		
                <div class="alert alert-success text-center" role="success"><%=(String)request.getAttribute("success") %>  <i class="fas fa-check"></i><button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button></div>
              <%}%>
              <% if(request.getAttribute("successdel") != null) { %>		
                <div class="alert alert-success text-center" role="success"><%=(String)request.getAttribute("successdel") %>  <i class="fas fa-trash-alt"></i><button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button></div>
              <%}%>
                <div class="card cardShadow bodyMargin">
                    <div class=" profcard card-header">
                        <b>Your Products</b>
                    </div>
                    
                    <div class="card-body">
                        <div class="row rowMargin">
                            <%
                            boolean productsExist = false;
                            for(Product prod : products){
                                if (prod.getOrderId() == 0){
                                    productsExist = true;
                            %>
                           <div class = "col-md-3">
                                    <div class="product-top text-center">
                                    <img src = "../file_uploads/<%=prod.getImageName()%>" class="imgSize">
                                        <div class = "overlay">
                                            <form action="editProduct.jsp">
                                                <input name="id" value="<%= prod.getId() %>" hidden>
                                            <button type = "submit" class = "btn btn-
                                            secondary" title = "Edit Product"><i class="fas 
                                            fa-edit bt" aria-hidden="true"></i></button>
                                            </form>
                                            <button type = "button" class = "btn" title = "Remove Product" data-toggle="modal" data-target="#remove<%=prod.getId()%>"><i class="fas fa-times" aria-hidden="true"></i></button>
                                        </div>
                                    </div>
                                    <div class="product-bottom text-center" style="text-align: center">
                                        <h3 class="clothesTop"><%= prod.getProductName() %></h3>
                                        <h5><%= prod.getPrice()%> €</h5>
                                    </div>
                            </div>
                                <div class="modal fade" id="remove<%=prod.getId()%>" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="removeLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered modal-sm">
                                      <div class="modal-content">
                                        <div class="modal-body">
                                         Are you sure you want to delete this item ?
                                        </div>
                                        <div class="modal-footer">
                                        <form action="deleteController.jsp" method="POST">
                                            <input type="hidden" name="img" value="<%=prod.getImageName()%>"> 
                                            <input type="hidden" name="id" value="<%=prod.getId()%>"> 
                                            <button type="submit" class="btn btn-primary btn-danger">Delete</button>
                                        </form>
                                          <button type="button" class="btn  btn-secondary" data-dismiss="modal">Cancel</button>
                                        </div>
                                      </div>
                                    </div>
                                </div>
                                <% } } 
                                if (!productsExist){
                                %>
                                <div id = "noProducts"> You don't sell any product right now. 
                                    <br id="break"> 
                                    <a href="product_registration.jsp"  class="link"> Sell now 
                                        <i class="fas fa-arrow-alt-circle-up"></i>
                                    </a>
                                </div>
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
<%@ include file = "Footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>
