<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="com.mycompany.adminez.conexion"%>
<%@page import="java.text.*"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html lang="en">
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


    <!-- --------- Owl-Carousel ------------------->
    <link rel="stylesheet" href="./css/owl.carousel.min.css">
    <link rel="stylesheet" href="./css/owl.theme.default.min.css">

    <!-- ------------ AOS Library ------------------------- -->
    <link rel="stylesheet" href="./css/aos.css">

    <!-- Custom Style   -->
    <link rel="stylesheet" href="./css/Style2.css">
    <style>
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

    <!-- ----------------------------  Navigation ---------------------------------------------- -->

    <nav class="nav">
        <div class="nav-menu flex-row">
            <div class="nav-brand">
                <a class="text-gray">Admnistrador</a>
            </div>
            <div class="toggle-collapse">
                <div class="toggle-icons">
                    <i class="fas fa-bars"></i>
                </div>
            </div>
            <div>
                <ul class="nav-items">
                    <li class="nav-link">
                        <a href="Admin.html">Regresar</a>
                    </li>
                    </ul>
            </div>
            
        </div>
    </nav>

        <!------------------------ Site Title ---------------------->

        <hr>
        <CENTER>
        <section class="site-title">
            <div class="site-background" data-aos="fade-up" data-aos-delay="100">
                <h2 style="color: #eb7d46">Votos</h2>
            </div>
            <br>
            <main>
                    <table border="1" width="1000" align="center" class="tablilla">
                        <th colspan="5" bgcolor="#F9BD67" >Votos</th>
                        <tr >
                            <th bgcolor="#F8DB9C">ID</th>
                            <th bgcolor="#F8DB9C">Foto</th>
                            <th bgcolor="#F8DB9C">Descripcion</th>
                            <th bgcolor="#F8DB9C">Objetivos</th>
                            <th bgcolor="#F8DB9C">Videos</th>

                                <%
                                    conexion conection = new conexion();
                                    String usuario = request.getParameter("Usuario");
                                    Connection cn = null;
                                    Connection cn2 = null;
                                    Connection cn3 = null;
                                    PreparedStatement ps = null;
                                    PreparedStatement ps2 = null;
                                    PreparedStatement ps3 = null;
                                    ResultSet rs = null;
                                    ResultSet rs2 = null;
                                    try {
                                        String sql = "select * from candidatura";
                                        cn = conection.conectar();
                                        ps = cn.prepareStatement(sql);
    
                                        rs = ps.executeQuery();
    
                                        while (rs.next()) {
                                %>
                        </tr>
                        
                        <tr>
    
                            <td align="center"><%=rs.getString(1)%></td>
                            <td align="center"><%=rs.getString(2)%></td>
                            <td align="center"><%=rs.getString(3)%></td>
                            <td align="center"><%=rs.getString(4)%></td>
                            <td align="center"><%=rs.getString(5)%></td>
    
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
