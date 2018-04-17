<%-- 
    Document   : dhcp
    Created on : 21/03/2018, 09:36:11 PM
    Author     : Jonathan Mora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="me.legrange.mikrotik.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/formu.css">
        <script src="js/mod_activacion.js"></script>
        <script src="js/formulario.js"></script>
    </head>
    <body>
        <form name="myForm" class="formulario" action="metodos/activar/activacion_dhcp.jsp"
              onsubmit="return validateForm()" method="post">
            <h1 class="formulario__titulo">DHCP</h1>
            <input type="text" class="formulario__input" name="ipaddres">
            <label for="" class="formulario__label">
                IP Addres 
            </label>
            <input type="text" class="formulario__input" name="mac">
            <label for="" class="formulario__label">
                Mac 
            </label>
            <input type="text" class="formulario__input" name="no_serie">
            <label for="" class="formulario__label">
                No. Serie
            </label>
            <input type="text" class="formulario__input" name="contrato">
            <label for="" class="formulario__label">
                Contrato
            </label>
            <select class="formulario__input" name="paquete">
                <option value="" disabled selected>Paquete</option>
                <option value="5M">5M</option>
                <option value="10M">10M</option>
            </select>
            <select class="formulario__input" name="empresa">
                <option value="" disabled selected>Empresa</option>
                <option value="Telecable">Telecable</option>
                <option value="Mediacom">Mediacom</option>
            </select>
            <input type="submit" class="formulario__submit">
        </form>

    </body>
</html>
