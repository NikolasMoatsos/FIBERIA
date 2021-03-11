<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>  
<%@ page import="java.util.Date"%>  
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>

<%
List<Product> products = new ArrayList<Product>();
List<Integer> ids= new ArrayList<Integer>();
CartDAO dao = new CartDAO();
User user =(User)session.getAttribute("userobj");
String uname = user.getUsername();
String fname = user.getName();

String strdate = "";

String username=user.getUsername();

OrderDAO orderdao=new OrderDAO();

try{
    products = dao.getProductsFromCart(user.getUsername());
}catch(Exception e){
    request.setAttribute("message",e.getMessage());
    }

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
    <jsp:forward page="shipping.jsp"/>
    <%
    }
    else{
     
        LocalDate pdate = java.time.LocalDate.now();
        strdate = pdate.toString();
       
        orderdao.addOrder(username,strdate);

        try{
            ids= orderdao.findOrderIdsofuser(username);
            
        }catch(Exception e){
            request.setAttribute("message",e.getMessage());
        }

        int theid = ids.get(ids.size() - 1);
        
        for(Product prod: products){
            prod.setOrderId(theid);
        }

        ShippingDAO shippingdao1 = new ShippingDAO();
        shippingdao1.register(firstname, lastname, phone, address, zipcode, email, uname);
        %>
    <jsp:forward page="payment.jsp"/>
    <%
    }
    %>