<%-- 
    Document   : GuardarCandidatura
    Created on : 9 may 2023, 08:21:03
    Author     : alumno
--%>

<%@page import="Modelo.Conexion"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Conexion con = new Conexion();

            byte[] imagen = null;
            String descripcion = null;
            String objetivos = null;
            byte[] video = null;
            int idUsu2 = 0;
            String opcon = null;
            Connection cn2 = null;
            PreparedStatement ps2 = null;
            String sql2 = "insert into candidatura values(default,(?),(?),(?),(?),(?));";

            try {

                DiskFileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> items = upload.parseRequest(request);
                Iterator<FileItem> iter = items.iterator();
                while (iter.hasNext()) {
                    FileItem item = iter.next();

                    if (item.isFormField()) {
                        // Si el elemento es un campo de texto
                        String name = item.getFieldName();
                        String value = item.getString();
                        if (name.equals("descripcion")) {
                            descripcion = value;
                        } else if (name.equals("objetivos")) {
                            objetivos = value;
                        } else if (name.equals("usuario")) {
                            idUsu2 = Integer.parseInt(value);

                        }else if (name.equals("opcon")) {
                            opcon = value;

                        }
                    } else {
                        // Si el elemento es un archivo
                        String fieldName = item.getFieldName();
                        String fileName = item.getName();
                        String contentType = item.getContentType();
                        boolean isInMemory = item.isInMemory();
                        long sizeInBytes = item.getSize();
                        if (sizeInBytes > 0 && fieldName.equals("foto")) {
                            InputStream inputStream = item.getInputStream();
                            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                            byte[] buffer = new byte[4096];
                            int bytesRead = -1;
                            while ((bytesRead = inputStream.read(buffer)) != -1) {
                                outputStream.write(buffer, 0, bytesRead);
                            }
                            imagen = outputStream.toByteArray();
                            outputStream.close();
                            inputStream.close();
                        } else if (sizeInBytes > 0 && fieldName.equals("video")) {
                            InputStream inputStream = item.getInputStream();
                            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                            byte[] buffer = new byte[4096];
                            int bytesRead = -1;
                            while ((bytesRead = inputStream.read(buffer)) != -1) {
                                outputStream.write(buffer, 0, bytesRead);
                            }
                            video = outputStream.toByteArray();
                            outputStream.close();
                            inputStream.close();
                        }
                    }
                }
                if (opcon.equals("Guardar")) {
                    cn2 = con.conectar();
                    ps2 = cn2.prepareStatement(sql2);
                    ps2.setBytes(1, imagen);
                    ps2.setString(2, descripcion);
                    ps2.setString(3, objetivos);
                    ps2.setBytes(4, video);
                    ps2.setInt(5, idUsu2);
                    ps2.executeUpdate();
                } else if (opcon.equals("Actualizar")) {
                    cn2 = con.conectar();
                    String sql3 = "update candidatura set foto=(?),descripcion=(?),objetivos=(?),video=(?) where idUsuario = (?);";
                    ps2 = cn2.prepareStatement(sql3);
                    ps2.setBytes(1, imagen);
                    ps2.setString(2, descripcion);
                    ps2.setString(3, objetivos);
                    ps2.setBytes(4, video);
                    ps2.setInt(5, idUsu2);
                    ps2.executeUpdate();
                }
                request.getRequestDispatcher("/VerificarCandidato.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error" + e.getMessage());
                out.println(e.getMessage());
            } finally {

                if (ps2 != null && ps2.isClosed() == false) {
                    ps2.close();
                }
                ps2 = null;

                if (cn2 != null && cn2.isClosed() == false) {
                    cn2.close();
                }
                cn2 = null;
            }

        %>
    </body>
</html>
