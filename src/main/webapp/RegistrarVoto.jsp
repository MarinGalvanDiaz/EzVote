<%-- 
    Document   : RegistrarVoto
    Created on : 26 may 2023, 08:02:06
    Author     : chang
--%>

<%@page import="java.sql.*"%>
<%@page import="Modelo.Conexion"%>
<%@page import="Modelo.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("Usuarios") != null) {
        request.getSession();

        int idUsuario = (int) session.getAttribute("IdUsuario");
        System.out.println(idUsuario);
        int votado = Integer.parseInt(request.getParameter("usu"));
        Conexion con = new Conexion();
        Connection cn1 = null;
        PreparedStatement ps1 = null;

        Connection cn2 = null;
        PreparedStatement ps2 = null;

        try {
            cn1 = con.conectar();
            ps1 = cn1.prepareStatement("insert into votos values(default,(?),(?));");
            ps1.setInt(1, votado);
            ps1.setInt(2, idUsuario);
            ps1.executeUpdate();
            
            cn2 = con.conectar();
            ps2 = cn2.prepareStatement("update usuarios set estado = 0 where idUsuario = (?);");
            ps2.setInt(1, idUsuario);
            ps2.executeUpdate();
            
            
            response.sendRedirect("SrvUsuarios?accion=cerrar");
        } catch (Exception e) {
            out.println(e.getMessage());
        }

    }

%>
