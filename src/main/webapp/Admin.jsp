<%-- 
    Document   : Admin
    Created on : 27 may 2023, 00:34:04
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("Usuarios") != null) {


%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Administrador</title>

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

        <!-- ----------------------------  Navigation ---------------------------------------------- -->

        <nav class="nav">
            <div class="nav-menu flex-row">
                <div class="nav-brand">
                    <a href="#" class="text-gray">Admnistrador</a>
                </div>
                <div class="toggle-collapse">
                    <div class="toggle-icons">
                        <i class="fas fa-bars"></i>
                    </div>
                </div>
                <div>
                    <ul class="nav-items">
                        <li class="nav-link">
                            <a href="votos.jsp">Votos</a>
                        </li>
                        <li class="nav-link">
                            <a href="Tarjetas_1.jsp">Candidatos</a>
                        </li>
                        <li class="nav-link">
                            <a href="eliminar.jsp">Eliminar</a>
                        </li>
                        <li class="nav-link">
                            <a href="SrvUsuarios?accion=cerrar">Cerrar sesión</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- ------------x---------------  Navigation --------------------------x------------------- -->

        <!----------------------------- Main Site Section ------------------------------>

        <main>

            <!------------------------ Site Title ---------------------->

            <hr>
            <section class="site-title">
                <div class="site-background" data-aos="fade-up" data-aos-delay="100">
                    <h2>Bienvenido Administrador</h2>
                </div>
            </section>
            <hr>


            <!------------x----------- Site Title ----------x----------->

            <!-- --------------------- Blog Carousel ----------------- -->

            <!-- ----------x---------- Blog Carousel --------x-------- -->

            <!-- ---------------------- Site Content -------------------------->
            <br><br><br>
            <section class="container">
                <div class="site-content">
                    <div class="posts">
                        <div class="post-content" data-aos="zoom-in" data-aos-delay="200">
                            <div class="post-image">
                                <div>
                                    <img src="./assets/Blog-post/foto-administracion-publica.jpg" class="img" alt="blog1">
                                </div>

                            </div>
                            <div class="post-title">
                                <a href="#">Candidatos & Propuestas</a>
                                <p style="text-align: justify;">A continuación se presenta la parte administrativa del proyecto. <br>
                                    Se cuentan con los candidatos  y sus propuestas, así como los votos emitidos por cada uno de los usuarios de este software.
                                    De tal manera que se podrán editar dichas propuestas solo en caso de ser necesario, 
                                    además se podrá eliminar el candidato en caso de ser indispensable u ocurra un error. 
                                    <br>
                                    L@ invit@ a pobrar su funcionalidad en el menú superior. 
                                </p>
                            </div>
                        </div>
                    </div>
                    <aside class="sidebar">
                        <div class="popular-post">
                            <h2>Notas informativas</h2>
                            <div class="post-content" data-aos="flip-up" data-aos-delay="200">
                                <div class="post-image">
                                    <div>
                                        <img src="./assets/popular-post/planeacion.jpg" class="img" alt="blog1">
                                    </div>
                                    <div class="post-info flex-row"><br>
                                        <span>Instituto Politécnico Nacional</span>
                                    </div>
                                </div>
                                <div class="post-title">
                                    <a href="https://www.ipn.mx/coplaneval/transparencia/">Coordinación General de Planeación e Información Institucional</a>
                                </div>
                            </div>
                            <div class="post-content" data-aos="flip-up" data-aos-delay="300">
                                <div class="post-image">
                                    <div>
                                        <img src="./assets/popular-post/sectores.png" class="img" alt="blog1">
                                    </div>
                                    <div class="post-info flex-row"><br>
                                        <span>Personal Politécnico</span>
                                    </div>
                                </div>
                                <div class="post-title">
                                    <a href="https://www.ipn.mx/comunidad/personal-politecnico/">Sectores del Instituto Politécnico Nacional</a>
                                </div>
                            </div>
                        </div>

                    </aside>
                </div>
            </section>

            <!-- -----------x---------- Site Content -------------x------------>

            <!---------------x------------- Main Site Section ---------------x----->

        </main>
        <!-- --------------------------- Footer ---------------------------------------- -->
        <footer class="footer">
            <div class="container">
                <div class="about-us" data-aos="fade-right" data-aos-delay="100">
                    <h2>EzVote</h2>
                    <p style="text-align: justify;">Es un proyecto destinado al beneficio de la comunidad Politecnica, con el objetivo de 
                        promover la participación de la comunidad estudiantil en las decisiones que afectan su desempeño escolar 
                    </p>
                </div>
                <div class="follow" data-aos="fade-left" data-aos-delay="100">
                    <h2>Siguenos</h2>
                    <div>
                        <a href="https://www.facebook.com/profile.php?id=100092404643792&mibextid=ZbWKwL"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://twitter.com/ExvoteC?t=QoLgEAcGn7nPKT9ZUmFqpw&s=08"><i class="fab fa-twitter"></i></a>
                        <a href="https://instagram.com/ezvote09?igshid=ZGUzMzM3NWJiOQ=="><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="rights flex-row">
                <h4 class="text-gray">
                    Copyright ©2023 All rights reserved | made by Speed Experience
                </h4>
            </div>
            <div class="move-up">
                <span><i class="fas fa-arrow-circle-up fa-2x"></i></span>
            </div>
        </footer>
        <!-- -------------x------------- Footer --------------------x------------------- -->

        <!-- Jquery Library file -->
        <script src="./js/Jquery3.4.1.min.js"></script>

        <!-- --------- Owl-Carousel js ------------------->
        <script src="./js/owl.carousel.min.js"></script>

        <!-- ------------ AOS js Library  ------------------------- -->
        <script src="./js/aos.js"></script>

        <!-- Custom Javascript file -->
        <script src="./js/main.js"></script>
    </body>
</html>
<%    } else {
        response.sendRedirect("Login.jsp");
    }
%>