
<%@page import="Controlador.Correo"%>
<%@page import="Modelo.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

<%@page import="java.text.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Administrador</title>

        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="./css/all.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lilita+One&display=swap" rel="stylesheet">


        <!-- ------------ AOS Library ------------------------- -->
        <link rel="stylesheet" href="./css/aos.css">

        <!-- Custom Style   -->
        <link rel="stylesheet" href="./css/Style2.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="shortcut icon" href="LogoEzVote_sinfondo.png" type="image/x-icon">
        <!DOCTYPE html>
    <html>
        <head>
            <style>
                /* Estilos para personalizar el select */
                .custom-select {
                    max-width: 250px;
                    position: relative;
                }

                .custom-select select {
                    display: inline-block;
                    width: 100%;
                    cursor: pointer;
                    padding: 7px 10px;
                    height: 35px;
                    outline: 0;
                    border: 0;
                    border-radius: 0;
                    background: #f0f0f0;
                    color: #7b7b7b;
                    font-size: 0.9em;
                    color: #999;
                    font-family:
                        'Quicksand', sans-serif;
                    border:2px solid rgba(0,0,0,0.2);
                    border-radius: 12px;
                    position: relative;
                    transition: all 0.25s ease;
                }

                .custom-select select option {
                    padding: 15px;
                }

                .btn-custom {
                    text-decoration:none;
                    font-weight: 600;
                    font-size: 13px;
                    color:black;
                    padding-top:13px;
                    padding-bottom:13px;
                    padding-left:30px;
                    padding-right:30px;
                    background-color:#f0f0f0;
                    border-color: rgba(0,0,0,0.2);
                    border-width: 2px;
                    border-style: solid;
                    border-radius:15px;
                    cursor: pointer;

                }
                table {
                    width: 90%;
                    border-collapse: collapse;
                }

                th, td {
                    padding: 10px;
                    text-align: center;
                }


                tr:nth-child(even) {
                    background-color: #f9f9f9;
                }
            </style>



        </head>
        <body>
            <header>
                <nav class="nav">
                    <div class="nav-menu flex-row">
                        <div class="nav-brand">
                            <a href="#" class="text-gray">Administrador</a>
                        </div>
                        <div class="toggle-collapse">
                            <div class="toggle-icons">
                                <i class="fas fa-bars"></i>
                            </div>
                        </div>
                        <div>
                            <ul class="nav-items">
                                <li class="nav-link">
                                    <a href="Admin.jsp">Regresar</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                </nav>
                <hr>
                <CENTER>
                    <section class="site-title">
                        <div class="site-background" data-aos="fade-up" data-aos-delay="100">
                            <h2 style="color: #eb7d46">Votantes</h2>
                        </div>
                        <br>   
                        <main>
                            <table border="1" width="1000" align="center" class="tablilla">
                                <th colspan="4" bgcolor="#F9BD67">Votantes</th>
                                <tr >
                                    <th bgcolor="#F8DB9C">ID</th>
                                    <th bgcolor="#F8DB9C">Identificador</th>
                                    <th bgcolor="#F8DB9C">Correo</th>

                                    <th bgcolor="#F8DB9C">¿Ya ha votado?</th>
                                   

                                    <%
                                        Conexion conection = new Conexion();

                                        Connection cn = null;

                                        PreparedStatement ps = null;

                                        ResultSet rs = null;

                                        try {
                                            String sql = "select * from Usuarios where cargo = 7;";
                                            cn = conection.conectar();
                                            ps = cn.prepareStatement(sql);

                                            rs = ps.executeQuery();

                                            while (rs.next()) {
                                            String haVotado = "";
                                            if(rs.getInt(6)==0){
                                            haVotado="SI";
                                        }else{
                                        haVotado="NO";
                                        }

                                    %>
                                </tr>
                                <tr>

                                    <td align="center"><%=rs.getString(1)%></td>
                                    <td align="center"><%=rs.getString(2)%></td>
                                    <td align="center"><%=rs.getString(4)%></td>
                                    <td align="center"><%=haVotado%></td>
                                    


                                </tr>


                                <%

                                        }
                                        ps.close();
                                        cn.close();
                                    } catch (SQLException error) {
                                        out.print(error.toString());
                                    }


                                %>
                            </table>

                            </CENTER>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                        </main>
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
