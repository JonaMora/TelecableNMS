<%-- 
    Document   : menu_tipo_4
    Created on : 7/03/2018, 11:20:22 AM
    Author     : Jonathan Mora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          String nameusuario = session.getAttribute("nameuse").toString(); 
          out.print("Hello " + nameusuario + "!");
        %>
    </body>
</html>
