<%@page import="javax.xml.bind.DatatypeConverter"%>
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
                            <h2 style="color: #eb7d46">Eliminar Candidatos</h2>
                        </div>
                        <br>   
                        <main>
                            <table border="1" width="1000" align="center" class="tablilla">
                                <th colspan="7" bgcolor="#F9BD67">Candidatos</th>
                                <tr >
                                    <th bgcolor="#F8DB9C">ID</th>
                                    <th bgcolor="#F8DB9C">Foto</th>
                                    <th bgcolor="#F8DB9C">Descripcion</th>
                                    <th bgcolor="#F8DB9C">Objetivo 1</th>
                                    <th bgcolor="#F8DB9C">Objetivo 2</th>
                                    <th bgcolor="#F8DB9C">Objetivo 3</th>
                                    <th bgcolor="#F8DB9C">Videos</th>
                                        <%
                                            Conexion conection = new Conexion();
                                            String usuario = request.getParameter("Usuario");
                                            Connection cn = null;
                                            Connection cn2 = null;
                                            Connection cn3 = null;
                                            Connection cn4 = null;
                                            PreparedStatement ps = null;
                                            PreparedStatement ps2 = null;
                                            PreparedStatement ps3 = null;
                                            PreparedStatement ps4 = null;
                                            ResultSet rs = null;
                                            ResultSet rs2 = null;
                                            try {
                                                String sql = "select * from candidatura;";
                                                cn = conection.conectar();
                                                ps = cn.prepareStatement(sql);

                                                rs = ps.executeQuery();

                                                while (rs.next()) {
                                                    int idCandidatura = rs.getInt(1);
                                                    cn2 = conection.conectar();
                                                    ps2 = cn2.prepareStatement("Select * from objetivos where idUsuario = (?);");
                                                    ps2.setInt(1, idCandidatura);
                                                    rs2 = ps2.executeQuery();

                                                    byte[] imagenBytes = rs.getBytes(2);
                                                    String foto = "src=\"data:image/jpeg;base64," + DatatypeConverter.printBase64Binary(imagenBytes) + "\"";

                                                    byte[] videoBytes = rs.getBytes(5);
                                                    String video = "src=\"data:video/mp4;base64," + javax.xml.bind.DatatypeConverter.printBase64Binary(videoBytes) + "\"";
                                                    if (rs2.next()) {

                                        %>
                                </tr>
                                <tr>

                                    <td align="center"><%=rs.getString(1)%></td>
                                    <td align="center"><img <%=foto%> style="height: 100px;width: 100px;"></td>
                                    <td align="center"><%=rs.getString(3)%></td>
                                    <td align="center"><%=rs2.getString(2)%></td>
                                    <td align="center"><%=rs2.getString(3)%></td>
                                    <td align="center"><%=rs2.getString(4)%></td>
                                    <td align="center"><video width="100" height="100" controls>
                                            <source <%=video%> type="video/mp4">
                                        </video></td>


                                </tr>


                                <%
                                            }
                                        }
                                        ps.close();
                                        cn.close();
                                    } catch (SQLException error) {
                                        out.print(error.toString());
                                    }
                                %>
                            </table>
                            <br>
                            <div  class="custom-select">
                                <form action="" method="post" name="formu">
                                    <br>
                                    <select id="usuario" name="candidato" selected>
                                        <option value="0" selected>Seleccione un Candidato</option> 
                                        <%
                                            String usuario2 = null;

                                            ResultSet rs3 = null;
                                            String sql3 = ("select * from candidatura;");
                                            try {
                                                cn3 = conection.conectar();
                                                ps3 = cn3.prepareStatement(sql3);
                                                rs3 = ps3.executeQuery();
                                                while (rs3.next()) {
                                                    usuario2 = rs3.getString(1);

                                        %>

                                        <option value="<%=usuario2%>"><%=rs3.getString(1)%></option>



                                        <%
                                                }
                                            } catch (Exception e) {
                                                out.println(e.getMessage());
                                                ps3.close();
                                                cn3.close();
                                            }
                                        %>

                                    </select>

                                    </<div>
                                        <br><br>

                                        <input class="btn-custom" type="submit" name="modificar" value="Eliminar">

                                        <br><br><br>
                                        </form>
                                        <form action="eliminar.jsp" method="post">
                                            <button type="submit" value="recargar" id="jaqui" style="display: none;"></button>
                                        </form>

                                        <%
                                            if (request.getParameter("modificar") != null) {
                                                try {

                                                    String sql4 = "delete from candidatura where idCandidatura = (?);";
                                                    String sql5 = "delete from votos where idVotado = (?);";
                                                    int eliminar = Integer.parseInt(request.getParameter("candidato"));
                                                    Connection cn5 = null;
                                                    PreparedStatement ps5 = null;
                                                    ResultSet rs5 = null;
                                                    cn5 = conection.conectar();
                                                    ps5 = cn5.prepareStatement("select * from candidatura where idCandidatura = (?);");

                                                    ps5.setInt(1, eliminar);
                                                    rs5 = ps5.executeQuery();
                                                    if (rs5.next()) {
                                                        cn2 = conection.conectar();
                                                        ps2 = cn2.prepareStatement(sql4);
                                                        ps2.setInt(1, eliminar);

                                                        ps2.executeUpdate();

                                                        cn4 = conection.conectar();
                                                        ps4 = cn4.prepareStatement(sql5);
                                                        ps4.setInt(1, eliminar);
                                                        ps4.executeUpdate();
                                        %>
                                        <%
                                            out.print("<script>");
                                            out.print("swal('Realizado!',{");
                                            out.print("icon: 'success',");
                                            out.print("buttons: {");
                                            out.print(" catch: {");
                                            out.print("text: 'Continuar',");
                                            out.print("value: 'catch',");
                                            out.print("}");
                                            out.print(" },");
                                            out.print("})");
                                            out.print(".then((value) => {");
                                            out.print("switch (value) {");
                                            out.print("case 'catch':");
                                            out.print("window.location.href = 'eliminar.jsp';");
                                            out.print("break;");
                                            out.print("default:");
                                            out.print("window.location.href = 'eliminar.jsp';");
                                            out.print("}");
                                            out.print("});");
                                            out.print("</script>");


                                        %>

                                        <%                                //request.getRequestDispatcher("/Soporte/EditorMain.html").forward(request, response);
                                                    } else {
                                                        out.print("<script>");
                                                        out.print("swal('Cuidado!','No existe ese candidato','warning')");
                                                        out.print("</script>");
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
