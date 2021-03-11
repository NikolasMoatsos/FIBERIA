<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>

<%
User user =(User)session.getAttribute("userobj");
String id = request.getParameter("id");
String cat = request.getParameter("cat");
String gend = request.getParameter("gend");
int new_id =  Integer.parseInt(id);
WishlistDAO dao = new WishlistDAO();
try{
    dao.addToWishlist(user.getUsername(), new_id);
    request.setAttribute("wishlist","The product <b>has been added</b> to your Wishlist");
}catch(Exception e){
    String mes = "The product has been <b>already added</b> to your Wishlist ";
    request.setAttribute("wishlistProblem",mes);
}

%>
    <jsp:forward page="colection.jsp">
            <jsp:param name="cat" value="<%=cat%>" ></jsp:param>
            <jsp:param name="gend" value="<%=gend%>" ></jsp:param>
    </jsp:forward>