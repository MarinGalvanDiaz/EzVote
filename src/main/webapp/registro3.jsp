<%-- 
    Document   : registro3
    Created on : 1 jun 2023, 02:05:36
    Author     : chang
--%>

<%@page import="Controlador.Correo"%>
<%@page import="Controlador.GeneradorContraseñas"%>
<%@page import="java.sql.*"%>
<%@page import="Modelo.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href = "https://fonts.googleapis.com/css2?family=Open+Sans" rel="stylesheet" type="text/css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="shortcut icon" href="LogoEzVote_sinfondo.png" type="image/x-icon">
    </head>
    <body>

        <%

            Conexion conection = new Conexion();
            GeneradorContraseñas generar = new GeneradorContraseñas();

            String nombre = request.getParameter("txtusu");
            String contra = generar.generarContraseña(10);
            String repcontra = contra;
            String email = request.getParameter("email");

            Connection cn = null;
            Connection cn2 = null;
            PreparedStatement st = null;
            PreparedStatement st2 = null;
            ResultSet rs = null;

            String sql1 = "Select * from Usuarios where identificador = (?)";
            String sql2 = "Insert into Usuarios values(default,(?),(?),(?),7,1)";

            cn = conection.conectar();
            st = cn.prepareStatement(sql1);
            st.setString(1, nombre);
            rs = st.executeQuery();
            if (rs.next()) {
                out.print("<script>");
                out.print("swal('Cuidado!','El nombre de usuario ya esta en uso',{");
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
                out.print("window.location.href = 'RegistroVotantes.jsp';");
                out.print("break;");
                out.print("default:");
                out.print("window.location.href = 'RegistroVotantes.jsp';");
                out.print("}");
                out.print("});");
                out.print("</script>");
            } else {
                if (contra.equals(repcontra)) {
                    cn2 = conection.conectar();
                    st2 = cn2.prepareCall(sql2);
                    st2.setString(1, nombre);
                    st2.setString(2, contra);
                    st2.setString(3, email);
                    st2.executeUpdate();
                    String host = "smtp.gmail.com";
                    String port = "465";
                    String username = "speedexperienceexp@gmail.com";
                    String password = "kwkgaogbmuzeoutp";
                    boolean sslEnabled = true;

                    Correo sender = new Correo(host, port, username, password, sslEnabled);

                    String to = email;
                    String subject = "Bienvenido" + "\n" + "Se te ha dado de alta en EzVote";
                    String message = "Tu usuario es: " + nombre + "\n" + "Tu contraseña es: " + contra;

                    
                    try {
                        sender.sendEmail(to, subject, message);
                        System.out.println("Correo electrónico enviado con éxito.");
                    } catch (Exception ex) {
                        System.out.println("Error al enviar el correo electrónico: " + ex.getMessage());
                    }
                    out.print("<script>");
                    out.print("swal('Bienvenido!','La cuenta se ha dado de alta',{");
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
                    out.print("window.location.href = 'Votantes.jsp';");
                    out.print("break;");
                    out.print("default:");
                    out.print("window.location.href = 'Votantes.jsp';");
                    out.print("}");
                    out.print("});");
                    out.print("</script>");
                } else {
                    out.print("<script>");
                    out.print("swal('Cuidado!','La contraseña no coincide',{");
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
                    out.print("window.location.href = 'Registro.jsp';");
                    out.print("break;");
                    out.print("default:");
                    out.print("window.location.href = 'Registro.jsp';");
                    out.print("}");
                    out.print("});");
                    out.print("</script>");
                }

            }


        %>

