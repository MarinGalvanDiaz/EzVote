/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Usuarios;
import Modelo.VerifUsuarios;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alumno
 */
@WebServlet(name = "SrvUsuarios", urlPatterns = {"/SrvUsuarios"})
public class SrvUsuarios extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        try {
            if (accion != null) {
                switch (accion) {
                    case "verificar":
                        verificar(request, response);
                        break;
                    case "cerrar":
                        cerrarsession(request, response);
                    default:
                        response.sendRedirect("Soporte/loginSoporte.jsp");
                }
            } else {
                response.sendRedirect("Soporte/loginSoporte.jsp");
            }
        } catch (Exception e) {
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("/mensaje").forward(request, response);

            } catch (Exception ex) {
                System.out.println("Error" + ex.getMessage());
            }
        }
    }

    private void verificar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession sesion;
        VerifUsuarios dao;
        Usuarios usuario;
        usuario = this.obtenerUsuario(request);
        sesion = request.getSession();
        dao = new VerifUsuarios();
        usuario = dao.identificar(usuario);
        if (usuario != null && usuario.getCargo() == 1 && usuario.getEstado() == 1) {

            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            request.getSession().setAttribute("IdUsuario", usuario.getId());
            System.out.println(usuario.getId());
            System.out.println("GerentinS");
            
            request.getSession().setAttribute("liga", "Soporte/GerenteSMain.html");
            response.sendRedirect("Bienvenida.jsp");
        } else if (usuario != null && usuario.getCargo() == 3 && usuario.getEstado() == 1) {

            sesion.setAttribute("Usuarios", usuario);
            System.out.println(usuario.getId());
            request.setAttribute("msje", "Bienvenido al sistema");
            request.getSession().setAttribute("IdUsuario", usuario.getId());
            System.out.println("Asistente");
            
            request.getSession().setAttribute("liga", "Soporte/AsistenteMain.html");
            response.sendRedirect("Bienvenida.jsp");
        } else if (usuario != null && usuario.getCargo() == 2 && usuario.getEstado() == 1) {

            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            request.getSession().setAttribute("IdUsuario", usuario.getId());
            System.out.println("GerentinM");
             request.getSession().setAttribute("liga", "Soporte/GerenteMMain.html");
            response.sendRedirect("Bienvenida.jsp");
        } else if (usuario != null && usuario.getCargo() == 5 && usuario.getEstado() == 1) {

            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            request.getSession().setAttribute("IdUsuario", usuario.getId());
            System.out.println("IngeSoporte");
             request.getSession().setAttribute("liga", "Soporte/IngenieroSMain.html");
            response.sendRedirect("Bienvenida.jsp");
        } else if (usuario != null && usuario.getCargo() == 4 && usuario.getEstado() == 1) {

            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            request.getSession().setAttribute("IdUsuario", usuario.getId());
            System.out.println("IngeMante");
             request.getSession().setAttribute("liga", "Soporte/IngenieroMMain.html");
            response.sendRedirect("Bienvenida.jsp");
        } else if (usuario != null && usuario.getCargo() == 6 && usuario.getEstado() == 1) {

            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            request.getSession().setAttribute("IdUsuario", usuario.getId());
            System.out.println("Editor");
             request.getSession().setAttribute("liga", "Soporte/EditorMain2.html");
            response.sendRedirect("Bienvenida.jsp");
        } else if (usuario != null && usuario.getCargo() == 7 && usuario.getEstado() == 1) {

            sesion.setAttribute("Usuarios", usuario);
            request.getSession().setAttribute("IdUsuario", usuario.getId());
            request.setAttribute("msje", "Bienvenido al sistema");
            System.out.println("Votante");
            request.getSession().setAttribute("liga", "Tarjetas.jsp");
            response.sendRedirect("Bienvenida.jsp");
        } else if (usuario != null && usuario.getCargo() == 8 && usuario.getEstado() == 1) {

            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            request.getSession().setAttribute("IdUsuario", usuario.getId());
            System.out.println("Candidato");
            request.getSession().setAttribute("liga", "VerificarCandidato.jsp");
            response.sendRedirect("Bienvenida.jsp");
        } else if (usuario != null && usuario.getCargo() == 9 && usuario.getEstado() == 1) {

            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            request.getSession().setAttribute("IdUsuario", usuario.getId());
            System.out.println("Admin");
            request.getSession().setAttribute("liga", "Admin.jsp");
            response.sendRedirect("Bienvenida.jsp");
        } else {
            request.setAttribute("msje", "Credenciales Incorrectas");
            response.sendRedirect("Mensaje.jsp");
        }
    }

    private void cerrarsession(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession sesion = request.getSession();
        sesion.setAttribute("Usuarios", null);
        sesion.invalidate();
        response.sendRedirect("Login.jsp");
    }

    private Usuarios obtenerUsuario(HttpServletRequest request) {
        Usuarios u = new Usuarios();
        u.setIdentificador(request.getParameter("txtusu"));
        u.setContrasenia(request.getParameter("txtcontra"));
        return u;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
