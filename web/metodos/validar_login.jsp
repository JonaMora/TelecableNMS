
<%@page import="conexion.Operaciones"%>
<%@page session="true" %>
<%
    Operaciones op = new Operaciones();
    HttpSession sesion = request.getSession();

    String urlDestino = "../bienvenido.jsp";

    String usu = request.getParameter("usuario").toString();
    String pas = request.getParameter("pass").toString();
    String[] datos = op.loguear(usu, pas);
    if (datos[4] != null) {
        String nombre = datos[1].toString();
        String tipo = datos[4].toString();

        sesion.setAttribute("nombre", nombre);
        sesion.setAttribute("tipo", tipo);
        response.sendRedirect(urlDestino);
    } else {
        response.sendRedirect("../index.html");
    }
    
    

%>