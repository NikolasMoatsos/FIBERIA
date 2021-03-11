<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>

<%

String firstname = request.getParameter("firstname");

String lastname = request.getParameter("lastname");

String phone = request.getParameter("phone");

String address = request.getParameter("address");

String zipcode = request.getParameter("zipcode");

String email = request.getParameter("email");

if (firstname == null || lastname == null || phone == null || address == null || zipcode == null || email == null) {
    
    response.sendRedirect("checkout.jsp");
    return;
 
 }

String mess = "<dl>";
int counter = 0;
    
if (phone.length() != 10){
    mess +="<dt>Please insert a valid phone number.</dt>";
}
    
if (address.length() < 5){
    mess +="<dt>Adress must be at least 5 characters long.</dt>";
}
    
if (zipcode.length() != 5){
    mess +="<dt>Please insert a valid Zip Code.</dt>";
}

mess += "</dl>";

    if ( (phone.length() != 10) || (address.length() < 5) || (zipcode.length() != 5) ){
        request.setAttribute("message",mess);
    %>
    <jsp:forward page="checkout.jsp"/>
    <%
    }
    else{
        Shipping shipping = new Shipping(firstname, lastname, phone, address, zipcode, email,0);
        ShippingDAO shippingdao1 = new ShippingDAO();
        shippingdao1.register(shipping);
        session.setAttribute("shippingobj", shipping);
    
    %>
    <jsp:forward page="checkout.jsp"/>
    <%
    }
    %>