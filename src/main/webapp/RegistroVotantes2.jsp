<%-- 
    Document   : RegistroVotantes2
    Created on : 29 may 2023, 12:22:24
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.*"%>

<%@page import="org.apache.poi.ss.usermodel.*" %>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
        Conexion con = new Conexion();

        byte[] archivo = null;

        int idUsu2 = 0;
        String opcon = null;
        Connection cn2 = null;
        PreparedStatement ps2 = null;
        String sql4 = "insert into votantes values(default,(?),(?));";

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
                    if (name.equals("usuario")) {
                        idUsu2 = Integer.parseInt(value);

                    } else if (name.equals("opcon")) {
                        opcon = value;

                    }
                } else {
                    // Si el elemento es un archivo
                    String fieldName = item.getFieldName();
                    String fileName = item.getName();
                    String contentType = item.getContentType();
                    boolean isInMemory = item.isInMemory();
                    long sizeInBytes = item.getSize();
                    if (sizeInBytes > 0 && fieldName.equals("Archivo")) {
                        InputStream inputStream = item.getInputStream();
                        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                        byte[] buffer = new byte[4096];
                        int bytesRead = -1;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, bytesRead);
                        }
                        archivo = outputStream.toByteArray();
                        outputStream.close();
                        inputStream.close();
                    }
                }
            }
            if (opcon.equals("Subir")) {
                System.out.println("Llega?");
                Connection cn3 = con.conectar();
                PreparedStatement ps3 = cn3.prepareStatement(sql4);
                ps3.setBytes(1, archivo);
                ps3.setInt(2, idUsu2);

                ps3.executeUpdate();

                Connection cn5 = con.conectar();
                PreparedStatement ps5 = cn5.prepareStatement("Select archivo from votantes where idUsuario = (?);");
                ps5.setInt(1, idUsu2);
                ResultSet rs5 = ps5.executeQuery();
                if (rs5.next()) {

                    try {
                        // Ruta del archivo Excel
                        byte[] fileBytes = rs5.getBytes(1);
                        String link = "\"data:.xlsx;base64," + DatatypeConverter.printBase64Binary(fileBytes) + "\"";

                        // Cargar el archivo Excel
                        FileInputStream fis = new FileInputStream(link);
                        Workbook workbook = new XSSFWorkbook(fis);

                        // Obtener la primera hoja del archivo
                        Sheet sheet = workbook.getSheetAt(0);

                        // Iterar sobre las filas de la hoja
                        for (Row row : sheet) {
                            // Iterar sobre las celdas de la fila
                            for (Cell cell : row) {
                                // Obtener el valor de la celda
                                String cellValue = "";
                                if (cell.getCellType() == CellType.STRING) {
                                    cellValue = cell.getStringCellValue();
                                } else if (cell.getCellType() == CellType.NUMERIC) {
                                    cellValue = String.valueOf(cell.getNumericCellValue());
                                }

                                // Hacer algo con el valor de la celda
                                out.println(cellValue);
                            }
                        }

                        // Cerrar el archivo
                        workbook.close();
                        fis.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
                    out.println("No se encontró el archivo en la base de datos.");
                }
                out.print("<script>");
                out.print("swal('Cambios guardados!',{");
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
                out.print("window.location.href = 'VerificarCandidato.jsp';");
                out.print("break;");
                out.print("default:");
                out.print("window.location.href = 'VerificarCandidato.jsp';");
                out.print("}");
                out.print("});");
                out.print("</script>");

            }

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
