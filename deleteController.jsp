<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>

<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
String id = request.getParameter("id");
String FileName = request.getParameter("img");

File file = new File("C:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/ismgroup69/file_uploads/" + FileName);  

if (!file.isDirectory()) { 
  file.delete(); 
}

int new_id =  Integer.parseInt(id);
ProductDAO dao = new ProductDAO();
dao.deleteProduct(new_id);
request.setAttribute("successdel","Your product <b>has been deleted</b>");
%>
<jsp:forward page="Profile.jsp"/>
