<%-- 
    Document   : login2
    Created on : Nov 7, 2022, 7:22:30 AM
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Section: Design Block -->
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 <style>
            html, body{
                height: 100%;
                overflow: hidden;
            }
        </style>
<!-- Section: Design Block -->
<title>Login</title>
<script>
            function mostrarContrasena() {
                var tipo = document.getElementById("contra");
                if (tipo.type == "password") {
                    tipo.type = "text";
                } else {
                    tipo.type = "password";
                }
            }
            // Obtener todos los formularios
            let forms = document.querySelectorAll('form');

// Recorrer formularios para asignar evento a cada uno
            forms.forEach(form => form.addEventListener('submit', function (e) {
                    // Animar botón enviándole el foco
                    e.target.querySelector('.btn_animated').focus();
                }));
                function disableScroll(){  
    var x = window.scrollX;
    var y = window.scrollY;
    window.onscroll = function(){ window.scrollTo(x, y) };
}
        </script>
    </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #2091F9">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.html">
      <img src="../images/logoEmpresa.jpg" alt="" width="30" height="24" class="d-inline-block align-text-top">
      Wanderlust
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="index.html">Principal</a>
        </li>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="asesores.html">Asesores</a>
        </li>
        
      </ul>
      
    </div>
  </div>
</nav>

  <div class="container-fluid">
    <div class="row">
        
      <div class="col-sm-6 text-black center-block mx-auto align-items-center">
         <center> 
          <br>
        <div class="px-5 ms-xl-4">
          <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>
          <img src="../images/logoEmpresa.jpg" class="img-thumbnail" alt="...">
          <span class="h1 fw-bold mb-0">Wanderlust</span>
        </div>
          
        <div class="container-fluid">

          <form style="width: 23rem;" action="../srvSoporte?accion=verificar" id="formu" method="post" class="formu">
              <br>
              <br>
            <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Log in Soporte</h3>

            <div class="form-outline mb-4">
                <input type="text" id="form2Example18" class="form-control form-control-lg" placeholder="Usuario" name="txtusu" required pattern="[A-Za-z]{2-15}" title="Ingrese un usuario"/>
              <label class="form-label" for="form2Example18"></label>
            </div>

            <div class="form-outline mb-4">
                <input type="password" id="contra" class="form-control form-control-lg" placeholder="Password" name="txtcontra" required pattern="[A-Za-z]{2-15}" title="Ingrese una contraseña"/>
              <label class="form-label" for="form2Example28"></label>
            </div>
            <div class="pt-1 mb-4">
                <button class="btn btn-light" onclick="mostrarContrasena()" id="boton" type="button">Mostrar Contraseña</button>
              
            </div>
            
            
            <div class="d-grid gap-2 mx-auto">
                <button class="btn btn-info btn-lg btn-block" type="submit" name="accion">Login</button>
            </div>
            
            <p class="small mb-5 pb-lg-2"><a class="text-muted" href="recuperarContra.jsp">Olvidó su contraseña?</a></p>
            <p>Deseas crear una cuenta? <a href="registro.jsp" class="link-info">Registrate</a></p>
            <a href="#">${msje}</a>
          </form>

        </div>
          </center>
      </div>
    
      <div class="col-sm-6 px-0 d-none d-sm-block">
        <img src="https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/media/image/2022/02/bitcoin-2621405.jpg?tf=3840x"
          alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
      </div>    
    </div>
  </div>
          

</body>
</html>