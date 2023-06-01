<%-- 
    Document   : Comunicar
    Created on : 29 may 2023, 07:23:58
    Author     : chang
--%>

<%@page import="Controlador.Correo"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Modelo.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>Comunicar</title>
        <link rel="shortcut icon" href="LogoEzVote_sinfondo.png" type="image/x-icon">
    </head>
    <body>
        <%
            String host = "smtp.gmail.com";
            String port = "465";
            String username = "speedexperienceexp@gmail.com";
            String password = "kwkgaogbmuzeoutp";
            boolean sslEnabled = true;
            Correo correo = new Correo(host, port, username, password, sslEnabled);
            String to = "speedexperienceexp@gmail.com";
            String subject = request.getParameter("affair")+" de "+ request.getParameter("fullname");
            String message = request.getParameter("message");
            
            try {
                                correo.sendEmail(to, subject, message);
                                System.out.println("Correo electrónico enviado con éxito.");
                            } catch (Exception ex) {
                                System.out.println("Error al enviar el correo electrónico: " + ex.getMessage());
                            }
            out.print("<script>");
            out.print("swal('Gracias!','Correo electrónico enviado a nuestro equipo',{");
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
            out.print("window.location.href = 'PaginaPrincipal.html';");
            out.print("break;");
            out.print("default:");
            out.print("window.location.href = 'PaginaPrincipal.html';");
            out.print("}");
            out.print("});");
            out.print("</script>");

        %>
    </body>
</html>
