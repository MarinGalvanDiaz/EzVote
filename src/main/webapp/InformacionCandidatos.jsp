
<%@page import="Modelo.Usuarios"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.sql.*"%>
<%@page import="Modelo.Conexion"%>
<%
if(session.getAttribute("Usuarios") != null){

   session.getAttribute("Usuarios");
   
    
%>
<html>
    <head>
        <title> EzVote </title>
        <link rel="shortcut icon" href="LogoEzVote_sinfondo.png" type="image/x-icon">
        <link rel="stylesheet" href="./css/all.css">
    <link rel="shortcut icon" href="LogoEzVote_sinfondo.png" type="image/x-icon">

    <!-- --------- Owl-Carousel ------------------->
    <link rel="stylesheet" href="./css/owl.carousel.min.css">
    <link rel="stylesheet" href="./css/owl.theme.default.min.css">

    <!-- ------------ AOS Library ------------------------- -->
    <link rel="stylesheet" href="./css/aos.css">

    <!-- Custom Style   -->
    <link rel="stylesheet" href="./css/Style.css">
    <link rel="stylesheet" href="css/Boton.css">
        <link rel="stylesheet" type="text/css" href="InfoCandidatos.css">
        <script src="https://kit.fontawesome.com/3ef3559250.js" crossorigin="anonymous"></script>
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
                        <a href="PaginaPrincipal.html"> Principal </a>
                    </li>
                   
                    
                    <li class="nav-link">
                        <a href="Tarjetas.jsp">Regresar</a>
                    </li>
                    
                    
                </ul>
            </div>
            <div class="social text-gray">
                
                 <a href="TarjetasVotar.jsp"><button class="btn" type="button">Votar</button> </a>
                <a href="https://www.facebook.com/profile.php?id=100092404643792&mibextid=ZbWKwL"><i class="fab fa-facebook-f"></i></a>
                <a href="https://instagram.com/ezvote09?igshid=ZGUzMzM3NWJiOQ=="><i class="fab fa-instagram"></i></a>
                <a href="https://twitter.com/ExvoteC?t=QoLgEAcGn7nPKT9ZUmFqpw&s=08"><i class="fab fa-twitter"></i></a>
               
            </div>
        </div>
    </nav>
    <br>
        <%
            Conexion con = new Conexion();
            Connection cn1 = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            Connection cn2 = null;
            PreparedStatement ps2 = null;
            ResultSet rs2 = null;
            int usu = Integer.parseInt(request.getParameter("usu"));
            //int usu = 1;
            String sql = "select Usuarios.identificador,Usuarios.email,candidatura.foto,candidatura.descripcion,candidatura.video,candidatura.idUsuario from Usuarios,candidatura where Usuarios.idUsuario = candidatura.idUsuario and Usuarios.idUsuario =(?);";
            String sql2 = "select * from objetivos where idUsuario = (?);";
            cn1 = con.conectar();
            ps = cn1.prepareStatement(sql);
            ps.setInt(1, usu);
            rs = ps.executeQuery();
            cn2 = con.conectar();
            ps2 = cn2.prepareStatement(sql2);
            ps2.setInt(1, usu);
            rs2 = ps2.executeQuery();
            if (rs.next() && rs2.next()) {
                String nombre = rs.getString(1);
                String email = rs.getString(2);
                byte[] imagenBytes = rs.getBytes(3);
                String descripcion = rs.getString(4);
                byte[] videoBytes = rs.getBytes(5);
                int usuario = Integer.parseInt(rs.getString(6));

                String foto = "src=\"data:image/jpeg;base64," + DatatypeConverter.printBase64Binary(imagenBytes) + "\"";
                String video = "src=\"data:video/mp4;base64," + javax.xml.bind.DatatypeConverter.printBase64Binary(videoBytes) + "\"";

                String obj1 = rs2.getString(2);
                String obj2 = rs2.getString(3);
                String obj3 = rs2.getString(4);


        %>
        <section class="resume">
            <div class="resume_left">
                <div class="r_profile_pic">
                    <img <%=foto%> alt="profile_pic" style="height: 200px;width: 200;">
                </div>
                <div class="r_left_sub">
                    <div class="r_aboutme">
                        <h2> Sobre mi...</h2>
                        <p><%=descripcion%></p>
                    </div>
                    <div class="r_skills">
                        <img src="LogoEzVote_sinfondo.png" alt="EzVote" style="height: 200px;width: 200px;">
                        <p>Esta aplicacion es propiedad de Speed Experience 2023 ©<p>
                        <p>Todos los derechos reservados.<p>
                    </div>

                </div>
            </div>
            <div class="resume_right">
                <div class="r_namerole">
                    <p> <%=nombre%> </p>

                    <p class="role">Candidato</p>
                </div>
                <div class="r_info">
                    <ul>
                        <li>
                            <p> <%=email%></p>
                        </li>
                        <li>
                            <p> IPN</p>
                        </li>
                    </ul>
                </div>
                <div class="r_right_sub">
                    <div class="r_education">
                        <h2>Propuestas</h2>
                        <ul>
                            <li>
                                <div class="r_ed_left">
                                    <p>Objetivo 1</p>
                                </div>
                                <div class="r_ed_right">
                                    <p><%=obj1%></p>

                                </div>
                            </li>
                            <li>
                                <div class="r_ed_left">
                                    <p>Objetivo 2</p>
                                </div>
                                <div class="r_ed_right">
                                    <p><%=obj2%></p>
                                </div>
                            </li>
                            <li>
                                <div class="r_ed_left">
                                    <p>Objetivo 3</p>
                                </div>
                                <div class="r_ed_right">
                                    <p><%=obj3%></p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="r_jobs">
                        <h2>Vídeo</h2>
                        <video width="460" height="235" controls autoplay>
                            <source <%=video%> type="video/mp4">
                        </video>
                        <br>
                        <br>
                        <br>
                    </div>
                </div>
            </div>
        </section>
        <%
            }
        %>
    </body>
</html>
<%
    }
else{
response.sendRedirect("Login.jsp");
}
%>