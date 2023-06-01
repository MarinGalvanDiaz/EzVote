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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>Voto Registrado</title>
        <link rel="shortcut icon" href="LogoEzVote_sinfondo.png" type="image/x-icon">
    </head>
    <body>
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
            out.print("<script>");
            out.print("swal('Voto registrado!','Tu voto es anonimo, se ha guardado y se deshabilitara tu cuenta, Gracias!',{");
            out.print("icon: 'success',");
            out.print("buttons: {");
            out.print(" catch: {");
            out.print("text: 'Continuar',");
            out.print("value: 'catch',");
            out.print("}");
            out.print(" },");
            out.print("})");
            out.print(".then((value) => {");
            out.print("switch (value) {");
            out.print("case 'catch':");
            out.print("window.location.href = 'SrvUsuarios?accion=cerrar';");
            out.print("break;");
            out.print("default:");
            out.print("window.location.href = 'SrvUsuarios?accion=cerrar';");
            out.print("}");
            out.print("});");
            out.print("</script>");

            
        } catch (Exception e) {
            out.println(e.getMessage());
        }

    }

%>
    </body>
</html>