<%@page import="java.time.LocalDate"%>
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
        <script>
            (function(){
                var boton = document.getElementById("boton");
                boton.click();
                alert("hola");
            })();
        </script>
    </head>
    <body>
        <header>
            <nav>

                <a href="Asistente.jsp">Asistente</a>
                <a href="GerenteM.jsp">Gerente de Mantenimiento</a>
                <a href="IngenieroS.jsp">Ingeniero de Soporte</a>
                <a href="Editores.jsp">Editor</a>

                <a href="../SrvUsuarios?accion=cerrar">Cerrar sesión</a>

            </nav>
           
            <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                                                                            style="height: 100%; width: 100%;">
                <path d="M0.00,49.98 C150.00,150.00 349.20,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
                      style="stroke: none; fill: #fff;"></path>
                </svg></div>
        </header>
        <CENTER>
         <section class="textos-header">
                <h1>Gerente de Soporte ${Soporte.usuario}</h1>

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
                                PreparedStatement ps = null;
                                PreparedStatement ps2 = null;
                                PreparedStatement ps3 = null;
                                ResultSet rs = null;
                                ResultSet rs2 = null;
                                try {
                                    String sql = "select * from reporte;";
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
                            String sql5 = ("select * from Reporte;");
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
                    <select id="combito" name="seleccion" class="form-select form-select-sm col-4" aria-label=".form-select-sm example" required> Área a asignar
                        <option style="color: white"  class="textito" selected value="todotonto"> Seleccione el área</option>
                        <option  style="color: white"  class="textito"value="Soporte"> Soporte</option>
                        <option  style="color: white"  class="textito" value="Mantenimiento"> Mantenimiento</option>
                    </select>
                    <br><br>

                    <input class="btn-custom" type="submit" name="modificar" value="Enviar">
                    
                    <br><br><br>
                </form>
                <form method="post" action="GerenteS.jsp">
                    <button type="submit" name="Jaqui" value="Actualizar" class="btn-custom" id="jaqui">Actualizar</button>
                    </form>
                <%
                    if (request.getParameter("modificar") != null) {
                        try {
                            String sql3 = "select * from Reporte where IdReporte = (?)";
                            java.sql.Date dia = java.sql.Date.valueOf(LocalDate.now());
                            java.util.Date date = new java.util.Date();
                            Timestamp timestamp = new Timestamp(date.getTime());
                            String sql4 = "update Reporte set Estatus = (?),IdUsuario = 1,Fecha=(?),Hora=(?) where IdReporte = (?);";
                            int id = 0;
                            if (Integer.parseInt(request.getParameter("reporte")) < 1) {
                            out.println("<script>alert('Seleccione un reporte')</script>");
                            } else {
                            id = Integer.parseInt(request.getParameter("reporte"));
                                String area = request.getParameter("seleccion");
                                cn2 = conection.conectar();
                                ps2 = cn2.prepareStatement(sql4);
                                cn3 = conection.conectar();
                                ps3 = cn3.prepareStatement(sql3);
                                ps3.setInt(1, id);
                                rs2 = ps3.executeQuery();
                                if (rs2.next()) {
                                    if (rs2.getString(5).equals("Abierto") || rs2.getString(5).equals("Mantenimiento finalizado")) {
                                        System.out.println(rs2.getString(5));
                                        if (area.equals("Soporte")) {
                                            ps2.setString(1, "En proceso");
                                            ps2.setInt(4, id);
                                            ps2.setDate(2, dia);
                                            ps2.setTimestamp(3, timestamp);
                                            ps2.executeUpdate();
                                            out.println("<script>alert('Asignado correctamente a soporte')</script>");
                                            //request.getRequestDispatcher("/Soporte/GerenteSMain2.html").forward(request, response);
                                            out.println("<script>");
                                            out.println("(function(){");
                                            out.println("var boton = document.getElementById('jaqui');");
                                            out.println("boton.click();");
                                            out.println("})();");
                                            out.println("</script>");
                                            response.flushBuffer();
                                        } else if (area.equals("Mantenimiento")) {
                                            ps2.setString(1, "En mantenimiento");
                                            ps2.setInt(4, id);
                                            ps2.setDate(2, dia);
                                            ps2.setTimestamp(3, timestamp);
                                            ps2.executeUpdate();
                                            out.println("<script>alert('Asignado correctamente a mantenimiento')</script>");
                                            //RequestDispatcher dispatcher = request.getRequestDispatcher("/Soporte/GerenteSMain2.html");
                                            //dispatcher.forward(request, response);
                                            out.println("<script>");
                                            out.println("(function(){");
                                            out.println("var boton = document.getElementById('jaqui');");
                                            out.println("boton.click();");
                                            out.println("})();");
                                            out.println("</script>");
                                            response.flushBuffer();

                                        } else if (area.equals("todotonto")) {
                                            out.println("<script>alert('Ingrese un área')</script>");
                                            
                                        } else {
                                            out.println("<script>alert('Trono')</script>");

                                           // RequestDispatcher dispatcher = request.getRequestDispatcher("/Soporte/GerenteSMain2.html");
                                            //dispatcher.forward(request, response);

                                            response.flushBuffer();
                                        }
                                    } else {
                                        out.println("<script>alert('La asignacion se ha realizado antes')</script>");
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
               <!-- <script>
            (function(){
                var boton = document.getElementById("jaqui");
                boton.click();
               
            })();
        </script>-->
    </body>
</html>
