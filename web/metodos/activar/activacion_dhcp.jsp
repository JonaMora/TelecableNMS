<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="me.legrange.mikrotik.*"%>
<%-- 
    Document   : a
    Created on : 16/04/2018, 10:32:37 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../js/mod_activacion.js"></script>
    </head>
    <body>
        <%

            try {
                try (ApiConnection con = ApiConnection.connect("192.168.13.81") // connect to router
                        ) {
                    String ipadd = request.getParameter("ipaddres").toString();
                    String mac = request.getParameter("mac").toString();
                    String noserie = request.getParameter("no_serie").toString();
                    String contrato = request.getParameter("contrato").toString();
                    String paquete = request.getParameter("paquete").toString();
                    String empresa = request.getParameter("empresa").toString();

                    con.login("admin", "pruebas"); // log in to router
                    List<Map<String, String>> rs = con.execute("/ip/dhcp-server/lease/print");
                    for (Map<String, String> r : rs) {
                        if (ipadd.equals(r.get("address"))) {
                            con.execute("/ip/dhcp-server/lease/make-static .id=" + r.get(".id"));
                            con.execute("/ip/dhcp-server/lease/set .id=" + r.get(".id") + " comment=" + contrato);
                            con.execute("/queue/simple/add name=" + contrato + " target=" + ipadd + " max-limit=" + paquete + "/" + paquete + "");
                            %> <script> confirmacion_alta_ont(); </script> <%
                            //response.sendRedirect("../../bienvenido.jsp");
                        }
                    }
                }
            } catch (MikrotikApiException e) {
                System.out.println(e);
            }
        %>
    </body>
</html>

