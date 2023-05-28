<%-- 
    Document   : Mensaje
    Created on : 28 may 2023, 01:22:44
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>Ops...</title>
    </head>
    <body>
        <%
            
            out.print("<script>");
            out.print("swal('Ha ocurrido un problema!','Usuario o contraseña incorrectos o invalidados',{");
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
            out.print("window.location.href = 'Login.jsp';");
            out.print("break;");
            out.print("default:");
            out.print("window.location.href = 'Login.jsp';");
            out.print("}");
            out.print("});");
            out.print("</script>");
        %>
    </body>
</html>