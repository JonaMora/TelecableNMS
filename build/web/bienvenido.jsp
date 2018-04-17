<%-- 
    Document   : bienvenido_admin
    Created on : 1/03/2018, 12:32:42 PM
    Author     : Jonathan Mora
--%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.io.*,java.util.*"
        import="javax.servlet.http.HttpSession"
        import="java.text.SimpleDateFormat"
%>
        
<!DOCTYPE html>
<html>
    <head>
        <title>NMS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilos.css">
        <script src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function() {
            $('#div-btn1').click(function(){
                $.ajax({
                    type: "POST",
                    url: "procesos/activar.jsp",
                    success: function(a) {
                            $('#contenido_form').html(a);
                        }
                    });
                });
            });
        </script>
    </head>
    <body>
        <header>
            <div class="ancho">
                <div class="logo">
                    <p> <a href="#"><img  class="dimenLogo" src="img/logos/telecable.png"/></a></p>	
                </div>
                <div class="titulo">
                    <p> <a href="#">Network Management System</a></p>
                </div>
                <div class="menu">
                    <%
                        HttpSession sesion = request.getSession();
                        String name = (String) sesion.getAttribute("nombre");
                        String tipo = (String) sesion.getAttribute("tipo");
                        switch (tipo) {
                            case "1":
                    %>
                    <jsp:include page="menu/menu_tipo_1.jsp" flush="true"/>
                    <%
                            break;
                        case "2":
                    %>
                    <jsp:include page="menu/menu_tipo_2.jsp" flush="true"/>
                    <%
                            break;
                        case "3":
                    %>
                    <jsp:include page="menu/menu_tipo_3.jsp" flush="true"/>
                    <%
                            break;
                        case "4":
                    %>
                    <jsp:include page="menu/menu_tipo_4.jsp" flush="true"/>
                    <%
                                break;
                            default:
                                out.print("Chales lo siento no eres usuario");
                                break;

                        }

                    %>
                </div>
            </div>
        </header>	
        <section id="main_content">
            <div id="contenido_form"></div>
        </section>
        <footer>
            <div class="foot">
                <div class="footer1"> 
                    <img src="img/logos/user-25.png">
                    <p><%out.print("Bienvenido " + name);%></p>
                    <div id="reloj"></div>
                </div>
                <div class="footer2">
                    <a href="javascript:void(0)" onclick="window.open('https://www.google.com/maps/d/edit?mid=1pSGMZ0c1RCpaJXt1FFVcP6s9JJQ&ll=19.70147946350854%2C-101.1921461&z=13', '', 'width=700,height=400,noresize')"><img src="img/logos/map.png"></a>
                    <a href=""><img src="img/logos/notepad-4.png"></a>
                </div>
            </div>             
        </footer>
        <script type="text/javascript" src="js/reloj.js"></script>
    </body>
</html>
