<%-- 
    Document   : Tarjetas
    Created on : 11 may. 2023, 8:01:51 a. m.
    Author     : bolan
--%>

<%@page import="Modelo.Usuarios"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>

<%@page import="java.sql.*"%>
<%@page import="Modelo.Conexion"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%
if(session.getAttribute("Usuarios") != null){


   
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> EzVote </title>
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="./css/all.css">
    <link rel="shortcut icon" href="LogoEzVote_sinfondo.png" type="image/x-icon">

    <!-- --------- Owl-Carousel ------------------->
    <link rel="stylesheet" href="./css/owl.carousel.min.css">
    <link rel="stylesheet" href="./css/owl.theme.default.min.css">

    <!-- ------------ AOS Library ------------------------- -->
    <link rel="stylesheet" href="./css/aos.css">

    <!-- Custom Style   -->
    <link rel="stylesheet" href="./css/Style.css">
    <link rel="stylesheet" href="Tarjetitas.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ultra&display=swap" rel="stylesheet">
</head>
<body>
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
                        <a href="SrvUsuarios?accion=cerrar">Cerrar Sesión</a>
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
    <br><br><br><br>
     <p class="titulo"> Candidatos </p>
        
<center>
    <div class="container">
        <%
            
        Conexion con = new Conexion();
        Connection cn1 = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection cn2 = null;
        PreparedStatement ps2 = null;
        ResultSet rs2 = null;
        String sql = "select Usuarios.identificador,candidatura.foto,candidatura.descripcion,candidatura.idUsuario from Usuarios,candidatura where Usuarios.idUsuario = candidatura.idUsuario;";
        String sql2 = "select * from candidatura where idUsuario = (?);";
        
        cn1 = con.conectar();
        ps = cn1.prepareStatement(sql);
        rs = ps.executeQuery();
        
       /* cn2 = con.conectar();
        ps2 = cn1.prepareStatement(sql2);
        ps2.setInt(1, Integer.parseInt(rs.getString(1)));
        */
        
        while(rs.next()){
        String nombre = rs.getString(1);
        byte[] imagenBytes = rs.getBytes(2);
        String descripcion = rs.getString(3);
        int usuario = Integer.parseInt(rs.getString(4));
        
        String foto =  "src=\"data:image/jpeg;base64," + DatatypeConverter.printBase64Binary(imagenBytes) + "\"";    

        %>
        
        <div class="card">
            <div class="personaje_2">
                <div class="imagen_personaje_2">
                 <img <%=foto%> id="imgPreview" alt="img" style="height: 350px; width: 200px">
                </div>
                <div class="detalle_2">
                    <h2> <%=nombre%></h2>
                    <p><%=descripcion%></p>
                    <div>
                        <form method="post" action="InformacionCandidatos.jsp">
                            <input type="hidden" value="<%=usuario%>" name="usu">
                            <button type="submit" class="btn1""><p style="font-family: Arial; font-size: 10px;color: white;">Leer mas</p></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

       
        <br><br>
        <br><br>
        <br><br>
<%
    
            }
        %>
    </div>
        
        
    </center>
    <footer class="footer">
        <div class="container1">
            <div class="about-us" data-aos="fade-right" data-aos-delay="200">
                <h2> Sobre nosotros</h2>
                <p style="text-align: justify">Es un proyecto destinado al beneficio de la comunidad Politecnica, con el objetivo de 
                    promover la participación de la comunidad estudiantil en las decisiones que afectan su desempeño escolar</p>
            </div>
           
            <div class="follow" data-aos="fade-left" data-aos-delay="200">
                <center> 
                <h2>Síguenos</h2>
                <p> Comunícate con nosotros</p>
                <div>
                    <a href="https://www.facebook.com/profile.php?id=100092404643792&mibextid=ZbWKwL"><i class="fab fa-facebook-f"></i></a>
                <a href="https://instagram.com/ezvote09?igshid=ZGUzMzM3NWJiOQ=="><i class="fab fa-instagram"></i></a>
                <a href="https://twitter.com/ExvoteC?t=QoLgEAcGn7nPKT9ZUmFqpw&s=08"><i class="fab fa-twitter"></i></a>
                  
                </div>
                </center>
            </div>
        </div>
        <div class="rights flex-row">
            <h4 class="text-gray">
                Copyright ©2023 All rights reserved | made by Speed Experience
              
            </h4>
            <br><br><br>
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

<%
    }
else{
response.sendRedirect("Login.jsp");
}
%>