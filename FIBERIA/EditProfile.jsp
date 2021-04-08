<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>

<%@ include file="authorize.jsp"%>

<%
User user =(User)session.getAttribute("userobj");
%>

<!DOCTYPE html>
<html>
  <head>
	<title>Edit Profile</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/editProf.css" rel="stylesheet">
    <link href="css/nav.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
    <link rel="icon" href="images/favicon.ico">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        a:hover{
            text-decoration: none;
        }
    </style>
</head>
<body style="background-color: #3c096c;">
    
  <%@ include file = "generalnav.jsp" %>
  
    <div class="container rounded bg-white mt-5 mb-5">
        <form action="editProfileController.jsp" method="POST">
            <div class="row" style="background-color: #fffcf8;">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5" style="margin-top: 105px;">
                        <img src="images/l60Hf.png" class="avatar img rounded-circle" alt="avatar" style="margin-bottom: 7px;width: 100px;height: 100px;">
                        <h6 style="color: black;">Upload a different photo...</h6>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="customFile">
                            <label class="custom-file-label" for="customFile" accept="image/*" style="text-align: left;">Choose an Image</label>
                        </div>
                        <div class="mt-4 text-center buttons2">
                            <button class="btn  primary profile-button" type="button" style="color:black;border-color: #ee8175;">Apply Image</button>
                            <small id="titleHelp" class="form-text text-muted">
                                not working
                            </small>
                        </div>
                    </div>
                </div>
            
                <div class="col-md-5 border-right">
                    <div class="p-3 py-5" style="color:#3c096c;">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right" style="font-size:xx-large;margin-bottom: 25px;color:#ee8175;margin-top: 20px;"><i class="fa fa-user" style="margin-right: 5px;color:#ee8175;"></i>Profile Settings</h4>
                        </div>

                        <% if(request.getAttribute("message") != null) { %>		
                            <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
                        <% } %>

                        <div class="row mt-2" style="color: black;">
                            <div class="col-md-6"><label class="labels" style="font-size: small;">Name</label><input type="text" name="name" class="form-control" value="<%= user.getName() %>" required></div>
                            <div class="col-md-6"><label class="labels" style="font-size: small;">Surname</label><input type="text" name="surname" class="form-control" value="<%= user.getSurname() %>" required></div>
                        </div>
                        <div class="row mt-3 " style="color:black;">
                            <div class="col-md-12"><label class="labels" style="font-size: small;">Username</label><input type="text" class="form-control" style="margin-bottom: 15px;" value="<%= user.getUsername() %>" disabled></div>
                            <div class="col-md-12"><label class="labels" style="font-size: small;">Email</label><input type="email" name="email" class="form-control" style="margin-bottom: 15px;" value="<%= user.getEmail() %>" required></div>  
                        </div>
                    </div>
                </div>
                <div class="col-md-4" style="color: black;">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center experience" style="margin-top: 100px;font-size: medium;margin-bottom: 10px;"><span>Set new password :</span></div>
                        <div class="col-md-12"><label class="labels" style="font-size: small;margin-bottom: 10px;">Old password</label><input type="password" name="old" class="form-control" ></div>
                        <div class="col-md-12"><label class="labels" style="font-size: small;margin-bottom: 10px;">New password</label><input type="password" name="new" class="form-control" ></div>
                        <div class="col-md-12"><label class="labels" style="font-size: small;"> Confirm New password</label><input type="password" name="confirm"  class="form-control" ></div>
                    </div>
                </div>
                <div class="col-md-11">
                    <div class="mt-5 text-center buttons"><button class="btn  primary profile-button" type="submit" style="color:black;border-color: #ee8175;">Save Changes</button></div>   
                </div>
            </div>
        </form>
    </div>

    <%@ include file = "Footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>
