<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>

<% 

String name = request.getParameter("name");

String surname = request.getParameter("surname");

String email = request.getParameter("email");

String username = request.getParameter("username");

String password = request.getParameter("password");

String confirm = request.getParameter("confirm");

String terms = request.getParameter("terms");

if (name == null || surname == null || email== null || username== null || password == null || confirm == null) {
    
    response.sendRedirect("registration.jsp");
    return;
 
 }

String message = "<dl>" ;


name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
surname = new String(surname.getBytes("ISO-8859-1"), "UTF-8");

boolean name_validation = false;
boolean surname_validation = false;
boolean username_validation = false;
boolean password_validation = false;
boolean confirm_password_validation = false;
boolean terms_validation = false;

if( name.length() >= 3){
    name_validation = true;
}
else{
    message += "<dt>Name should be 3 or more characters.</dt>";
}    

if( surname.length() >= 3){
    surname_validation = true;
}
else{
    message += "<dt>Surname should be 3 or more characters.</dt>";
}

if( username.length() >= 5){
    username_validation = true;
}
else{
    message += "<dt>Username should be 5 or more characters.</dt>";
}

if( password.length() >= 7){
    password_validation = true;
}
else{
    message += "<dt>Password should be 7 or more characters.</dt>";
}

if( password.equals(confirm)){
    confirm_password_validation = true;
}
else{
    message += "<dt>Passwords are not matching</dt>";
}

if( terms != null){
    terms_validation = true;
}
else{
    message += "<dt>You have to accept terms!</dt>";
}

message += "</dl>";

if(name_validation && surname_validation && username_validation
 && password_validation && confirm_password_validation && terms_validation){

    User user1 = new User(name, surname, username, password, email);
    UserDAO userdao1 = new UserDAO();
    try{
        userdao1.register(user1);
    } catch(Exception e){
        request.setAttribute("message",e.getMessage());
    %>
    <jsp:forward page="registration.jsp"/>
    <%
    }
    %>
    <jsp:forward page="mainPage.jsp"/>
 <% } else{
    request.setAttribute( "message", message); 
    %>
    <jsp:forward page="registration.jsp"/>
    <%
 }
%>
