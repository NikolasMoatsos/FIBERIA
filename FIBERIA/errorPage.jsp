<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>

	
<!DOCTYPE html>
<html lang="en">
	<head>
	<title>Error Page</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/profile.css" rel="stylesheet">
        <link href="css/nav.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            a:hover{
                text-decoration: none;
            }
        </style>
    </head>

	<body style="background-color: #fffcf8;">

		<%@ include file = "generalnav.jsp" %>

		<div class="container" role="main" style="margin-top: 110px;">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron" style="background-color: #eeeeee;">
				<h1>Something went wrong.. <i class="far fa-frown"></i></h1>
			</div>
<% if(exception != null) { %>
			<!-- Page Title -->
			<div class="page-header">
				<h1>Error</h1>
				<hr>
			</div>		

			<div class="alert alert-danger" role="alert">
				<p>
					<b>Message: </b> <%= exception.getMessage() %>
				</p>
				<p>
					<b>Class: </b> <%= exception.getClass() %>
				</p>
			</div>
<% } %>			
		</div>
		<!-- /container -->
	</body>
</html>