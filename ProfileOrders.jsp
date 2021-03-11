<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="authorize.jsp"%>

<%
User user =(User)session.getAttribute("userobj");
String username= user.getUsername();
OrderDAO orderdao = new OrderDAO();
ShippingDAO shippingdao = new ShippingDAO();
List<Integer> ids= new ArrayList<Integer>();
Boolean hasorders=false;
try{
    ids= orderdao.findOrderIdsofuser(username);
    
}catch(Exception e){
    request.setAttribute("message",e.getMessage());
}
if (ids.size() > 0){
    hasorders=true;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/profileOrders.css" rel="stylesheet">
        <link href="css/nav.css" rel="stylesheet">
        <link href="css/footer.css" rel="stylesheet">
        <link rel="icon" href="images/favicon.ico">
        <script src="/bootstrap-4.5.2-dist/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
                    <div class="profile-header ">
                        <div class="cover">
                            <div class="gray-shade"></div>
                            <figure>
                                <img src="images/wallpaper.jpg" class="img-fluid" alt="profile cover" style="height: 320px;">
                            </figure>
                            <div class="cover-body d-flex justify-content-between align-items-center">
                                <div>
                                    <img class="profile-pic" src="images/l60Hf.png" alt="profile">
                                    <span class="profile-name" style="margin-right: 10px;"><%=user.getName()%> <%=user.getSurname()%></span>
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
                                      <a class="dropdown-item" href="#"><i class="far fa-check-square"></i> Orders</a>
                                      <a class="dropdown-item" href="ProfileWhishlist.jsp"><i class="fas fa-heart"></i> Wishlist</a>
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
                                <li class="header-link-item ml-3 pl-3 border-left d-flex align-items-center active visit">
                                    <a class="pt-1px d-none d-md-block icons" href="#" > <i class="far fa-check-square"></i> Orders</a>
                                </li>
                                
                                <li class="header-link-item ml-3 pl-3 border-left d-flex align-items-center visit">
                                    <a class="pt-1px d-none d-md-block icons" href="ProfileWhishlist.jsp" > <i class="fas fa-heart"></i> Wishlist</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
    
            <div class="card rounded  cardShadow bodyMargin">
                <div class=" profcard card-header profcard">
                    <b>Your Orders</b>
                </div>
                <div class="card-body">
                <% 
                if(ids.size() >0){ 
                     for(int id: ids) {
                        Order order =orderdao.findorder(id);
                        List<Product> products =  new ArrayList<Product>();
                        products=orderdao.getProductsFromOrder(id);
                        Shipping ship=shippingdao.findshipping(id);
                        
                %> 
                    <div class="inside-card card">
                        <div class="card-body">
                                <div class="row justify-content-between mb-3">
                                    <div class="col-auto">
                                            <h5 class="color-1 mb-0 "><strong class="orderId"> ORDER</strong> : #<%=order.getId()%></h5>
                                    </div>
                                </div>
                                <% for (Product prod:products) { %>
                                    <div class="row">
                                        <div class="col">
                                            <div class="card card-2">
                                                <div class="card-body">
                                                    <div class="media">
                                                        <div class="sq align-self-center "> <img class="img-fluid my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0 imgSize" src="../file_uploads/<%=prod.getImageName()%>" /> </div>
                                                        <div class="media-body my-auto text-right">
                                                            <div class="row my-auto flex-column flex-md-row">
                                                                <div class="col my-auto descMargin">
                                                                    <h5 class="product-name"><strong><%=prod.getProductName()%></strong></h5>
                                                                </div>
                                                                <div class="col-auto my-auto"> <small>Sold by : <%=prod.getUsername()%></small></div>
                                                                <div class="col my-auto"> <small>Size : <%=prod.getSize()%></small></div>
                                                                <div class="col my-auto">
                                                                    <h6 class="mb-0"><%=prod.getPrice()%> €</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <% } %>
                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="row justify-content-between">
                                                <div class="col-auto">
                                                    <p class="mb-1 text-dark"><b>Order Details</b></p>
                                                </div>
                                                <div class="flex-sm-col text-right col notDisplayed">
                                                    <p class="mb-1"><b>Discount</b></p>
                                                </div>
                                                <div class="flex-sm-col col-auto notDisplayed">
                                                    <p class="mb-1">- 0 €</p>
                                                </div>
                                            </div>
                                            <div class="row justify-content-between">
                                                <div class="flex-sm-col text-right col notDisplayed">
                                                    <p class="mb-1"><b>Delivery Charges</b></p>
                                                </div>
                                                <div class="flex-sm-col col-auto notDisplayed">
                                                    <p class="mb-1">Free</p>
                                                </div>
                                            </div>
                                            <div class="row justify-content-between">
                                                <div class="flex-sm-col text-right col notDisplayed">
                                                    <p class="mb-1"><b>Total</b></p>
                                                </div>
                                                <div class="flex-sm-col col-auto notDisplayed">
                                                    <p class="mb-1"><%=order.getTotal()%> €</p>
                                                </div>
                                            </div>   
                                        </div>
                                    </div>
                                    <div class="row invoice ">
                                        <div class="col details">
                                            <p class="mb-1 display-sm"><b>Total</b> : <%=order.getTotal()%> €</p>
                                            <p class="mb-1"> Invoice Date : <%=order.getPurchaseDate()%></p>
                                            <p class="mb-1">Payment method : Paypal</p>
                                            
                                            <p class="mb-1">Shipping Address : <%=ship.getAddress()%></p>
                                        </div>
                                    </div>
                                    <div class="buttons">
                                        <button type="button" class="btn btn-secondary btnReview" data-toggle="modal" data-target="#form"> Review</button>
                                    </div>             
                                </div>
                            </div>
                            <% }
                            } else {
                            %>
                            <div class="row rowMargin">
                                <div id = "noProducts"> You have made no Orders. See all the products for sale
                                    <br id="breakText"> 
                                    <a href="collection.jsp" class="link">here 
                                        <i class="fas fa-shopping-cart"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
        
        <div class="modal fade" id="form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Review this product</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                    <div class="card-body text-center">
                        <div class=" text-center">
                            <div class="rating"> <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label> <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label> <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label> <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label> </div>
                            <div class="text-center mt-4 buttons3"> <button class="btn btn-secondary send px-5" style="color: black;border-color:#ee8175;" data-dismiss="modal">Send review </button> </div>
                        </div>
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
