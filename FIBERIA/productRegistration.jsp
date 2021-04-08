<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>

<%@ include file="authorize.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Fiberia Product Display</title>
    <link rel="stylesheet" href="css/nvb.css">
    <link rel="stylesheet" href="css/product_registration.css">
    <link href="css/footer.css" rel="stylesheet">
    <link rel="icon" href="images/favicon.ico">
    <link rel="stylesheet"
    href = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet"
    href = "https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</head>
<body style="background-color: #fffcf8;"> 

  <%@ include file = "generalnav.jsp" %>

    <div class="container cont" style="margin-bottom: 150px;">
      <div class="jumbotron" style="text-align: center; background-color: #ed8074; padding-top: 20px;
      padding-bottom: 20px; margin-left: -10px; margin-right: -10px;">
        <h1 style="color: white">
          Product Registration Form
        </h1>
      </div>
      <form action="productRegistrationController.jsp" method="POST" >
        <% if(request.getAttribute("message") != null) { %>		
          <div class="form-row">
          <div class="form-group col-md-12 alert alert-danger text-center" role="alert" ><%=(String)request.getAttribute("message") %></div>
        </div>
        <% } %>
        <div class="form-row">
          <div class="form-group col-md-6" style="padding-left: 40px ; padding-right: 40px ;">
            <label for="inputUsername">Username</label>
            <%User user = (User)session.getAttribute("userobj");%>
            <input  class="form-control"  value="<%= user.getUsername()%>" disabled>
            <input name="username" value="<%= user.getUsername()%>" hidden>
          </div>
          <div class="form-group col-md-6"style="padding-left: 40px ; padding-right: 40px ;">
            <label for="inputTitle" >Product Title</label>
            <input class="form-control" id="title" name="productName" placeholder="Insert product's title" required>
            <small id="titleHelp" class="form-text text-muted">
              This is how other users will be seeing the product you register.
            </small>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6" style="padding-left: 40px ; padding-right: 40px ;">
            <label for="inputBrand">Brand</label>
            <input  class="form-control" id="brand" name="brand" placeholder="Insert product's brand" required>
          </div>
          <div class="form-group col-md-6 " style="padding-left: 40px ; padding-right: 40px ;">
            <label for="inputDate">Date of Purchase</label><br>
            <input type="date" class="text-muted" name="purchaseDate" value="17/12/2020">
          </div>
        </div>
        

       
        <div class="form-row">
        <div class="form-group col-md-6 pull-left" style="padding-left: 40px ; padding-right: 40px ;">
          <label for="inputGender">Gender</label>
          <select id="inputGender" class="form-control" name="gender">
            <option selected>---Select Gender---</option>
            <option>Male</option>
            <option>Female</option>
            <option>Unisex</option>
            <option>Kid</option>
          </select>
        </div>
        <div class="form-group col-md-6 pull-left" style="padding-left: 40px ; padding-right: 40px ;">
          <label for="inputCategory">Category</label>
          <select id="inputCategory" class="form-control" name="category">
            <option selected>---Select Category---</option>
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
      <div class="form-row">
        <div class="form-group col-md-6 pull-left" style="padding-left: 40px ; padding-right: 40px ;">
          <label for="inpuSize">Size</label>
          <select class="form-control" id="inputZip" name="size">
            <option selected>---Select Size---</option>
            <option>XS</option>
            <option>S</option>
            <option>M</option>
            <option>L</option>
            <option>XL</option>
            <option>XXL</option>
            </select>
        </div>
          
          <div class="form-group col-md-6 pull-left" style="padding-left: 40px ; padding-right: 40px ;">
            <label for="inputColor">Color</label>
            <select class="form-control" id="inputZip" name="color">
              <option selected>---Select Color---</option>
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
          <div class=form-row>
            <div class="form-group col-md-6 pull-left" style="padding-left: 40px ; padding-right: 40px ;">
              <label for="inputPrice">Price</label>
              <input  class="form-control" id="price" name="price" placeholder="Set a price for your product..." required>
            </div>
            <div class="form-group col-md-6 pull-left" style="text-align: center;">
              <label for="inputPackage">Is the product packaged ?</label><br>
              <label for="checkbox1"> Yes</label>
              <input type="radio" id="checkbox1" name="packaged" value="packaged">
              <label for="checkbox2"> No</label>
              <input type="radio" id="checkbox2" name="packaged" value="not packaged">
              
            </div>
            </div>
        <div class="form-group row-md-2" style="padding-left: 40px ; padding-right: 40px ;">
          <label for="inputDescription">Description</label>
          <textarea type="text" class="form-control" id="inputDescription" name="description" placeholder="Insert a short description of the product..." required></textarea>
        </div>
        <div class="buttons" style="margin-top: 50px; margin-bottom: 20px; margin-left: 40px; margin-right: 40px;" >
          <button type="reset" style="border-color:#ed8074 !important;">Cancel</button>     
          <button type="submit" style="border-color:#ed8074 !important;">Register Product</button>
      </div>
      </form>
    </div>
    <%@ include file = "Footer.jsp" %>
  </body>
  </html>