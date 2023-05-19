<%-- 
    Document   : Candidatura
    Created on : 9 may 2023, 07:32:59
    Author     : alumno
--%>

<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.*"%>
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
        <link rel="stylesheet" href="css/Boton.css">
        <link rel="stylesheet" href="css/Inputs.css">
        <link rel="stylesheet" href="css/all.css">


        <!-- --------- Owl-Carousel ------------------->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <!-- ------------ AOS Library ------------------------- -->
        <link rel="stylesheet" href="css/aos.css">

        <!-- Custom Style   -->
        <link rel="stylesheet" href="css/Style.css">
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
                            <a href="#">Contact Us</a>
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

            int idUsu = Integer.parseInt(request.getParameter("usuario"));
            System.out.println(idUsu);
            Conexion con = new Conexion();

            Connection cn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            Connection cn2 = null;
            PreparedStatement ps2 = null;
            ResultSet rs2 = null;
            String sql = "select * from candidatura where idUsuario = (?);";
            String sql2 = "select * from objetivos where idUsuario = (?);";

            cn = con.conectar();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idUsu);
            rs = ps.executeQuery();
            cn2 = con.conectar();
            ps2 = cn2.prepareStatement(sql2);
            ps2.setInt(1, idUsu);
            rs2 = ps2.executeQuery();

            if (rs.next() && rs2.next()) {
                String descrip = rs.getString(3);
                String obj1 = rs2.getString(2);
                String obj2 = rs2.getString(3);
                String obj3 = rs2.getString(4);
        %>
    <center>
        <form method="post" action="GuardarCandidatura.jsp" enctype="multipart/form-data">
            <div class="custom-file">
                <input type="file" class="custom-file-input" name="foto" placeholder="Foto" required="true" accept="image/*" title="Ingrese una foto">
                <label class="custom-file-label" for="customFileLang">Ingrese una foto suya</label>
            </div>
            <br>
            <div>
                <input type="text" name="descripcion" placeholder="Descripcion" required="true" value="<%=descrip%>" title="Ingrese la descripcion">
                <label class="custom-file-label" for="customFileLang">Ingrese una descripcion</label>
            </div>
                <br>
                <br>
                <center>
                    <div style="position: relative;">
                    <div style="display: flex; align-content: center; justify-content: center; align-items: center;">
                    <div class="input-container" style="position: absolute;">
                <input type="text" name="descripcion" class="input" placeholder="Descripcion" value="<%=descrip%>">
                <div class="highlight"></div>
            </div>
                </div>
                </div>
                </center>
            <br>
            <br>
            <div>
                <input type="text" name="objetivo 1" placeholder="Objetivos" required="true" value="<%=obj1%>" title="Ingrese los objetivos">
                <label class="custom-file-label" for="customFileLang">Ingrese sus objetivo 1</label>
            </div>
            <div>
                <input type="text" name="objetivo 2" placeholder="Objetivos" required="true" value="<%=obj2%>" title="Ingrese los objetivos">
                <label class="custom-file-label" for="customFileLang">Ingrese sus objetivo 2</label>
            </div>
            <div>
                <input type="text" name="objetivo 3" placeholder="Objetivos" required="true" value="<%=obj3%>" title="Ingrese los objetivos">
                <label class="custom-file-label" for="customFileLang">Ingrese sus objetivo 3</label>
            </div>
            <br>
            <div>
                <input type="file" name="video" placeholder="video" required="true" accept="video/*" title="Ingrese un video">
                <label class="custom-file-label" for="customFileLang">Ingrese un video que represente su campaña</label>
            </div>
            <br>
            <div>
                <input type="hidden" name="usuario" value="${Usuarios.id}">
                <input type="hidden" name="opcon" value="Actualizar">
                <button class="btn" type="submit" name="btn2" value="Actualizar">Actualizar</button>
            </div>
        </form>
        <br>
        <a href="VerificarCandidato.jsp"><button class="btn2" type="button">Volver</button> </a>
    </center>

    <%        } else {

    %>

    <form method="post" action="GuardarCandidatura.jsp" enctype="multipart/form-data">
        <input type="file" name="foto" placeholder="Foto" required="true" accept="image/* title="Ingrese una foto">
        <input type="text" name="descripcion" placeholder="Descripcion" required="true">
        <input type="text" name="objetivo 1" placeholder="Objetivos" required="true">
        <input type="text" name="objetivo 2" placeholder="Objetivos" required="true">
        <input type="text" name="objetivo 3" placeholder="Objetivos" required="true">
        <input type="file" name="video" placeholder="video" required="true" accept="video/*">
        <input type="hidden" name="usuario" value="${Usuarios.id}">
        <input type="hidden" name="opcon" value="Guardar">
        <button class="btn" type="submit" name="btn2" value="Guardar">Guardar</button>
    </form>

    <%            }


    %>
</body>
</html>
