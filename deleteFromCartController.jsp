<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>

<%
User user =(User)session.getAttribute("userobj");
String id = request.getParameter("id");
int new_id =  Integer.parseInt(id);
CartDAO dao = new CartDAO();
dao.deleteFromCart(user.getUsername(), new_id);
request.setAttribute("cartdelete","The product <b>has been removed</b> from your Cart");
%>

<jsp:forward page="cart.jsp"/>