<%-- 
    Document   : VerificarCandidato
    Created on : 9 may 2023, 07:39:03
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuarios"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <body>
       
        
        <form action="Candidato.jsp" method="post" name="formu1" id="formu1">
            <input type="hidden" name="Usuario" value="${Usuarios.id}">
        </form>
        
        <script>
document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('formu1');
  
  // Envía el formulario automáticamente
  form.submit();
});
</script>
   
         
    </body>
</html>
