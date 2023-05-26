<%-- 
    Document   : RegistrarVoto
    Created on : 26 may 2023, 08:02:06
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("Usuarios") != null) {
        request.getSession();
        int idUsuario = (int) request.getAttribute("IdUsuario");
        System.out.println(idUsuario);

    }

%>
