<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
if (session.getAttribute("userobj") == null){
request.setAttribute("message", "You have to Sign in first !");
%>
<jsp:forward page="log_in.jsp" />
<%
}
%>