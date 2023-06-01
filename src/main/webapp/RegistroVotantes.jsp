<%-- 
    Document   : RegistroVotantes
    Created on : 29 may 2023, 11:04:11
    Author     : chang
--%>

<%@page import="java.io.FileInputStream"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="org.apache.poi.ss.usermodel.*" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de votantes</title>
        <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="registro3.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap" rel="stylesheet">
        
        <link rel="shortcut icon" href="LogoEzVote_sinfondo.png" type="image/x-icon">
        <script>
            function mostrarContrasena() {
                var tipo = document.getElementById("contra");
                var tipo2 = document.getElementById("repetircontra");
                if (tipo.type == "password") {
                    tipo.type = "text";
                    tipo2.type = "text";
                } else {
                    tipo.type = "password";
                    tipo2.type = "password";
                }
            }

            document.onreadystatechange = function() {
            if (document.readyState !== "complete") {
                document.querySelector(
                  "body").style.visibility = "hidden";
                document.querySelector(
                  "#spinner").style.visibility = "visible";
            } else {
                document.querySelector(
                  "#spinner").style.display = "none";
                document.querySelector(
                  "body").style.visibility = "visible";
            }
        };
        </script>
        <link rel="stylesheet" type="text/css" href="css/Loader.css">
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
<div class="inline">
        <div  class="center">
            
           

        
        <nav class="nav">
            <div class="nav-menu flex-row">
                <div class="nav-brand">
                    <a class="text-gray">EzVote</a>
                </div>
                <div class="toggle-collapse">
                    <div class="toggle-icons">
                        <i class="fas fa-bars"></i>
                    </div>
                </div>
                <div>
                    <ul class="nav-items">
                        <li class="nav-link">
                            <a href="Admin.jsp">Volver</a>
                        </li>


                    </ul>
                </div>
                
            </div>
        </nav>
    <center>
        <br><br>
        <div class="px-5 ms-xl-4">
          
            <img src="LogoEzVote_sinfondo.png" class="img-thumbnail" alt="..." style="height: 100px; width: 100px;">
          &nbsp; &nbsp; &nbsp; &nbsp;
          <span class="titulotop" class="h1 fw-bold mb-0">EzVote</span>
        </div>
        <form method="post" action="RegistroVotantes2.jsp" enctype="multipart/form-data">
            <div class="custom-file">
                <h1>Ingrese un archivo con extensión .xlsx </h1>
                <p>El archivo deberá tener en la primera columna todos los números de boleta de los votantes y en la segunda el correo de los mismos, para el uso correcto de la plataforma, cree un archivo nuevo</p>
                <input type="file" class="custom-file-input" name="Archivo" placeholder="Archivo" required="true" accept=".xlsx" title="Ingrese una foto">

            </div>

            <br><br>
            <div>
                <input type="hidden" name="usuario" value="${Usuarios.id}">
                <input type="hidden" name="opcon" value="Subir">
                <button class="btn" type="submit" name="btn2" value="Actualizar">Guardar</button>
            </div>
        </form>
    </center>
<center>
        
        
   
    <br>
   
        <div class="col-sm-2 text-black center-block">
              
        <form action="registro3.jsp" id="formu" method="post" class="formu">
            <h2 style="color: black" class="titulotop3"> Registrar a mano </h2>
            <br>
                    <div class="form-outline mb-4">
                        <input type="text" name="txtusu" id="usuario" required class="form-control" placeholder="Identificador" pattern="[a-zA-Z0-9\s]{4,50}" title="Ingrese un nombre de usuario de entre 4 y 10 caracteres">
              <label class="form-label" for="form2Example18"></label>
            </div>
                    
            <div class="form-outline mb-4">
                 <input type="email" name="email" id="apellido" required title="Ingresa un formato válido de correo" class="form-control" placeholder="Email">
              <label class="form-label" for="form2Example18"></label>
            </div>      
            
                    
                    <div class="d-grid gap-2">
                        <button class="btn btn-info btn-lg btn-block" class="registrito" style="background-color:#B48A4A; border-radius: 20px;color: white; border-color: #627dd9
                                "type="submit" name="btngrabar">Registar</button>
            </div>
                    
                    
                    
                    <a href="#">${msje}</a><br><br><br><br><br><br><br><br><br><br><br>
                </form>
        </div>
    </CENTER>
            


</div>
  
           <p class="spinner" id="spinner"><i class="fa fa-spinner fa-5x"></i></p>
    </div>
</body>
</html>
