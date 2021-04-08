<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

if (email == null || password == null) {

    response.sendRedirect("log_in.jsp");
    return;

}

UserDAO dao = new UserDAO();
try{
    User user = dao.authenticate(email, password);
    session.setAttribute("userobj",user);
    %>
    <jsp:forward page="mainPage.jsp"/>
    <%
}catch(Exception e){
    request.setAttribute("message",e.getMessage());
    %>
    <jsp:forward page="log_in.jsp"/>
    <%
}
%>
