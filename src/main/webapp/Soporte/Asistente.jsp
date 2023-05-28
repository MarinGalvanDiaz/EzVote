<%-- 
    Document   : Asistente
    Created on : 31 mar 2023, 22:19:23
    Author     : chang
--%>
<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="Controlador.Correo"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.*"%>
<%@page import="Modelo.Conexion"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<%
    //Soporte sop = new Soporte();
    //System.out.println(sop.getIdSoporte());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            </nav>
           
            <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                                                                            style="height: 100%; width: 100%;">
                <path d="M0.00,49.98 C150.00,150.00 349.20,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
                      style="stroke: none; fill: #fff;"></path>
                </svg></div>
       </header>
         <CENTER>
        <section class="textos-header">
                <h1> Asistente ${Soporte.usuario}</h1>
              
        </section>
             <br><br>   
        
        
   
        
        <form action="" method="post">
            <select id="usuario" name="Usuario" required>
                <option value="todotonto" selected>Seleccione un usuario</option>
                
           <%
                Conexion conection = new Conexion();
                String usuario2=null;
                Connection cn3 = null;
                PreparedStatement ps3 = null;
                ResultSet rs2 = null;
                String sql3 = ("select identificador from Usuarios;");
                try {
                        cn3 = conection.conectar();
                        ps3 = cn3.prepareStatement(sql3);
                        rs2= ps3.executeQuery();
                        while(rs2.next()){
                         usuario2 = rs2.getString(1);
                    %>
            
                    <option value="<%=usuario2%>"><%=rs2.getString(1)%></option>
                
            
<%
    }
} catch (Exception e) {
out.println(e.getMessage());
ps3.close();
cn3.close();
                    }
        %>
</select>
            <BR><BR><BR><BR>
            <input style="color:white" type="text" name="Reporte" class="textito" placeholder="Ingrese el reporte" required pattern="[A-Za-z]{2-15}" title="Ingrese el reporte"> 
            <BR><BR><BR>
            <input type="hidden" name="Asistente" value=${Usuarios.id}>
                   
            <button type="submit" class="btn-custom" name="subir" value="subir">Guardar</button>
            <a href="#">${msje}</a>
         
        </form>
          
        <BR><BR>
        <BR><BR>
    </CENTER>
        <%
            if (request.getParameter("subir") != null) {
                
                String usuario = " ";
                if(request.getParameter("Usuario").equals("todotonto")){
                out.println("<script>alert('Seleccione un usuario')</script>");
            }else{
                usuario = request.getParameter("Usuario");
                Connection cn = null;
                Connection cn2 = null;
                PreparedStatement ps = null;
                PreparedStatement ps2 = null;
                ResultSet rs = null;
                String sql2 = "insert into Reporte values(default,(?),(?),(?),(?),(?),(?),(?))";

                String reporte = request.getParameter("Reporte");
                System.out.println(reporte);
                //int asistente = Integer.parseInt(request.getParameter("Asistente"));
                //System.out.println(asistente);
                java.sql.Date dia = java.sql.Date.valueOf(LocalDate.now());
                java.util.Date date = new java.util.Date();
                Timestamp timestamp = new Timestamp(date.getTime());
                String sql = "select idUsuario from Usuarios where identificador=(?);";
                try {

                    cn = conection.conectar();
                    ps = cn.prepareStatement(sql);
                    ps.setString(1, usuario);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        int idusu = rs.getInt(1);
                        System.out.println(idusu);
                        cn2 = conection.conectar();
                        ps2 = cn2.prepareStatement(sql2);
                        ps2.setString(1, reporte);
                        ps2.setTimestamp(2, timestamp);
                        ps2.setDate(3, dia);
                        ps2.setString(4, "Abierto");
                        ps2.setInt(5, idusu);
                        ps2.setInt(6, 3);
                        ps2.setString(7, " ");
                        ps2.executeUpdate();
                        request.setAttribute("msje", "Reporte guardado");
                        //request.getRequestDispatcher("/Soporte/GerenteSMain2.html").forward(request, response);

                    } else {
                        System.out.println("No se que paso xd");
                        request.setAttribute("msje", "Usuario no encontrado");
                        //request.getRequestDispatcher("/Asistente.jsp").forward(request, response);
                    }

                } catch (Exception e) {
                    System.out.println("Error" + e.getMessage());
                }
            }
            }

        %>
    <center>
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
                               
                                String usuario = request.getParameter("Usuario");
                                Connection cn5 = null;
                               
                               
                                
                                PreparedStatement ps5 = null;
                               
                                ResultSet rs5 = null;
                              
                                try {
                                    String sql5 = "select * from reporte where Estatus='Abierto';";
                                    cn5 = conection.conectar();
                                    ps5 = cn5.prepareStatement(sql5);

                                    rs5 = ps5.executeQuery();

                                    while (rs5.next()) {
                            %>
                    </tr>
                    <tr>

                        <td align="center"><%=rs5.getInt(1)%></td>
                        <td align="center"><%=rs5.getString(2)%></td>
                        <td align="center"><%=rs5.getTime(3)%></td>
                        <td align="center"><%=rs5.getDate(4)%></td>
                        <td align="center"><%=rs5.getString(5)%></td>
                        <td align="center"><%=rs5.getInt(6)%></td>
                        <td align="center"><%=rs5.getInt(7)%></td>
                        <td align="center"><%=rs5.getString(8)%></td>

                    </tr>


                    <%
                            }
                            ps5.close();
                            cn5.close();
                        } catch (SQLException error) {
                            out.print(error.toString());
                        }
                    %>
                </table>
                <br><br><br>
                 
                
                <br><br><br>
    </center>
    </body>
</html>