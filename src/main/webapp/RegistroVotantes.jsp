<%-- 
    Document   : RegistroVotantes
    Created on : 29 may 2023, 11:04:11
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de votantes</title>
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
            <div class="social text-gray">
                <a href="https://www.facebook.com/profile.php?id=100092404643792&mibextid=ZbWKwL"><i class="fab fa-facebook-f"></i></a>
                <a href="https://instagram.com/ezvote09?igshid=ZGUzMzM3NWJiOQ=="><i class="fab fa-instagram"></i></a>
                <a href="https://twitter.com/ExvoteC?t=QoLgEAcGn7nPKT9ZUmFqpw&s=08"><i class="fab fa-twitter"></i></a>
               
            </div>
        </div>
    </nav>
    <center>
        <br><br>
        <form method="post" action="GuardarCandidatura.jsp" enctype="multipart/form-data">
            <div class="custom-file">
                <h1>Ingrese un archivo con extensión .xlsx </h1>
                <p>El archivo deberá tener en la primera columna todos los números de boleta de los votantes y en la segunda el correo de los mismos.</p>
                <input type="file" class="custom-file-input" name="foto" placeholder="Foto" required="true" accept=".xlsx" title="Ingrese una foto">
                
            </div>
            
            <br><br>
            <div>
                <input type="hidden" name="usuario" value="${Usuarios.id}">
                <input type="hidden" name="opcon" value="Actualizar">
                <button class="btn" type="submit" name="btn2" value="Actualizar">Actualizar</button>
            </div>
        </form>
    </center>
                
                <%
                
                
                
                
                
                %>
                
                
    </body>
</html>
