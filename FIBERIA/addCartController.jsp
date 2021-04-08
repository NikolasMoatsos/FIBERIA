<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>

<%
User user =(User)session.getAttribute("userobj");
String id = request.getParameter("id");
String cat = request.getParameter("cat");
String gend = request.getParameter("gend");
String wish = request.getParameter("wish");
int new_id =  Integer.parseInt(id);
CartDAO dao = new CartDAO();
try{
    dao.addToCart(user.getUsername(), new_id);
    request.setAttribute("cart","The product <b>has been added</b> to your Cart");
}catch(Exception e){
    request.setAttribute("cartProblem","The product has been <b>already added</b> to your Cart");
}
if(wish!=null){
%>
    <jsp:forward page="ProfileWhishlist.jsp"/>
<%
}
if(gend==null){
%>
    <jsp:forward page="collection.jsp"/>
<%
}else if(cat==null){
%>
    <jsp:forward page="collection.jsp">
        <jsp:param name="gend" value="<%=gend%>" ></jsp:param>
    </jsp:forward>
<%
}else{
%>
    <jsp:forward page="collection.jsp">
            <jsp:param name="cat" value="<%=cat%>" ></jsp:param>
            <jsp:param name="gend" value="<%=gend%>" ></jsp:param>
    </jsp:forward>
<% }
%>
 