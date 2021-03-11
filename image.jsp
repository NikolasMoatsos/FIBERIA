<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fiberia_classes.*"%>

<%
Product prod = (Product)session.getAttribute("prodobj");

if (prod == null){
    response.sendRedirect("product_registration.jsp");
    return;
}
%>

<html>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-4.5.2-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap-4.5.2-dist/js/bootstrap.min.js"></script>
    <script src="bootstrap-4.5.2-dist/js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="css/nvb.css">
    <link rel="stylesheet" href="css/uploadImage.css">
    <link href="css/footer.css" rel="stylesheet">
    <link rel="icon" href="images/favicon.ico">
    </head>
    <body class="text-center">
        <nav class="navbar navbar-expand-md navbar-dark fixed-top navbar-custom" style="height: 72px;">
            <a class="navbar-brand" href="mainPage.jsp" style="color: #ed8074;"><strong>Fiberia</strong></a>
        </nav>
       <div class="container" style="margin-top: 150px;">
        <% if(request.getAttribute("message") != null) { %>	
        <div class="col-md-6 card text-center" style="margin: auto;border-color:#fffcf8;background-color: #fffcf8;">	
          <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
        </div>
        <% } %>
        <div class="card text-center col-md-6" style="margin: auto; margin-top: 5px;">
          
            <div class="card-header">
              <h3>Last Step</h3>
            </div>
            <div class="card-body">
              <h5 class="card-title">Please choose an image!</h5>
              <p class="card-text">Please instert a clear and recent image of the product you wish to register</p>
              <form action="uploadController.jsp" method="post" enctype="multipart/form-data">
                
                    <div class="custom-file">
                      <input type="file"name="file" size="50" class="custom-file-input" id="customFile" accept="image/*">
                      <label class="custom-file-label" for="customFile">Choose an image</label>
                      <small id="titleHelp" class="form-text text-muted">
                        Verify that your images name have only latin characters.
                      </small>
                  <input id="submit" type="submit" value="Upload File" />
                  <br>
                    </div>
                  </form>
            </div>
            <div class="card-footer textarea" style="color: #ed8074; margin-top: 10px;">
              FIBERIA
            </div>
          </div>
       </div>  
      <%@ include file = "Footer.jsp" %>
    </body>
    <script>
                  // Add the following code if you want the name of the file appear on select
                  $(".custom-file-input").on("change", function() {
                    var fileName = $(this).val().split("\\").pop();
                    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
                  });
                  </script> 
</html>