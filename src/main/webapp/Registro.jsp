<%-- 
    Document   : registro
    Created on : 17/10/2022, 10:18:58 PM
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 <link rel="stylesheet" type="text/css" media="screen" href="registro2.css">
 <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="./css/all.css">
    <link rel="shortcut icon" href="LogoEzVote_sinfondo.png" type="image/x-icon">

    <!-- --------- Owl-Carousel ------------------->
    <link rel="stylesheet" href="./css/owl.carousel.min.css">
    <link rel="stylesheet" href="./css/owl.theme.default.min.css">

    <!-- ------------ AOS Library ------------------------- -->
    <link rel="stylesheet" href="./css/aos.css">
    <link rel="stylesheet" href="./css/Style.css">
        <title>WANDERLUST</title>
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
            
            
        </script>
    </head>
    <body style="overflow: hidden;">
       
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
                        <a href="Login.jsp">Regresar</a>
                    </li>
                </ul>
            </div>
            <div class="social text-gray">
                <a href="https://www.facebook.com/profile.php?id=100092404643792&mibextid=ZbWKwL"><i class="fab fa-facebook-f"></i></a>
                <a href="https://instagram.com/ezvote09?igshid=ZGUzMzM3NWJiOQ=="><i class="fab fa-instagram"></i></a>
                <a href="https://twitter.com/ExvoteC?t=QoLgEAcGn7nPKT9ZUmFqpw&s=08"><i class="fab fa-twitter"></i></a>
               
            </div>
        </div>
    </nav>
        <br>
        <br>
    <center>
        
        <div class="px-5 ms-xl-4">
          
            <img src="LogoEzVote_sinfondo.png" class="img-thumbnail" alt="..." style="height: 100px; width: 100px;">
          &nbsp; &nbsp; &nbsp; &nbsp;
          <span class="titulotop" class="h1 fw-bold mb-0">EzVote</span>
        </div>
   
    <br>
   
        <div class="col-sm-2 text-black center-block">
              
        <form action="registro2.jsp" id="formu" method="post" class="formu">
            <h2 style="color: black" class="titulotop3"> Regístrate </h2>
            <br>
                    <div class="form-outline mb-4">
                        <input type="text" name="txtusu" id="usuario" required class="form-control" placeholder="Nombre" pattern="[a-zA-Z\s]{4,50}" title="Ingrese un nombre de usuario de entre 4 y 10 caracteres">
              <label class="form-label" for="form2Example18"></label>
            </div>
                    <div class="form-outline mb-4">
                 <input type="password" name="txtcontra" id="contra" required pattern=".{4,16}" title="Ingresa una contraseña de entre 4-16 caracteres" maxlength="16" class="form-control" placeholder="Contraseña">
              <label class="form-label" for="form2Example18"></label>
            </div>
            <div class="form-outline mb-4">
                 <input type="password" name="txtrepetircontra" id="repetircontra" required pattern=".{4,16}" title="Ingresa una contraseña de entre 4-16 caracteres" maxlength="16" class="form-control" placeholder="Repetir contraseña">
              <label class="form-label" for="form2Example18"></label>
              
            </div>  
            <div class="form-outline mb-4">
                 <input type="email" name="email" id="apellido" required title="Ingresa un formato válido de correo" class="form-control" placeholder="Email">
              <label class="form-label" for="form2Example18"></label>
            </div>      
            <div class="pt-1 mb-4">
                <button class="btn btn-light" class="detallitos" onclick="mostrarContrasena()" id="boton" type="button">Mostrar Contraseña</button> 
            </div>
                  
                    <br><br>
                    <div class="d-grid gap-2">
                        <button class="btn btn-info btn-lg btn-block" class="registrito" style="background-color:#B48A4A; border-radius: 20px;color: white; border-color: #627dd9
                                "type="submit" name="btngrabar">Registarse</button>
            </div>
                    
                    
                    
                    <a href="#">${msje}</a><br><br><br><br><br><br><br><br><br><br><br>
                </form>
        </div>
    </CENTER>
            <div class="burbujas">
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
            <div class="burbuja"></div>
        </div>   
    </body>
    
</html>
