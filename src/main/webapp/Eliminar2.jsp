<%-- 
    Document   : Eliminar2
    Created on : 29 may 2023, 08:38:59
    Author     : chang
--%>

<%@page import="Controlador.Correo"%>
<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>Eliminar</title>
        <link rel="shortcut icon" href="LogoEzVote_sinfondo.png" type="image/x-icon">
    </head>
    <body>
        <%
            Conexion conection = new Conexion();
            int usu = Integer.parseInt(request.getParameter("usuario"));
            
            Connection cn3 = conection.conectar();
            PreparedStatement ps3 = cn3.prepareStatement("Select email from Usuarios where idUsuario = (?)");
            ps3.setInt(1, usu);
            ResultSet rs3 = ps3.executeQuery();
            if (rs3.next()) {
                String host = "smtp.gmail.com";
                String port = "465";
                String username = "speedexperienceexp@gmail.com";
                String password = "kwkgaogbmuzeoutp";
                boolean sslEnabled = true;
                Correo correo = new Correo(host, port, username, password, sslEnabled);
                String to = rs3.getString(1);
                String subject = "Validacion de candidatura";
                String message = "Su candidatura ha sido rechazada";

                try {
                    correo.sendEmail(to, subject, message);
                    System.out.println("Correo electrónico enviado con éxito.");
                } catch (Exception ex) {
                    System.out.println("Error al enviar el correo electrónico: " + ex.getMessage());
                }
                out.print("<script>");
                out.print("swal('Candidato no validado!',{");
                out.print("icon: 'warning',");
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
                out.print("window.location.href = 'NuevosCandidatos.jsp';");
                out.print("break;");
                out.print("default:");
                out.print("window.location.href = 'NuevosCandidatos.jsp';");
                out.print("}");
                out.print("});");
                out.print("</script>");
                Connection cn2 = conection.conectar();
            PreparedStatement ps2 = cn2.prepareStatement("Delete from Usuarios where idUsuario = (?)");
            ps2.setInt(1, usu);
            ps2.executeUpdate();
            }
        %>
    </body>
</html>
