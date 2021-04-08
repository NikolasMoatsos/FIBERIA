<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>

<%
User user = (User)session.getAttribute("userobj");

if (user == null){
    response.sendRedirect("Profile.jsp");
    return;
}

String name = request.getParameter("name");
String surname = request.getParameter("surname");
String email = request.getParameter("email");
String old = request.getParameter("old");
String newpass = request.getParameter("new");
String confirm = request.getParameter("confirm");

if (name == null || surname == null || email == null || old == null || newpass == null || confirm == null) {
    
    response.sendRedirect("EditProfile.jsp");
    return;
 
}
if (!(name.equals(user.getName()) && surname.equals(user.getSurname()) && email.equals(user.getEmail()) && newpass.equals("") && old.equals("") && confirm.equals(""))){

    boolean name_validation = false;
    boolean surname_validation = false;
    boolean change = false;
    String mess = "<dl>";

    if (name.length() < 3){
        name_validation = true;
        mess +="<dt>Name should be 3 or more characters.</dt>";
    }
    if (surname.length() < 3){
        surname_validation = true;
        mess +="<dt>Surname should be 3 or more characters.</dt>";
    }

    if (!(newpass.equals("") && old.equals("") && confirm.equals(""))){
        if (!old.equals(user.getPassword())) {
            change = true;
            mess +="<dt>Old password does not match.</dt>";
        } else {
            if (newpass.length() < 7){
                change = true;
                mess +="<dt>Password should be 7 or more characters.</dt>";
                
            } else {
                if (!newpass.equals(confirm)){
                    change = true;
                    mess +="<dt>New passwords are not matching.</dt>";
                }
            }
        }
    } else {
        newpass = user.getPassword();
    }
    mess += "</dl>";

    if (name_validation || surname_validation || change) {
        request.setAttribute("message",mess);
%>
<jsp:forward page="EditProfile.jsp"/>
<%
    } else {
        User new_user = new User(name,surname,user.getUsername(),newpass,email);
        UserDAO dao = new UserDAO();
        dao.updateUser(new_user);
        session.setAttribute("userobj",new_user);
        request.setAttribute("success","Your changes <b>have been applied</b>");
    }
}
%>
<jsp:forward page="Profile.jsp"/>
