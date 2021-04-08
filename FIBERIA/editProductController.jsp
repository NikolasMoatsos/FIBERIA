<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>

<%@ page import="java.text.SimpleDateFormat"%>  
<%@ page import="java.util.Date"%>  

<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>

<%

Product prod=(Product)session.getAttribute("productobj");

if (prod == null){
    response.sendRedirect("Profile.jsp");
    return;
}

int id = prod.getId(); 

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

if (productName == null || brand == null || gender == null || category == null || size == null || color == null || price == null || description == null || purchaseDate == null) {
    
    response.sendRedirect("editProduct.jsp");
    return;
 
 }
 if (!(productName.equals(prod.getProductName()) 
    && brand.equals(prod.getBrand()) && gender.equals(prod.getGender()) && category.equals(prod.getCategory())
     && size.equals(prod.getSize()) && color.equals(prod.getColor()) && packaged.equals(prod.getPackaged()) 
        && description.equals(prod.getDescription()) && purchaseDate.equals(prod.getPurchaseDate()) 
            && price.equals(String.valueOf(prod.getPrice())) )) {

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
            mess +="<dt>The price you inserted in not valid. Please insert a new one.</dt>";
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
        
    
    if (priced || productName.equals("") || brand.equals("") || description.equals("") || packaged.equals("") || dateValidation){
        request.setAttribute("message",mess);
    %>
    <jsp:forward page="editProduct.jsp">
        <jsp:param name="id" value="<%=id%>" ></jsp:param>
    </jsp:forward>
    <%
    }
    else{
        ProductDAO productdao = new ProductDAO();
        productdao.updateFields(id, productName, brand, gender, category, size, color, new_price, packaged, description, purchaseDate);
        request.setAttribute("success","Your changes <b>have been applied</b>");
    }
}
session.removeAttribute("productobj");
%>
<jsp:forward page="Profile.jsp"/>
