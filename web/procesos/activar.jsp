<%-- 
    Document   : activar
    Created on : 20/03/2018, 11:07:30 AM
    Author     : Jonathan Mora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/formu.css">
        <link rel="stylesheet" href="css/activacion.css">
        <script type="text/javascript">
        $(document).ready(function() {
            $('#sel_servis').click(function(){
                var se = document.getElementById("sel_servis").value;
                switch(se){
                    case "dhcp":
                        $.ajax({
                            type: "POST",
                            url: "formularios/dhcp.jsp",
                            success: function(a) {
                                $('#formulario_acti').html(a);
                            }
                        });
                        break;
                    case "pppoe":
                        $.ajax({
                            type: "POST",
                            url: "formularios/pppoe.jsp",
                            success: function(a) {
                                $('#formulario_acti').html(a);
                            }
                        });
                        break;
                }
            });
        });
        </script>
    </head>
    <body>
        <div id="selects">
            <div class="select_busqueda">
                <img  class="logo_busqueda" src="img/logos/placeholder-8.png"/>
                <select class="select__ops">
                    <option value="#op1">Belo</option>
                    <option value="#op2">Madero</option>
                    <option value="#op3">Pedregal</option>
                    <option value="#op3">Periodismo</option>
                    <option value="#op3">Prados</option>
                    <option value="#op3">Virrey</option>
                </select>
            </div>
            <div class="select_olt">
                <img  class="logo_busqueda" src="img/logos/server-8.png"/>
                <select class="select__ops">
                    <option value="#op1">OLT 1</option>
                    <option value="#op2">OLT 2</option>
                    <option value="#op3">OLT 3</option>
                </select>
            </div>
            <div class="select_servicio">
                <img  class="logo_busqueda" src="img/logos/placeholder-9.png"/>
                <select id="sel_servis" class="select__ops"  name="sel_servis">
                    <option value="" disabled selected>Selecciona el servicio</option>
                    <option value="dhcp">DHCP</option>
                    <option value="pppoe">PPPoE</option>
                    <option value="cmts">CMTS-CNR</option>
                </select>
            </div>
        </div>
        <div id="formulario_acti">

        </div>
    </body>
</html>
