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
        <link rel="shortcut icon" href="../imgasesores/logo_sin_fondo.png" type="image/x-icon">
        <link rel="stylesheet" href="estilos3.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet"> 
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Coiny&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Arimo&display=swap" rel="stylesheet">
        <script>

            function actualizar() {

                var usuario = document.getElementById("usuario");
                var pregunta = document.getElementById("pregunta");

                var respuesta = document.getElementById("respuesta");


                if (usuario.value !== "todotonto") {
                    var pregunta2 = document.getElementById("preguntaobt").value;
                    var respuesta2 = document.getElementById("respuestaobt").value;

                    pregunta.value = pregunta2;
                    respuesta.value = respuesta2;
                    alert('Reporte pre rellenado');
                } else {
                    alert("Seleccione un reporte");
                }
            }
        </script>
    </head>
    <body>
        <header>
            <nav>
                <a href="FAQS.jsp">FAQS</a>
                <a href="BajasEditor.jsp">Eliminar</a>
                <a href="CambiosEditor.jsp">Modificar</a>
                <a href="GerenteS.jsp">Gerente de Soporte</a> 

            </nav>
           
            <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                                                                            style="height: 100%; width: 100%;">
                <path d="M0.00,49.98 C150.00,150.00 349.20,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
                      style="stroke: none; fill: #fff;"></path>
                </svg></div>
        </header>
        <CENTER>
         <section class="textos-header">
                <h1>Editor</h1>

         </section>
        <main>
            <section class="contenedor sobre-nosotros"></section>
            
                <table border="1" width="900" align="center" class="tablilla">
                    <th colspan="3" >Reportes</th>
                    <tr bgcolor="#B5D7EA">
                   
                         <th>ID</th>
                        <th>Descripcion</th>

                        <th>Respuesta</th>
                        
                            <%
                                conexion conection = new conexion();
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
                                    String sql = "select * from reporte where Estatus = 'Cerrado';";
                                    cn = conection.conectar();
                                    ps = cn.prepareStatement(sql);

                                    rs = ps.executeQuery();

                                    while (rs.next()) {
                            %>
                    </tr>
                    <tr>
                        <td align="center"><%=rs.getString(1)%></td>
                        <td align="center"><%=rs.getString(2)%></td>
                        <td align="center"><%=rs.getString(8)%></td>


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
                <br>
                <div>
                <form action="" method="post" name="formu">
                    <select id="usuario" name="Usuario" required onchange="actualizar()">
                        <option value="todotonto" selected>Seleccione un Reporte</option>

                        <%
                            String usuario2 = null;
                            String pregunta2 = null;
                            String respuesta2 = null;
                            Connection cn5 = null;
                            PreparedStatement ps5 = null;
                            ResultSet rs5 = null;
                            String sql5 = ("select * from Reporte where Estatus='Cerrado';");
                            try {
                                cn5 = conection.conectar();
                                ps5 = cn5.prepareStatement(sql5);
                                rs5 = ps5.executeQuery();
                                while (rs5.next()) {
                                    usuario2 = rs5.getString(1);
                                    pregunta2 = rs5.getString(2);
                                    respuesta2 = rs5.getString(8);
                        %>

                        <option value="<%=usuario2%>"><%=rs5.getString(1)%></option>

                    <%
                            }
                        } catch (Exception e) {
                            out.println(e.getMessage());
                            ps5.close();
                            cn5.close();
                        }
                    %>

                    </select>

                    <input type="hidden" name="preguntaobt" id="preguntaobt" value="<%=pregunta2%>"> 
                    <input type="hidden" name="respuestaobt" id="respuestaobt" value="<%=respuesta2%>"> 
                    <br>
                    <br>
                    Pregunta <input style="color: white" type="text" name="pregunta" required class="textito" id="pregunta">
                    Respuesta <input style="color: white" type="text" name="respuesta" required class="textito" id="respuesta">

                    <br><br>
                   
                    <input type="submit" name="modificar" value="Registrar"  class="btn-custom">

                    <br><br>
                </form>
               

                <%
                    if (request.getParameter("modificar") != null) {
                        try {

                            String sql4 = "insert into FAQS values(default,(?),(?),(?),6);";
                            String pregunta = request.getParameter("pregunta");
                            String respuesta = request.getParameter("respuesta");
                            java.sql.Date dia = java.sql.Date.valueOf(LocalDate.now());
                            cn2 = conection.conectar();
                            ps2 = cn2.prepareStatement(sql4);
                            ps2.setString(1, pregunta);
                            ps2.setString(2, respuesta);
                            ps2.setDate(3, dia);
                            ps2.executeUpdate();
                            //request.getRequestDispatcher("/Soporte/EditorMain.html").forward(request, response);
                        } catch (SQLException error) {
                            out.print(error.toString());
                        }
                    }
                %>
                <table border="1" width="900" align="center" class="tablilla">
                    <th colspan="8" >Preguntas</th>
                    <tr bgcolor="#B5D7EA">

                        <th>Id Pregunta</th>
                        <th>Pregunta</th>
                        <th>Respuesta</th>
                        <th>Fecha</th>
                        <th>Id Usuario</th>

                        <%
                            response.flushBuffer();

                            try {
                                String sql3 = "select * from FAQS;";
                                cn3 = conection.conectar();
                                ps3 = cn3.prepareStatement(sql3);

                                rs2 = ps3.executeQuery();

                                while (rs2.next()) {
                        %>
                    </tr>
                    <tr>

                        <td align="center"><%=rs2.getInt(1)%></td>
                        <td align="center"><%=rs2.getString(2)%></td>
                        <td align="center"><%=rs2.getString(3)%></td>
                        <td align="center"><%=rs2.getDate(4)%></td>
                        <td align="center"><%=rs2.getInt(5)%></td>


                    </tr>


                    <%
                            }
                            ps3.close();
                            cn3.close();
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
        <footer>

            <h2 class="titulo-final">&copy; Speed Experience | Todos los derechos reservados</h2>
        </footer>
    </body>
</html>
