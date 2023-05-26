<%@page import="java.time.LocalDate"%>
<%@page import="Modelo.conexion"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>WANDERLUST</title>
        
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
                        <a href="Admin.html">Regresar</a>
                    </li>
                    </ul>
            </div>
            
        </div>
    </nav>
            
        
        <hr>
        <CENTER>
        <section class="site-title">
            <div class="site-background" data-aos="fade-up" data-aos-delay="100">
                <h2 style="color: #eb7d46">Candidatos</h2>
            </div>
            <br>
            <main>
                    <table border="1" width="1000" align="center" class="tablilla">
                        <th colspan="5" bgcolor="#F9BD67" >Candidatos</th>
                        <tr bgcolor="#eb7d46">
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
                                    String sql = "select * from candidatura;";
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
                 <div  class="custom-select">
                <form action="" method="post" name="formu">
                    <br>
                 <select id="usuario" name="id" required onchange="actualizar()">
                        <option value="todotonto" selected>Seleccione un Candidato</option>

                        <%
                            String usuario2 = null;
                            String foto2 = null;
                            String descrpicion2 = null;
                            String objetivos2 = null;
                            String video2 = null;
                            Connection cn9 = null;
                            PreparedStatement ps9 = null;
                            ResultSet rs9 = null;
                            String sql9 = ("select * from candidatura;");
                            try {
                                cn9 = conection.conectar();
                                ps9 = cn9.prepareStatement(sql9);
                                rs9 = ps9.executeQuery();
                                while (rs9.next()) {
                                    usuario2 = rs9.getString(1);
                                    foto2 = rs9.getString(2);
                                    descripcion2 = rs9.getString(3);
                                    objetivos2 = rs9.getString(4);
                                    video2 = rs9.getString(5);
                        %>

                        <option value="<%=usuario2%>"><%=rs9.getString(1)%></option>

                    <%
                            }
                        } catch (Exception e) {
                            out.println(e.getMessage());
                            ps9.close();
                            cn9.close();
                        }
                    %>
                    
                    <input type="hidden" name="foto" id="foto" value="<%=foto2%>"> 
                    <input type="hidden" name="descripcion" id="descripcion" value="<%=descripcion2%>"> 
                    <input type="hidden" name="objetivos" id="objetivos" value="<%=objetivos2%>"> 
                    <input type="hidden" name="video" id="video" value="<%=video2%>"> 
                    </select>
                 </div>
                        Foto <input style="color: white"  class="textito" type="text" name="foto" id="foto" required>
                        Descripcion <input style="color: white"  class="textito" type="text" name="descripcion" id="descripcion" required>
                         Objetivos <input style="color: white"  class="textito" type="text" name="objetivos" id="objetivos" required>
                        Video <input style="color: white"  class="textito" type="text" name="video" id="video" required>

                    <br><br>

                    <input class="btn-custom" type="submit" name="modificar" value="Cambiar">

                    <br><br><br>
                </form>
                
                    
                <%
                    if (request.getParameter("modificar") != null) {
                        try {

                            String sql4 = "Update candidatura set foto=(?),descripcion=(?),objetivos=(?),video=(?) where idCandidatura=(?);";
                            Connection cn5 = null;
                            PreparedStatement ps5 = null;
                            ResultSet rs5 = null;
                            cn5 = conection.conectar();
                            ps5 = cn5.prepareStatement("select * from candidatura where idCandidatura=(?);");
                            int id = Integer.parseInt(request.getParameter("id"));
                            ps5.setInt(1, id);
                            rs5 = ps5.executeQuery();
                            if (rs5.next()) {

                                String foto = request.getParameter("foto");
                                String descripcion = request.getParameter("descripcion");
                                String objetivos = request.getParameter("objetivos");
                                String video = request.getParameter("video");
                                cn2 = conection.conectar();
                                ps2 = cn2.prepareStatement(sql4);
                                ps2.setInt(5, id);
                                ps2.setString(1, foto);
                                ps2.setString(2, descripcion);
                                ps2.setString(3, objetivos);
                                ps2.setString(4, video);
                                ps2.executeUpdate();
                                //request.getRequestDispatcher("/Soporte/EditorMain.html").forward(request, response);
                                out.println("<script>alert('Modificado');</script>");
                                out.println("<script>");
                                            out.println("(function(){");
                                            out.println("var boton = document.getElementById('jaqui');");
                                            out.println("boton.click();");
                                            out.println("})();");
                                            out.println("</script>");
                            } else {
                                out.println("<script>alert('No existe ese candidato')</script>");

                            }

                        } catch (SQLException error) {
                            out.print(error.toString());
                        }
                    }
                %>

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
                
    </body>
</html>
