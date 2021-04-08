<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>

<%@ page import="java.text.SimpleDateFormat"%>  
<%@ page import="java.util.Date"%>  

<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>

<%


String username = request.getParameter("username");

String productName = request.getParameter("productName");

String brand = request.getParameter("brand");

String gender = request.getParameter("gender");

String category = request.getParameter("category");

String size = request.getParameter("size");

String color = request.getParameter("color");

String price = request.getParameter("price");

String packaged = request.getParameter("packaged");

String description = request.getParameter("description");

String purchaseDate = request.getParameter("purchaseDate");

if (username == null || productName == null || brand == null || gender == null || category == null || size == null || color == null || price == null || description == null || purchaseDate == null) {
    
    response.sendRedirect("product_registration.jsp");
    return;
 
 }
String mess = "<dl>";

boolean priced = false;
boolean dateValidation = false;

double new_price = 0;
int counter = 0;
try{
    
    new_price = Double.parseDouble(price);
    if (new_price < 0) {
        throw  new Exception();
    }
} catch (Exception e){
    priced = true; 
    mess +="<dt>The price you inserted in not valid.</dt>";
}

if (productName.equals("")){
    mess +="<dt>Please insert a tittle for your product.</dt>";
}

if (brand.equals("")){
    mess +="<dt>Please isert a brand for your product.</dt>";
}

if (description.equals("")){
    mess +="<dt>Please insert a description for your product.</dt>";
}

if (packaged == null){
    mess +="<dt>Packaged field is required.</dt>";
}

if (gender.equals("---Select Gender---")){
    mess +="<dt>Please insert a gender for your product</dt>";
}

if (category.equals("---Select Category---")){
    mess +="<dt>Please insert a category for your product.</dt>";
}

if (size.equals("---Select Size---")){
    mess +="<dt>Please insert a size for your product.</dt>";
}

if (color.equals("---Select Color---")){
    mess +="<dt>Please insert a color for your product.</dt>";
}

if (purchaseDate.equals("")){
    mess +="<dt>Please enter the purchase date for your product.</dt>";
    dateValidation = true;
} else {
    try{
        Date d_purchaseDate = new SimpleDateFormat("yyyy-MM-dd").parse(purchaseDate);
        Date currentDate = new Date();
        if(d_purchaseDate.after(currentDate)){
            dateValidation = true;
            mess+= "<dt>Enter a valid purchase date.</dt>";
        }
    } catch (Exception e) {
        dateValidation = true;
        mess +="<dt>Please enter the purchase date for your product.</dt>";
    }
}
mess += "</dl>";

String strdate = "";
if (priced || productName.equals("") || brand.equals("") || description.equals("") || packaged == null || dateValidation || gender.equals("---Select Gender---") || category.equals("---Select Category---") || size.equals("---Select Size---") || color.equals("---Select Color---")){
    request.setAttribute("message",mess);
%>
<jsp:forward page="product_registration.jsp"/>
<%
}
else{
    LocalDate pdate = java.time.LocalDate.now();
    strdate = pdate.toString(); 
    Product product1 = new Product(productName, new_price, description, category,gender,size,color,brand,packaged,username,"",strdate, purchaseDate);
    session.setAttribute("prodobj", product1);
%>
    <jsp:forward page="image.jsp"/>
    <%
}
%>