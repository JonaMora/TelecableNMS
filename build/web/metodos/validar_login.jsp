
<%@page import="conexion.Operaciones"%>
<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            Operaciones op = new Operaciones();
            HttpSession sesion = request.getSession();
            String urlDestino = "../bienvenido.jsp";
            String usu = request.getParameter("usuario").toString();
            String pas = request.getParameter("pass").toString();
            String[] datos = op.loguear(usu, pas);
            if (op.loguear(usu, pas) != null) {
                if (datos[4] != null) {
                    String nombre = datos[1].toString();
                    String tipo = datos[4].toString();

                    sesion.setAttribute("nombre", nombre);
                    sesion.setAttribute("tipo", tipo);
                    response.sendRedirect(urlDestino);
                }
            } else {
                response.sendRedirect("../index.html");
            }
        %>
    </body>
</html>