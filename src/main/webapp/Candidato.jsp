<%-- 
    Document   : Candidato
    Created on : 9 may 2023, 07:32:50
    Author     : alumno
--%>

<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Modelo.Conexion"%>
<%@page import="Modelo.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/Estilo.css">
        <link rel="stylesheet" href="css/Boton.css">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="css/all.css">
       

        <!-- --------- Owl-Carousel ------------------->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <!-- ------------ AOS Library ------------------------- -->
        <link rel="stylesheet" href="css/aos.css">

        <!-- Custom Style   -->
        <link rel="stylesheet" href="css/Style.css">
        
    </head>
    <body background="Images/heated.gif" style="height: 100%; width: 100%; background-size: cover;">
        <nav class="nav">
            <div class="nav-menu flex-row">
                <div class="nav-brand">
                    <a href="#" class="text-gray">EzVote</a>
                </div>
                <div class="toggle-collapse">
                    <div class="toggle-icons">
                        <i class="fas fa-bars"></i>
                    </div>
                </div>
                <div>
                    <ul class="nav-items">
                        <li class="nav-link">
                            <a href="#">Home</a>
                        </li>
                        <li class="nav-link">
                            <a href="#">Category</a>
                        </li>
                        <li class="nav-link">
                            <a href="#">Archive</a>
                        </li>
                        <li class="nav-link">
                            <a href="#">Pages</a>
                        </li>
                        <li class="nav-link">
                            <a href="SrvUsuarios?accion=cerrar">Cerrar Sesión</a>
                        </li>
                    </ul>
                </div>
                <div class="social text-gray">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
        </nav>
        <%
            Conexion con = new Conexion();
            int idUsu = Integer.parseInt(request.getParameter("Usuario"));
            Connection cn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            Connection cn2 = null;
            PreparedStatement ps2 = null;
            ResultSet rs2 = null;
            String sql = "select * from candidatura where idUsuario = (?);";
            String sql2 = "select * from objetivos where idUsuario = (?);";
            // out.println(idUsu);
            cn = con.conectar();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idUsu);
            rs = ps.executeQuery();
            cn2 = con.conectar();
            ps2 = cn2.prepareStatement(sql2);
            ps2.setInt(1, idUsu);
            rs2 = ps2.executeQuery();
            String foto = null;
            String foto2 = null;
            if (rs.next() && rs2.next()) {
                byte[] imagenBytes = rs.getBytes(2);
                byte[] videoBytes = rs.getBytes(5);
                String descripcion = rs.getString(3);
                String objetivo1 = rs2.getString(2);
                String objetivo2 = rs2.getString(3);
                String objetivo3 = rs2.getString(4);
                // Incrustar los datos de la imagen en la página HTML utilizando la etiqueta <img>
                foto = "src=\"data:image/jpeg;base64," + DatatypeConverter.printBase64Binary(imagenBytes) + "\"";
                foto2 = "src=\"data:video/mp4;base64," + javax.xml.bind.DatatypeConverter.printBase64Binary(videoBytes) + "\"";


        %>
        
        <div class="grid-container">
            <div class="grid-item-1">
                
                    <img <%=foto%> id="imgPreview" alt="img" style="height: 500px; width: 350px">
            </div>
            <div class="grid-item-2">
            
                <h2>Descripción</h2><p style="color: black;"><%=descripcion%></p>
               
          
                <h2>Propuesta 1</h2><p style="color: black;"><%=objetivo1%></p>
              
                <h2>Propuesta 2</h2><p style="color: black;"><%=objetivo2%></p>
               
                <h2>Propuesta 3</h2><p style="color: black;"><%=objetivo3%></p>
                    </div>
            
            <div class="grid-item-3">
                <video width="1200" height="600" controls autoplay>
                    <source <%=foto2%> type="video/mp4">
                </video>
            </div>
                <div class="grid-item-4">
            <form method="post" action="Candidatura.jsp">
                <input type="hidden" name="usuario" value="${Usuarios.id}">
                <button class="btn" type="submit" name="btnactu" value="actu">Modificar</button>
            </form>
                </div>
        </div>
                
        <%
        } else {

        %>

        <form method="post" action="Candidatura.jsp">
            <input type="hidden" name="usuario" value="${Usuarios.id}">
            <center>
                <button class="btn" type="submit" name="btn" value="Guardar" style="position: relative; align-content: center; align-self: center; ">Crear Candidatura</button>
            </center>
        </form>

        <%            }

        %>
    </body>
</html>
