<%-- 
    Document   : TarjetasVotar
    Created on : 26 may 2023, 23:19:42
    Author     : chang
--%>

<%@page import="java.sql.*"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="Modelo.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("Usuarios") != null){


   
%>
<html lang="es" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>EzVote</title>
    <link rel="stylesheet" href="cards.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
     <link rel="stylesheet" href="./css/all.css">
    <link rel="shortcut icon" href="LogoEzVote_sinfondo.png" type="image/x-icon">

    <!-- --------- Owl-Carousel ------------------->
    <link rel="stylesheet" href="./css/owl.carousel.min.css">
    <link rel="stylesheet" href="./css/owl.theme.default.min.css">

    <!-- ------------ AOS Library ------------------------- -->
    <link rel="stylesheet" href="./css/aos.css">

    <!-- Custom Style   -->
    <link rel="stylesheet" href="./css/Style.css">
  </head>
  <body background="fondo.gif" style="width: 100%; height: 100%; background-size: cover;">
      <div class="headersin">
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
                        <a href="Tarjetas.jsp">Regresar</a>
                    </li>
                    <li class="nav-link">
                        <a href="SrvUsuarios?accion=cerrar"> Cerrar Sesion </a>
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
      </div>
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
      <div class="box">
      <div class="image">
        <img <%=foto%>>
        </div>
        <div class="name_job"><%=nombre%></div>
        <p> <%=descripcion%></p>
        <div class="btns">
            <form action="RegistrarVoto.jsp" method="post">
            <input type="hidden" value="<%=usuario%>" name="usu">    
            <button type="submit" style="width: 280px; color: white; ">Votar</button>
            </form>
        </div>
      </div>
      <%
          }
      %>
    </div>
      </body>
</html>

<%
    }else{
response.sendRedirect("Login.jsp");
}
%>