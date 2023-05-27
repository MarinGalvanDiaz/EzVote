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
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
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
    <body background="Images/otrofonderrimo.gif" style="height: 100%; width: 100%; background-size: cover; background-repeat:   no-repeat; background-attachment: fixed;">
        <nav class="nav">
            <div class="nav-menu flex-row">
                <div class="nav-brand">
                    <a href="#" class="text-gray">EzVote</a>
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
                <p>Ingrese una foto para identificación: </p>
                <input type="file" class="custom-file-input" name="foto" placeholder="Foto" required="true" accept="image/*" title="Ingrese una foto">
                
            </div>
            
            
                <br><br><br><br><br><br><br><br><br><br><br><br>
                
                
                <center>
                    <div style="position: relative;">
                    <div style="display: flex; align-content: initial; justify-content: center; align-items: center;">
                        
                    <div class="input-container" style="position: absolute;">
                        <p>Ingrese una descripción: </p>
                        <textarea name="descripcion" class="input" placeholder="Descripcion"><%=descrip%></textarea>
                <div class="highlight"></div>
            </div>
                </div>
                </div>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <div style="position: relative;">
                    <div style="display: flex; align-content: center; justify-content: center; align-items: center;">
                        
                    <div class="input-container" style="position: absolute;">
                        <p>Ingrese una propuesta: </p>
                        <textarea name="objetivo 1" class="input" placeholder="objetivo 1"><%=obj1%></textarea>
                <div class="highlight"></div>
            </div>
                </div>
                </div>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <div style="position: relative;">
                    <div style="display: flex; align-content: center; justify-content: center; align-items: center;">
                        
                    <div class="input-container" style="position: absolute;">
                        <p>Ingrese una propuesta: </p>
                <textarea name="objetivo 2" class="input" placeholder="objetivo 2"><%=obj2%></textarea>
                <div class="highlight"></div>
            </div>
                </div>
                </div>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <div style="position: relative;">
                    <div style="display: flex; align-content: center; justify-content: center; align-items: center;">
                        
                    <div class="input-container" style="position: absolute;">
                        <p>Ingrese una propuesta: </p>
                <textarea name="objetivo 3" class="input" placeholder="objetivo 3"><%=obj3%></textarea>
                <div class="highlight"></div>
            </div>
                </div>
                </div>
                </center>
            <br><br><br><br><br><br><br><br><br><br><br><br>
                <p>Ingrese un video relacionado a su candidatura: </p>
                <input type="file" name="video" placeholder="video" required="true" accept="video/*" title="Ingrese un video">
                
            </div>
            <br>
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
                <br><br><br>

    <%        } else {

    %>
 <center>
        <form method="post" action="GuardarCandidatura.jsp" enctype="multipart/form-data">
            <div class="custom-file">
                <p>Ingrese una foto para identificación: </p>
                <input type="file" class="custom-file-input" name="foto" placeholder="Foto" required="true" accept="image/*" title="Ingrese una foto">
                
            </div>
            
            
                <br><br><br><br><br><br><br><br><br><br><br><br>
                
                
                <center>
                    <div style="position: relative;">
                    <div style="display: flex; align-content: initial; justify-content: center; align-items: center;">
                        
                    <div class="input-container" style="position: absolute;">
                        <p>Ingrese una descripción: </p>
                        <textarea name="descripcion" class="input" placeholder="Descripcion"></textarea>
                <div class="highlight"></div>
            </div>
                </div>
                </div>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <div style="position: relative;">
                    <div style="display: flex; align-content: center; justify-content: center; align-items: center;">
                        
                    <div class="input-container" style="position: absolute;">
                        <p>Ingrese una propuesta: </p>
                        <textarea name="objetivo 1" class="input" placeholder="objetivo 1"></textarea>
                <div class="highlight"></div>
            </div>
                </div>
                </div>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <div style="position: relative;">
                    <div style="display: flex; align-content: center; justify-content: center; align-items: center;">
                        
                    <div class="input-container" style="position: absolute;">
                        <p>Ingrese una propuesta: </p>
                <textarea name="objetivo 2" class="input" placeholder="objetivo 2"></textarea>
                <div class="highlight"></div>
            </div>
                </div>
                </div>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <div style="position: relative;">
                    <div style="display: flex; align-content: center; justify-content: center; align-items: center;">
                        
                    <div class="input-container" style="position: absolute;">
                        <p>Ingrese una propuesta: </p>
                <textarea name="objetivo 3" class="input" placeholder="objetivo 3"></textarea>
                <div class="highlight"></div>
            </div>
                </div>
                </div>
                </center>
            <br><br><br><br><br><br><br><br><br><br><br><br>
                <p>Ingrese un video relacionado a su candidatura: </p>
                <input type="file" name="video" placeholder="video" required="true" accept="video/*" title="Ingrese un video">
                
            </div>
            <br>
            <br>
            <div>
                <input type="hidden" name="usuario" value="${Usuarios.id}">
                <input type="hidden" name="opcon" value="Guardar">
                <button class="btn" type="submit" name="btn2" value="Guardar">Guardar</button>
            </div>
        </form>
        <br>
        <a href="VerificarCandidato.jsp"><button class="btn2" type="button">Volver</button> </a>
    </center>
                <br><br><br>
    <%            }


    %>
</body>
</html>
