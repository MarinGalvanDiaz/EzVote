<%@page import="java.time.LocalDate"%>
<%@page import="Controlador.Correo"%>
<%@page import="Modelo.Conexion"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
            function recargar() {
                setTimeout(function () {
                    // Recargar la página actual
                    location.reload();
                }, 3000);
            }

        </script>

    </head>
    <body>
        <header>
            <nav>
                <a href="GerenteS.jsp">Gerente de Soporte</a>
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
                <h1>Ingeniero de Soporte</h1>

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
                        <th>Id Usuario</th>
                        <th>Id Encargado</th>
                        <th>Respuesta</th>
                            <%
                                response.setBufferSize(8192 * 16);
                                response.flushBuffer();
                                String redirecciona = "/Soporte/IngenieroS2Main.html";
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
                                    String sql = "select * from reporte where Estatus = 'En proceso' or Estatus = 'Solucionado' or Estatus = 'Cerrado' or Estatus = 'Solucionado';";
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
                    <div>
                        <select id="usuario" name="Reporte" required onchange="actualizar()">
                            <option value="todotonto" selected>Seleccione un Reporte</option>

                            <%
                                String usuario2 = null;

                                String respuesta22 = null;
                                Connection cn7 = null;
                                PreparedStatement ps7 = null;
                                ResultSet rs7 = null;
                                String sql7 = ("select * from Reporte where Estatus='En proceso' or Estatus='Solucionado';");
                                try {
                                    cn7 = conection.conectar();
                                    ps7 = cn7.prepareStatement(sql7);
                                    rs7 = ps7.executeQuery();
                                    while (rs7.next()) {
                                        usuario2 = rs7.getString(1);

                                        respuesta22 = rs7.getString(8);
                            %>

                            <option value="<%=usuario2%>"><%=rs7.getString(1)%></option>

                        
                        <%
                                }
                            } catch (Exception e) {
                                out.println(e.getMessage());
                                ps7.close();
                                cn7.close();
                            }
                        %>
                        </select>


                        <input type="hidden" name="respuestaobt" id="respuestaobt" value="<%=respuesta22%>"> 
                    </div>
                    <br>
                    <p>Respuesta</p>
                    <br>
                    <input style="color: white"  class="textito" type="text" name="respuesta" id="respuesta" placeholder="Dejar en blanco si ya esta resuelto" value="">
                    <br><br>

                    <input class="btn-custom" type="submit" name="modificar" required title="Responder" value="Responder">
                    <input class="btn-custom" type="submit" name="comunicar" required title="Comunicar" value="Comunicar">

                    <br><br><br>

                </form>
                <br><br>

                <form method="post" action="IngenieroS.jsp">
                    <input type="submit" name="Jaqui" value="Actualizar" class="btn-custom" id="jaqui">
                </form>
                <%
                    if (request.getParameter("modificar") != null) {
                        try {
                            String sql3 = "select * from Reporte where IdReporte = (?)";
                            String sql4 = "update Reporte set Estatus = (?),IdUsuario = 5,Respuesta =(?),Fecha=(?),Hora=(?) where IdReporte = (?);";
                            //int id = Integer.parseInt(request.getParameter("reporte"));
                            int id = 0;
                            if (request.getParameter("Reporte").equals("todotonto")) {
                                out.println("<script>alert('Seleccione un usuario')</script>");
                            } else {
                                id = Integer.parseInt(request.getParameter("Reporte"));
                                java.sql.Date dia = java.sql.Date.valueOf(LocalDate.now());
                                java.util.Date date = new java.util.Date();
                                Timestamp timestamp = new Timestamp(date.getTime());
                                String respuesta2 = " ";

                                System.out.println("Aqui la prueba");
                                System.out.println("respuesta");
                                System.out.println("si jalo");
                                cn2 = conection.conectar();
                                ps2 = cn2.prepareStatement(sql4);
                                cn3 = conection.conectar();
                                ps3 = cn3.prepareStatement(sql3);
                                ps3.setInt(1, id);
                                rs2 = ps3.executeQuery();
                                int condicion = 0;
                                if (rs2.next()) {
                                    System.out.println("aver" + rs2.getString(8));
                                    if (rs2.getString(8).equals(" ")) {
                                        System.out.println("if caso 1");
                                        System.out.println(request.getParameter("respuesta"));
                                        if (request.getParameter("respuesta").equals("") || request.getParameter("respuesta").equals(" ")) {
                                            System.out.println("Si entro");
                                            condicion = 0;

                %>


                <%                                                 out.println("<script>alert('Ingrese una respuesta')</script>");

                        } else {
                            System.out.println("Valio madres");
                            System.out.println(request.getParameter("respuesta"));
                            respuesta2 = request.getParameter("respuesta");
                            condicion = 1;
                        }

                    } else {
                        respuesta2 = rs2.getString(8);
                        System.out.println("if else");
                        condicion = 1;
                    }
                    if (condicion == 1) {
                        System.out.println(rs2.getString(8));
                        if (rs2.getString(5).equals("En proceso")) {
                            System.out.println(rs2.getString(5));
                            ps2.setString(1, "Solucionado");
                            ps2.setString(2, respuesta2);
                            ps2.setDate(3, dia);
                            ps2.setTimestamp(4, timestamp);
                            ps2.setInt(5, id);
                            ps2.executeUpdate();%>

                <%
                                        out.println("<script>alert('Respuesta registrada')</script>");
                                        out.println("<script>");
                                        out.println("(function(){");
                                        out.println("var boton = document.getElementById('jaqui');");
                                        out.println("boton.click();");
                                        out.println("})();");
                                        out.println("</script>");

                                        response.flushBuffer();
                                    } else {
                                        out.println("<script>alert('La asignacion se a realizado antes')</script>");

                                    }
                                } else {

                                }
                            } else {
                                System.out.println(rs2.getString(5));
                                out.println("<script>alert('No existe ese reporte')</script>");
                            }

                        }
                    } catch (SQLException error) {
                        out.print(error.toString());
                    }

                } else if (request.getParameter("comunicar") != null) {
                    System.out.println("comunicando");

                    //int id = Integer.parseInt(request.getParameter("reporte"));
                    int id = 0;
                    if (request.getParameter("Reporte").equals("todotonto")) {
                        out.println("<script>alert('Seleccione un usuario')</script>");
                    } else {
                        id = Integer.parseInt(request.getParameter("Reporte"));
                        Connection cn5 = conection.conectar();
                        PreparedStatement ps5 = cn5.prepareStatement("Select * from Reporte where IdReporte = (?)");
                        ps5.setInt(1, id);
                        ResultSet rs5 = ps5.executeQuery();
                        if (rs5.next()) {
                            if (rs5.getString(5).equals("Solucionado")) {
                                cn3 = conection.conectar();

                                int idusu = rs5.getInt(6);
                                System.out.println(idusu);

                                ps4 = cn3.prepareStatement("select Email_cliente from cliente where Id_cliente = (?);");
                                ps4.setInt(1, idusu);
                                rs3 = ps4.executeQuery();

                                if (rs3.next()) {
                                    System.out.println("El correo es: " + rs3.getString(1));
                                    String host = "smtp.gmail.com";
                                    String port = "465";
                                    String username = "speedexperienceexp@gmail.com";
                                    String password = "kwkgaogbmuzeoutp";
                                    boolean sslEnabled = true;

                                    Correo sender = new Correo(host, port, username, password, sslEnabled);

                                    String to = rs3.getString(1);
                                    System.out.println(rs3.getString(1));
                                    String subject = "Respuesta al reporte: " + rs5.getString(2);
                                    System.out.println(rs5.getString(2));
                                    String message = rs5.getString(8);

                                    try {
                                        sender.sendEmail(to, subject, message);
                                        System.out.println("Correo electrónico enviado con éxito.");
                                    } catch (Exception ex) {
                                        System.out.println("Error al enviar el correo electrónico: " + ex.getMessage());
                                    }
                                }
                                Connection cn6 = conection.conectar();
                                PreparedStatement ps6 = cn6.prepareStatement("update Reporte set Estatus = 'Cerrado' where IdReporte = (?);");
                                ps6.setInt(1, id);
                                ps6.executeUpdate();%>

                <%
                                    out.println("<script>alert('Solucion comunicada al cliente')</script>");
                                    out.println("<script>");
                                    out.println("(function(){");
                                    out.println("var boton = document.getElementById('jaqui');");
                                    out.println("boton.click();");
                                    out.println("})();");
                                    out.println("</script>");
                                } else {
                                    out.println("<script>alert('El reporte aun no ha sido solucionado o ha sido comunicado previamente')</script>");
                                }
                            } else {

                                out.println("<script>alert('Reporte no existe')</script>");
                            }
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
                 <script>

            function actualizar() {

                var usuario = document.getElementById("usuario");
               
                var respuesta = document.getElementById("respuesta");


                if (usuario.value !== "todotonto") {
                    var respuesta2 = document.getElementById("respuestaobt").value;
                    respuesta.value = respuesta2;
                    alert('Respuesta pre rellenada');
                } else {
                    alert("Seleccione un reporte");
                }
            }
        </script>
        <footer>
            <h2 class="titulo-final">&copy; Speed Experience | Todos los derechos reservados</h2>
        </footer>
        
    </body>
</html>
