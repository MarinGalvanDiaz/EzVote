<%-- 
    Document   : Bienvenida
    Created on : 28 may 2023, 00:38:19
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>Bienvenido</title>
        <link rel="shortcut icon" href="LogoEzVote_sinfondo.png" type="image/x-icon">
    </head>
    <body>
        <%
            String liga = (String) session.getAttribute("liga");
            out.print("<script>");
            out.print("swal('Bienvenido al sistema!',{");
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
            out.print("window.location.href = '"+liga+"';");
            out.print("break;");
            out.print("default:");
            out.print("window.location.href = '"+liga+"';");
            out.print("}");
            out.print("});");
            out.print("</script>");
        %>
    </body>
</html>
