<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="authorize.jsp"%>

<%
User user =(User)session.getAttribute("userobj");
WishlistDAO dao = new WishlistDAO();
List<Product> products = new ArrayList<Product>();

try{
    products = dao.getProductsFromWishlist(user.getUsername());
}catch(Exception e){
    request.setAttribute("message",e.getMessage());
}

%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/whishlist.css">
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
    
        <div class="profile-page tx-13 bodyMargin">
            <div class="row">
                <div class="col-12 grid-margin">
                    <div class="profile-header">
                        <div class="cover">
                            <div class="gray-shade"></div>
                            <figure>
                                <img src="images/wallpaper.jpg" class="img-fluid" alt="profile cover" style="height: 320px;">
                            </figure>
                            <div class="cover-body d-flex justify-content-between align-items-center">
                                <div>
                                    <img class="profile-pic" src="images/l60Hf.png" alt="profile">
                                    <span class="profile-name" style="margin-right: 10px;"><%= user.getName()%> <%= user.getSurname()%></span>
                                    <span class="fas fa-star starColor"></span>
                                    <span class="fas fa-star starColor"></span>
                                    <span class="fas fa-star starColor"></span>
                                    <span class="fas fa-star-half-alt starColor"></span>
                                    <span class="far fa-star starColor" style="margin-right: 5px;"></span><span id="rate"><b>(7.1)</b></span>
                                </div>
                                <div class="dropdown drop">
                                    <button class="btn btn-secondary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-bars"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                      <a class="dropdown-item" href="Profile.jsp"><i class="fas fa-th-large"></i> Selling</a>
                                      <a class="dropdown-item" href="ProfileOrders.jsp"><i class="far fa-check-square"></i> Orders</a>
                                      <a class="dropdown-item" href="#"><i class="fas fa-heart"></i> Wishlist</a>
                                      <a class="dropdown-item" href="EditProfile.jsp"><i class="fas fa-edit" aria-hidden="true"></i> Edit Profile</a>
                                    </div>
                                </div>
                                <div class="d-none d-md-block">
                                    <form action="EditProfile.jsp">
                                        <div class="buttons2">
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
                                <li class="header-link-item d-flex align-items-center visit">
                                    <a class="pt-1px d-none d-md-block icons" href="Profile.jsp" ><i class="fas fa-th-large"></i> Selling</a>
                                </li>
                                <li class="header-link-item ml-3 pl-3 border-left d-flex align-items-center visit">
                                    <a class="pt-1px d-none d-md-block icons" href="ProfileOrders.jsp" > <i class="far fa-check-square"></i> Orders</a>
                                </li>
                                
                                <li class="header-link-item ml-3 pl-3 border-left d-flex align-items-center active visit">
                                    <a class="pt-1px d-none d-md-block icons" href="#" > <i class="fas fa-heart"></i> Wishlist</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
    
    
    
            <div class="card rounded shopping-cart cardShadow">
                <div class="card-header  text-light profcard">
                        <span style="font-size: large;"><b>Your List</b></span>
                    <div class="clearfix"></div>
                </div>
                
                <div class="card-body">
                    <% if(request.getAttribute("wishlistDelete") != null) { %>		
                        <div class="alert alert-success" role="success"><%=(String)request.getAttribute("wishlistDelete") %>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button></div>
                      <%}%>
                      <% if(request.getAttribute("cart") != null) { %>		
                        <div class="alert alert-success" role="success"><%=(String)request.getAttribute("cart") %> <i class="fa fa-shopping-cart" aria-hidden="true"></i><button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button></div>
                    <% } %> 
                    <% if(request.getAttribute("cartProblem") != null) { %>		
                        <div class="alert alert-danger" role="success"><%=(String)request.getAttribute("cartProblem") %><button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button></div>
                    <% }
                        int s = 0;
                        for(Product prod : products){
                            s+=prod.getPrice();
                    %>
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-2 text-center img-medium">
                                    <img class="img-responsive imgSize" src="../file_uploads/<%=prod.getImageName()%>" alt="prewiew">
                            </div>
                            <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6 details-sm">
                                <h4 class="product-name"><strong><%= prod.getProductName() %></strong></h4>
                                <h5>
                                    <small>seller : <%= prod.getUsername()%><br>size : <%= prod.getSize()%><br></small>
                                </h5>
                            </div>
                            <div class="col-8 col-sm-5 text-sm-center col-md-4 text-md-right row buy-sm">
                                <div class="col-12 col-sm-7 col-md-6 text-md-right">
                                    <h5 id="price"><strong><%= prod.getPrice()%> €</strong></h5>
                                </div>
                                    
                                <div class="col-7 col-sm-3 col-md-4 buttons-align">
                                    <form action="addCartController.jsp" method="POST">
                                        <input type="hidden" name="id" value="<%=prod.getId()%>">
                                        <input type="hidden" name="wish" value="wish"> 
                                        <div class="buttons">
                                            <button type = "submit" class="btn btn-outline-success btn-xs cartColor bin" title = "Add to Cart">
                                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                            </button>
                                        </div>
                                    </form>
                                    <form action="deleteFromWishlistController.jsp"  method="POST">
                                        <input type="hidden" name="id" value="<%=prod.getId()%>"> 
                                        <button type="submit" class="btn btn-outline-danger btn-xs bin">
                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                        </button>
                                      </form>
                                </div>
                            </div>
                        </div>
                        <hr>
                    <%}
                    if (products.size() == 0){
                    %>
                    <div class="row rowMargin">
                        <div id="noProducts"> Your Wishlist is empty. See all the products for sale 
                            <br id="breakText">
                            <a href="collection.jsp" class="link">here 
                                <i class="fas fa-shopping-cart"></i>
                            </a>
                        </div>
                    </div>
                    <%
                    }    
                    %>
                    </div>
                <% if (products.size() != 0){ %>
                <div class="card-footer" style="background-color: whitesmoke;">
                    <div class="coupon col-md-5 col-sm-5 no-padding-left pull-left">
                        <div class="row">
                        </div>
                    </div>
                    <div class="pull-right" style="margin: 10px">
                        <div class="pull-right" style="margin: 5px;text-align: right;">
                            Total price: <b><%=s%>€</b>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>       
        </div>
    </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <%@ include file = "Footer.jsp" %>
    </body>
</html>
