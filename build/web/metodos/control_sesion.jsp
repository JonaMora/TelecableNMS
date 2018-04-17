<%-- 
    Document   : control_sesion
    Created on : 8/03/2018, 01:08:09 PM
    Author     : Jonathan Mora
--%>

<%@page 
    contentType = "text/html"
    pageEncoding = "ISO-8859-1"
    session = "true"
    import = "java.sql.*"
    import = "java.util.*"
    import = "conexion.*"
    import = "elementos.*"
    import = "metodos.*"
%>
<%
    Statement declaracion2 = null;
    ResultSet resultados2 = null;
    boolean comunicacion2 = false;
    
    ConexionCyes con2 = new ConexionCyes();
    Tiempo tiempo = new Tiempo();
    Url url = new Url();
    Metodo m2 = new Metodo();
    Sesion s2 = null;
    
    String login = "", pass = "", tipo_usuario = "", numero_acceso = "", aviso = "";
%>