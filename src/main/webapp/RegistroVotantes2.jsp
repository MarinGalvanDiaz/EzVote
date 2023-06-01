<%-- 
    Document   : RegistroVotantes2
    Created on : 29 may 2023, 12:22:24
    Author     : chang
--%>

<%@page import="Controlador.Correo"%>
<%@page import="Controlador.Formatear"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="Controlador.GeneradorContraseñas"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/Loader.css">
        <script>
             document.onreadystatechange = function() {
            if (document.readyState !== "complete") {
                document.querySelector(
                  "body").style.visibility = "hidden";
                document.querySelector(
                  "#spinner").style.visibility = "visible";
            } else {
                document.querySelector(
                  "#spinner").style.display = "none";
                document.querySelector(
                  "body").style.visibility = "visible";
            }
        };
        </script>
    </head>
    <body>
<div class="inline">
        <div  class="center">
        <%

            Conexion con = new Conexion();
            GeneradorContraseñas generar = new GeneradorContraseñas();
            Formatear formato = new Formatear();
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

                        // Ruta del archivo Excel
                        Blob blob = rs5.getBlob(1);
                        InputStream inputStream = blob.getBinaryStream();

                        // Leer el archivo Excel
                        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
                        XSSFSheet sheet = workbook.getSheetAt(0); // Obtener la primera hoja de cálculo

                        int totalFilas = sheet.getLastRowNum() + 1;
                        for (int i = 0; i < totalFilas; i++) {
                            Row firstRow = sheet.getRow(i); // Obtener la primera fila        

                            ArrayList<String> lista = new ArrayList<>();
                            for (Cell cell : firstRow) {
                                String cellValue = "";
                                if (cell != null) {
                                    switch (cell.getCellType()) {
                                        case STRING:
                                            cellValue = cell.getStringCellValue();
                                            break;
                                        case NUMERIC:
                                            cellValue = String.valueOf(cell.getNumericCellValue());
                                            break;
                                        case BOOLEAN:
                                            cellValue = String.valueOf(cell.getBooleanCellValue());
                                            break;
                                        // Agregar más casos según sea necesario para otros tipos de celda
                                    }
                                } else {
                                    out.print("<script>");
                                    out.print("swal('Cuidado!','Ingrese un archivo de excel que cumpla con el formato',{");
                                    out.print("icon: 'warning',");
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
                                    out.print("window.location.href = 'RegistroVotantes.jsp';");
                                    out.print("break;");
                                    out.print("default:");
                                    out.print("window.location.href = 'RegistroVotantes.jsp';");
                                    out.print("}");
                                    out.print("});");
                                    out.print("</script>");
                                }

                                lista.add(cellValue);
                                System.out.println(lista);
                            }
                            Connection cn6 = con.conectar();
                            PreparedStatement ps6 = cn6.prepareStatement("Insert into Usuarios values(default,(?),(?),(?),7,1);");

                            String contra = generar.generarContraseña(10);
                            String formateado = formato.formatear(lista.get(0));
                            Connection cn7 = con.conectar();
                            PreparedStatement ps7 = cn7.prepareStatement("Select * from Usuarios where identificador = (?);");
                            ps7.setString(1, formateado);
                            ResultSet rs7 = ps7.executeQuery();
                            if (rs7.next()) {
                                out.print("<script>");
                                out.print("swal('Cuidado!','El usuario " + formateado + " esta duplicado, modifique su excel',{");
                                out.print("icon: 'warning',");
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
                                out.print("window.location.href = 'Admin.jsp';");
                                out.print("break;");
                                out.print("default:");
                                out.print("window.location.href = 'Admin.jsp';");
                                out.print("}");
                                out.print("});");
                                out.print("</script>");
                            } else {
                                ps6.setString(1, formateado);
                                ps6.setString(2, contra);
                                ps6.setString(3, lista.get(1));
                                ps6.executeUpdate();
                                cn6.close();
                                ps6.close();

                                //out.println("Valor de celda: " + cellValue);
                                String host = "smtp.gmail.com";
                                String port = "465";
                                String username = "speedexperienceexp@gmail.com";
                                String password = "kwkgaogbmuzeoutp";
                                boolean sslEnabled = true;

                                Correo sender = new Correo(host, port, username, password, sslEnabled);

                                String to = lista.get(1);
                                String subject = "Bienvenido" + "\n" + "Se te ha dado de alta en EzVote";
                                String message = "Tu usuario es: " + formateado + "\n" + "Tu contraseña es: " + contra;

                                lista.clear();
                                try {
                                    sender.sendEmail(to, subject, message);
                                    System.out.println("Correo electrónico enviado con éxito.");
                                } catch (Exception ex) {
                                    System.out.println("Error al enviar el correo electrónico: " + ex.getMessage());
                                }

                                // Cerrar recursos
                                workbook.close();
                                inputStream.close();
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
                                out.print("window.location.href = 'Votantes.jsp';");
                                out.print("break;");
                                out.print("default:");
                                out.print("window.location.href = 'Votantes.jsp';");
                                out.print("}");
                                out.print("});");
                            }
                            out.print("</script>");
                        }
                    } else {
                        out.println("No se encontró el archivo en la base de datos.");
                    }

                }

            } catch (Exception e) {
                System.out.println("Error" + e.getMessage());

                out.print("<script>");
                out.print("swal('Cuidado!','Ingrese un archivo de excel que cumpla con el formato o compruebe que no se repita un votante',{");
                out.print("icon: 'warning',");
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
                out.print("window.location.href = 'RegistroVotantes.jsp';");
                out.print("break;");
                out.print("default:");
                out.print("window.location.href = 'RegistroVotantes.jsp';");
                out.print("}");
                out.print("});");
                out.print("</script>");
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
    </div>
  
           <p class="spinner" id="spinner"><i class="fa fa-spinner fa-5x"></i></p>
    </div>

</body>
</html>
