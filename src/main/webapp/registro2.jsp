<%-- 
    Document   : registro2
    Created on : 17/10/2022, 10:23:58 PM
    Author     : chang
--%>

<%@page import="Modelo.Conexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.sql.*"%>

<%@page import="java.io.*"%>
<%@page import="org.apache.commons.fileupload.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href = "https://fonts.googleapis.com/css2?family=Open+Sans" rel="stylesheet" type="text/css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        
            Conexion conection = new Conexion();
           
            
            String nombre = request.getParameter("txtusu");
            String contra = request.getParameter("txtcontra");;
            String repcontra = request.getParameter("txtrepetircontra");;
            String email = request.getParameter("email");;
           
            
            Connection cn = null;
            Connection cn2 = null;
            PreparedStatement st = null;
            PreparedStatement st2 = null;
            ResultSet rs = null;
            
String sql1 = "Select * from Usuarios where identificador = (?)";
String sql2 = "Insert into Usuarios values(default,(?),(?),(?),8,0)";

cn = conection.conectar();
st = cn.prepareStatement(sql1);
st.setString(1, nombre);
rs = st.executeQuery();
if(rs.next()){
out.print("<script>");
            out.print("swal('Cuidado!','El nombre de usuario ya esta en uso, si es usted, probablemente esté en proceso de validacion',{");
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
            out.print("window.location.href = 'Registro.jsp';");
            out.print("break;");
            out.print("default:");
            out.print("window.location.href = 'Registro.jsp';");
            out.print("}");
            out.print("});");
            out.print("</script>");
            }else{
            if(contra.equals(repcontra)){
            cn2 = conection.conectar();
            st2 = cn2.prepareCall(sql2);
            st2.setString(1, nombre);
            st2.setString(2, contra);
            st2.setString(3, email);
            st2.executeUpdate();
            out.print("<script>");
            out.print("swal('Bienvenido!','Su cuenta esta dada de alta, y pasará por un proceos de validación, se le notificará cuando se active',{");
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
            out.print("window.location.href = 'Login.jsp';");
            out.print("break;");
            out.print("default:");
            out.print("window.location.href = 'Login.jsp';");
            out.print("}");
            out.print("});");
            out.print("</script>");
            }else{
             out.print("<script>");
            out.print("swal('Cuidado!','La contraseña no coincide',{");
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
            out.print("window.location.href = 'Registro.jsp';");
            out.print("break;");
            out.print("default:");
            out.print("window.location.href = 'Registro.jsp';");
            out.print("}");
            out.print("});");
            out.print("</script>");
            }
           
            }
            
            
        %>
   
    </body>
</html>
