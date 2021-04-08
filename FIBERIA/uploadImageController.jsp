<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="fiberia_classes.*"%>
<%@ page errorPage="errorPage.jsp"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%
Product prod = (Product)session.getAttribute("productobj");

if (prod == null){
    response.sendRedirect("Profile.jsp");
    return;
}

int id = prod.getId(); 
String message = "";
String fileName = "";
try {
    File file ;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    String filePath = "C:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/ismgroup69/file_uploads/";
    String contentType = request.getContentType();
    if ((contentType.indexOf("multipart/form-data") >= 0)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(maxMemSize);
        factory.setRepository(new File("c:\\temp"));
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax( maxFileSize );
        List fileItems = upload.parseRequest(request);
        Iterator i = fileItems.iterator();
        while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
                String fieldName = fi.getFieldName();
                fileName = fi.getName();
                if (fileName.equals("") || fileName == null){
                    throw new Exception();  
                }
                String type;
                boolean isInMemory = fi.isInMemory();
                long sizeInBytes = fi.getSize();
                fileName = id + fileName;
                
                File oldfile = new File("C:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/ismgroup69/file_uploads/" + prod.getImageName());  
                if (!oldfile.isDirectory()) { 
                    oldfile.delete(); 
                }

                file = new File( filePath + fileName) ;
                fi.write( file ) ;
            }
        }

    } else {
        message = "Insert an image.";
        request.setAttribute("message",message);
    }

}catch(Exception ex) {
    message = "Insert an image.";
    request.setAttribute("message",message);
}

if (message.equals("")) {
    request.setAttribute("successmessage","The product's picture <b>has been changed</b>");
    ProductDAO dao1 = new ProductDAO();
    prod.setImageName(fileName);
    dao1.uploadNewImage(prod);
}
%>
<jsp:forward page="editProduct.jsp">
    <jsp:param name="id" value="<%=id%>" ></jsp:param>
</jsp:forward>
