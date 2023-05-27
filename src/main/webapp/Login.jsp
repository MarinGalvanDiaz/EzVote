<%-- 
    Document   : Login
    Created on : 9 may 2023, 07:25:14
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <!-- Font Awesome Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="css/all.css">
    <link rel="stylesheet" href="css/Login.css">

    
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
                <ul class="nav-items justify-content-end">
                    <li class="nav-link">
                        <a href="PaginaPrincipal.html">Principal</a>
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
            
        </div>
    </nav>
        
        <section class="h-100 gradient-form" style="background-color: #eee;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-10">
        <div class="card rounded-3 text-black">
          <div class="row g-0">
            <div class="col-lg-6">
              <div class="card-body p-md-5 mx-md-4">

                <div class="text-center">
                  <img src="LogoEzVote_sinfondo.png"
                    style="width: 185px;" alt="logo">
                  <h4 class="mt-1 mb-5 pb-1">Somos EzVote</h4>
                </div>

                <form method="post" action="SrvUsuarios?accion=verificar">
                    <p style="color: black;">Ingresa a la plataforma</p>

                  <div class="form-outline mb-4">
                    <input type="text" id="form2Example11" class="form-control"
                      placeholder="Usuario" name="txtusu" required="true" title="Llene este campo"/>
                    
                  </div>

                  <div class="form-outline mb-4">
                    <input type="password" id="form2Example22" class="form-control" name="txtcontra" required="true" placeholder="Contraseña" title="Llene este campo" />
                    
                  </div>

                  <div class="text-center pt-1 mb-5 pb-1">
                      <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">Log in</button><br>
                    <a class="text-muted" href="#!">Olvidaste tu contraseña?</a>
                     
                  </div>
                  <div class="text-center">
                      <a style="color: blue;"><u>${msje}</u></a>
                   
                  </div>
                    
                  <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">Quieres registrarte como candidato?</p>
                    <button type="button" class="btn btn-outline-danger">Regístrate</button>
                  </div>

                </form>

              </div>
            </div>
            <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
              <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                <h4 class="mb-4">Bienvenido a EzVote</h4>
                <p class="small mb-0" style="color: white;">EzVote es un prototipo que busca
                facilitar la votación y participación de todos los elementos presentes en una votación.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
        
        
        
        
        
    </body>
</html>
