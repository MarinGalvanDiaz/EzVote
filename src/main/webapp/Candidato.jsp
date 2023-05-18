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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>JSP Page</title>
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="./css/all.css">
       

        <!-- --------- Owl-Carousel ------------------->
        <link rel="stylesheet" href="./css/owl.carousel.min.css">
        <link rel="stylesheet" href="./css/owl.theme.default.min.css">

        <!-- ------------ AOS Library ------------------------- -->
        <link rel="stylesheet" href="./css/aos.css">

        <!-- Custom Style   -->
        <link rel="stylesheet" href="./css/Style.css">
    </head>
    <body>
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
            String sql = "select * from candidatura where idUsuario = (?);";
            // out.println(idUsu);
            cn = con.conectar();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idUsu);
            rs = ps.executeQuery();
            String foto = null;
            String foto2 = null;
            if (rs.next()) {
                byte[] imagenBytes = rs.getBytes(2);
                byte[] videoBytes = rs.getBytes(5);
                String descripcion = rs.getString(3);
                String objetivos = rs.getString(4);
                // Incrustar los datos de la imagen en la página HTML utilizando la etiqueta <img>
                foto = "src=\"data:image/jpeg;base64," + DatatypeConverter.printBase64Binary(imagenBytes) + "\"";
                foto2 = "src=\"data:video/mp4;base64," + javax.xml.bind.DatatypeConverter.printBase64Binary(videoBytes) + "\"";


        %>
        <p>hola pa </p>
        <div class="container">
            <div class="row">  
                <div class="column">
                    <img <%=foto%> id="imgPreview" alt="img" style="height: 220px; width: 220px">
                </div>
                <div class="column">
                    Descripción<input type="text" disabled="true" value="<%=descripcion%>">
                </div>
            </div>
            <div class="row">   
                <div class="column">
                    Objetivos<input type="text" disabled="true" value="<%=objetivos%>">
                </div>
                <div class="column">
                    
                <video width="800" height="600" controls autoplay>
                    <source <%=foto2%> type="video/mp4">
                </video>
                </div>
            </div>
            <form method="post" action="Candidatura.jsp">
                <input type="hidden" name="usuario" value="${Usuarios.id}">
                <button type="submit" name="btnactu" value="actu">Modificar</button>
            </form>

        </div>

        <%
        } else {

        %>

        <form method="post" action="Candidatura.jsp">
            <input type="hidden" name="usuario" value="${Usuarios.id}">
            <button type="submit" name="btn" value="Guardar">Candidatura</button>
        </form>

        <%            }

        %>
    </body>
</html>
