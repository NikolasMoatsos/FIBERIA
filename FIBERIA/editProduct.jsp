<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>
<%@ include file="authorize.jsp"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%@ include file="authorize.jsp"%>

<% 
User user =(User)session.getAttribute("userobj");
String id = (String)request.getParameter("id");
int new_id = -1;

Product prod = new Product();

try {
  new_id =  Integer.parseInt(id);
  } catch (NumberFormatException e) {

}
ProductDAO productdao= new ProductDAO();
try{

    prod = productdao.findProduct(new_id); 
    
  }catch(Exception e){

    request.setAttribute("message",e.getMessage());
    %>
    <jsp:forward page="Profile.jsp"/>
    <%

  }
session.setAttribute("productobj", prod);
%>

<!DOCTYPE html>
<html>
  <head>
	<title>Edit Product</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/editProduct.css" rel="stylesheet">
    <link href="css/nav.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
<link rel="icon" href="images/favicon.ico">
    <script src="bootstrap-4.5.2-dist/js/bootstrap.min.js"></script>
    <script src="bootstrap-4.5.2-dist/js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
      a:hover{
          text-decoration: none;
      }
  </style>
  </head>
  <body>
  
    <%@ include file = "generalnav.jsp" %>
  
    <div class="container cont" style="color:black">
        <h2 style="color: #ee8175;"><i class="fas fa-cog" style="margin-left: 5px;margin-top: 20px;"></i> Product Settings</h2>
        <hr>

        <% if(request.getAttribute("message") != null) { %>		
        <div class="form-row">
            <div class="form-group col-md-12 alert alert-danger text-center" role="alert" ><%=(String)request.getAttribute("message") %></div>
        </div>
        <% } %>

        <% if(request.getAttribute("successmessage") != null) { %>		
          <div class="form-row">
              <div class="form-group col-md-12 alert alert-success text-center" role="alert" ><%=(String)request.getAttribute("successmessage") %> <i class="fas fa-check"></i><button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
              </div>
          </div>
          <% } %>

      <div class="row">
          <!-- left column <input type="file" class="custom-file-input" id="customFile">-->
          <form class="col-md-3"  action="uploadImageController.jsp" method="post" enctype="multipart/form-data">
          <div class="form-row custrowImg" style="margin-top: 10px;">
            <div class="text-center ">
              <img src="../file_uploads/<%=prod.getImageName()%>" class="avatar img-circle" alt="avatar" height="150" width="145">
              <h6 style="margin-top: 5px; ">Upload a different photo...</h6> 
              <div class="custom-file form-row">
                <input type="file" name="file" size="50" class="custom-file-input" id="customFile" accept="image/*">
                <label class="custom-file-label" for="customFile">Choose an Image</label>
                <br>
                <br>
                <div class="text-center buttons2"><button class="btn  primary profile-button" type="submit" style="color:black;border-color: #ee8175;">Apply Image</button></div>
              </div>
            </div>
            
          </div>
          </form>
          <!-- edit form column -->
          <div class="col-md-9 personal-info">
  
            <h3 class="titl">Product Details</h3>
            
            <form class="form-horizontal" action="editProductController.jsp" role="form" method="POST">
              <div class="form-group">
                <label class="col-lg-3 control-label labels">Product Title</label>
                <div class="col-lg-8">
                  <input class="form-control" type="text" name="productName" value="<%=prod.getProductName()%>" required>
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label labels" > Discription </label>
                <div class="col-lg-8">
                  <textarea type="text" class="form-control" name="description" ><%=prod.getDescription()%></textarea>
                </div>
              </div>
              <div class="form-row custrow">
                <div class="form-group prices">
                  <label class="col-lg-3 control-label labels">Price</label>
                  <div class="col-lg-8">
                    <input class="form-control" type="text" name="price" value="<%=prod.getPrice()%>">
                  </div>
                </div>
              <div class="form-group custcol">
                <label class="col-lg-3 control-label labels">Size</label>
                <div class="col-lg-12">
                  <div class="ui-select">
                    <select id="user_time_zone" class="form-control"  name="size">
                    <option selected hidden><%=prod.getSize()%></option>
                      <option>XS</option>
                      <option>S</option>
                      <option>M</option>
                      <option>L</option>
                      <option>XL</option>
                      <option>XXL</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label labels">Gender</label>
                <div class="col-lg-12">
                  <div class="ui-select">
                    <select id="user_time_zone" class="form-control" name="gender">
                      <option selected hidden><%=prod.getGender()%></option>
                      <option>Male</option>
                      <option>Female</option>
                      <option>Unisex</option>
                      <option>Kid</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
              <div class="form-group">
                <label class="col-lg-3 control-label labels">Category</label>
                <div class="col-lg-8">
                  <div class="ui-select">
                    <select id="user_time_zone" class="form-control" name="category">
                      <option selected hidden><%=prod.getCategory()%></option>
                      <option>Tops</option>
                        <option>Bottoms</option>
                        <option>Jackets & Coats</option>
                        <option>Dresses</option>
                        <option>Swimwear</option>
                        <option>Underwear & socks</option>
                        <option>Shoes</option>
                        <option>Accessories</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="form-group  " >
                    <label for="inputDate" class="col-lg-3 control-label labels">Date of Purchase</label><br>
                    <div class="col-lg-8">
                    <input type="date" class="text-muted" name="purchaseDate" value="<%=prod.getPurchaseDate()%>">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label labels">Color</label>
                <div class="col-lg-8">
                  <div class="ui-select">
                    <select id="user_time_zone" class="form-control" name="color">
                      <option selected hidden><%=prod.getColor()%></option>
                      <option>White</option>
                        <option>Black</option>
                        <option>Grey</option>
                        <option>Yellow</option>
                        <option>Green</option>
                        <option>Red</option>
                        <option>Blue</option> 
                        <option>Orange</option>
                        <option>Pink</option>
                        <option>Purple</option>
                        <option>Brown</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label labels">Brand</label>
                <div class="col-lg-8">
                  <input class="form-control" value="<%=prod.getBrand()%>" name="brand">
                </div>
              </div>
              <div class="form-group form-row"  >
                <div class="form-group col-lg-8 pull-left" style="text-align: center;">
                    <label for="inputPackage">Is the product packaged ?</label><br>
                      
                     <% if(prod.getPackaged().equals("packaged")){ %>
                    <label for="checkbox1"> Yes</label>
                    <input type="radio" id="checkbox1" name="packaged" value="packaged" checked>
                    <label for="checkbox2"> No</label>
                    <input type="radio" id="checkbox2" name="packaged" value="not packaged" >
                    <% }else{ %>
                        <label for="checkbox1"> Yes</label>
                    <input type="radio" id="checkbox1" name="packaged" value="packaged" >
                    <label for="checkbox2"> No</label>
                    <input type="radio" id="checkbox2" name="packaged" value="not packaged" checked>
                    <% } %>
                  </div>
              </div>
              <div class="buttons">
                <button class="btn btn-success primary profile-button" type="submit" style="color:black;border-color: #ee8175">Save Changes</button>
              </div>
            </form>
          </div>
      </div>
    </div>
    <%@ include file = "Footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  </body>
  <script>
    // Add the following code if you want the name of the file appear on select
    $(".custom-file-input").on("change", function() {
      var fileName = $(this).val().split("\\").pop();
      $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
    </script> 
</html>
