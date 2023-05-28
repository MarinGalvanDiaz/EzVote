<%@page import="java.time.LocalDate"%>
<%@page import="Controlador.Correo"%>
<%@page import="Modelo.Conexion"%>
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

    </head>
    <body>
        <header>
            <nav>
                <a href="GerenteS.jsp">Gerente de Soporte</a>
                <a href="GerenteM.jsp">Gerente de Mantenimiento</a>
                <a href="loginSoporte.jsp">Cerrar sesión</a>

            </nav>
            <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                                                                            style="height: 100%; width: 100%;">
                <path d="M0.00,49.98 C150.00,150.00 349.20,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
                      style="stroke: none; fill: #fff;"></path>
                </svg></div>
        </header>
        <CENTER>
        <section class="textos-header">
                <h1>Ingeniero de Mantenimiento</h1>

        </section>
        <main>
            <section class="contenedor sobre-nosotros"></section>
   
                <table border="1" width="900" align="center" class="tablilla">
                    <th colspan="8" >Reportes</th>
                    <tr bgcolor="#B5D7EA">

                        <th>Id Reporte</th>
                        <th>Descripcion</th>
                        <th>Hora</th>
                        <th>Fecha</th>
                        <th>Estatus</th>
                        <th>Id Encargado</th>
                        <th>Id Usuario</th>
                        <th>Respuesta</th>
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
                                ResultSet rs3 = null;
                                try {
                                    String sql = "select * from reporte where Estatus = 'En programacion';";
                                    cn = conection.conectar();
                                    ps = cn.prepareStatement(sql);

                                    rs = ps.executeQuery();

                                    while (rs.next()) {
                            %>
                    </tr>
                    <tr>

                        <td align="center"><%=rs.getInt(1)%></td>
                        <td align="center"><%=rs.getString(2)%></td>
                        <td align="center"><%=rs.getTime(3)%></td>
                        <td align="center"><%=rs.getDate(4)%></td>
                        <td align="center"><%=rs.getString(5)%></td>
                        <td align="center"><%=rs.getInt(6)%></td>
                        <td align="center"><%=rs.getInt(7)%></td>
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
                <form action="" method="post" name="formu">
                    <br>
                    <select id="usuario" name="reporte" selected>
                        <option value="0" selected>Seleccione un Reporte</option>

                        <%
                            String usuario2 = null;
                            String pregunta2 = null;
                            String respuesta2 = null;
                            Connection cn5 = null;
                            PreparedStatement ps5 = null;
                            ResultSet rs5 = null;
                            String sql5 = "select * from reporte where Estatus = 'En programacion';";
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
                    <br>
                    <br>
                    Respuesta <input style="color: white"  class="textito" type="text" name="respuesta" required>
                    <br><br>

                    <input class="btn-custom" type="submit" name="modificar" required>

                    <br><br><br>
                </form>
                </form>
                <form method="post" action="IngenieroM.jsp">
                    <input type="submit" name="Jaqui" value="Actualizar" class="btn-custom" id="jaqui">
                </form>
                <%
                    if (request.getParameter("modificar") != null) {
                        try {
                            String sql3 = "select * from Reporte where IdReporte = (?)";
                            String sql4 = "update Reporte set Estatus = (?),IdUsuario = 4,Respuesta =(?),Fecha=(?),Hora=(?) where IdReporte = (?);";
                            int id = 0;
                            if (Integer.parseInt(request.getParameter("reporte")) < 1) {
                                out.println("<script>alert('Seleccione un reporte')</script>");
                            } else {
                                id = Integer.parseInt(request.getParameter("reporte"));
                                java.sql.Date dia = java.sql.Date.valueOf(LocalDate.now());
                                java.util.Date date = new java.util.Date();
                                Timestamp timestamp = new Timestamp(date.getTime());
                                String respuesta = request.getParameter("respuesta");
                                cn2 = conection.conectar();
                                ps2 = cn2.prepareStatement(sql4);
                                cn3 = conection.conectar();
                                ps3 = cn3.prepareStatement(sql3);
                                ps3.setInt(1, id);
                                rs2 = ps3.executeQuery();
                                if (rs2.next()) {
                                    if (rs2.getString(5).equals("En programacion")) {
                                        System.out.println(rs2.getString(5));
                                        ps2.setString(1, "Programacion finalizada");
                                        ps2.setString(2, respuesta);
                                        ps2.setInt(5, id);
                                        ps2.setDate(3, dia);
                                        ps2.setTimestamp(4, timestamp);
                                        ps2.executeUpdate();
                                        //request.getRequestDispatcher("/IngenieroMMain.html").forward(request, response);
                                        out.println("<script>alert('Modificado');</script>");
                                        out.println("<script>");
                                        out.println("(function(){");
                                        out.println("var boton = document.getElementById('jaqui');");
                                        out.println("boton.click();");
                                        out.println("})();");
                                        out.println("</script>");
                                    } else {
                                        out.println("<script>alert('La asignacion se a realizado antes')</script>");
                                        // request.getRequestDispatcher("/IngenieroMMain.html").forward(request, response);
                                    }
                                } else {

                                    out.println("<script>alert('No existe ese reporte')</script>");

                                }
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
        <footer>
            <h2 class="titulo-final">&copy; Speed Experience | Todos los derechos reservados</h2>
        </footer>
    </body>
</html>
