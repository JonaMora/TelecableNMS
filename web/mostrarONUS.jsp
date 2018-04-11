<%-- 
    Document   : mostrarONUS
    Created on : 26/03/2018, 02:23:54 PM
    Author     : Jonathan Mora
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.util.List"
        import="java.util.Map"
        import="me.legrange.mikrotik.*"
        %>
<!DOCTYPE html>
<html>
    <head>
        <title>NMS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilos.css">
        <script src="js/jquery-3.3.1.min.js"></script>

        <link rel="stylesheet" href="css/jquery.fancybox.css?v=2.1.7" type="text/css" media="screen" />
        <script type="text/javascript" src="js/jquery.fancybox.pack.js?v=2.1.7"></script>
        <script type="text/javascript">
        $(document).ready(function() {
            $('#div-btn1').click(function () {
                    $.ajax({
                        type: "POST",
                        url: "procesos/activar.jsp",
                        success: function (a) {
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
            <h1>Hola esta es una prueba</h1>
            <table  class="tabla_onus" style="text-align: center; margin-left: 6%;">
                <thead>
                    <tr>
                        <th width="10" style="font-weight: bold;">ID</th>
                        <th width="230" style="font-weight: bold;">MAC</th>
                        <th width="50" style="font-weight: bold;">IP Address</th>
                        <th width="230" style="font-weight: bold;">HostName</th>
                        <th width="50" style="font-weight: bold;">Status</th>
                        <th width="130" style="font-weight: bold;">DYNAMIC</th>
                        <th width="130" style="font-weight: bold;">RATE</th>
                    </tr>
                </thead>
                <h1>Hola este cambio lo realizo montse</h1>
                <tbody>
                    <%                        try {
                            try (ApiConnection con = ApiConnection.connect("192.168.13.215") // connect to router
                                    ) {
                                con.login("admin", ""); // log in to router
                                String mac = "";
                                List<Map<String, String>> rs = con.execute("/ip/dhcp-server/lease/print");
                                for (Map<String, String> r : rs) {
                                    out.print("<tr>");
                                    out.print("<td>" + r.get(".id") + "</td>" + 
                                              "<td>" + r.get("mac-address") + "</td>" +
                                              "<td>" + r.get("address") + "</td>" +
                                              "<td>" + r.get("host-name") + "</td>" +
                                              "<td>" + r.get("status") + "</td>" +
                                              "<td>" + r.get("dynamic") + "</td>" +
                                              "<td>" + r.get("rate-limit") + "</td>" 
                                    );
                                    out.print("</tr>");
                                    mac = r.get("mac-address");
                                }
                                /*con.execute("/ip/dhcp-server/lease/make-static .id=*8");
                                con.execute("/ip/dhcp-server/lease/set .id=*8 comment=Montse");*/
                                con.execute("/queue/simple/add name=Contrato200 target=192.168.66.105 max-limit=5M/5M");
                            }
                        } catch (MikrotikApiException e) {
                            System.out.println(e);}
                    %>
                </tbody>
            </table>
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