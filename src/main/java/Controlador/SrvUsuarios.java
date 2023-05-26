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
        if (usuario != null && usuario.getCargo()==1) {
            
            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            System.out.println(usuario.getId());
            System.out.println("GerentinS");
            this.getServletConfig().getServletContext().getRequestDispatcher("/Soporte/GerenteSMain.html").forward(request, response);

        } else if (usuario != null && usuario.getCargo()==3) {
           
            sesion.setAttribute("Usuarios", usuario);
            System.out.println(usuario.getId());
            request.setAttribute("msje", "Bienvenido al sistema");
            System.out.println("Asistente");
            this.getServletConfig().getServletContext().getRequestDispatcher("/Soporte/AsistenteMain.html").forward(request, response);
        } else if (usuario != null && usuario.getCargo()==2) {
            
            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            System.out.println("GerentinM");
            this.getServletConfig().getServletContext().getRequestDispatcher("/Soporte/GerenteMMain.htmlp").forward(request, response);
        } else if (usuario != null && usuario.getCargo()==5) {
            
            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            System.out.println("IngeSoporte");
            this.getServletConfig().getServletContext().getRequestDispatcher("/Soporte/IngenieroSMain.html").forward(request, response);
        } else if (usuario != null && usuario.getCargo()==4) {
           
            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            System.out.println("IngeMante");
            this.getServletConfig().getServletContext().getRequestDispatcher("/Soporte/IngenieroMMain.html").forward(request, response);
        } else if (usuario != null && usuario.getCargo()==6) {
            
            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            System.out.println("Editor");
            this.getServletConfig().getServletContext().getRequestDispatcher("/Soporte/EditorMain2.html").forward(request, response);
        }else if (usuario != null && usuario.getCargo()==7) {
            Usuarios miObjeto = new Usuarios();
            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("miObjeto", miObjeto);
            request.setAttribute("msje", "Bienvenido al sistema");
            System.out.println("Votante");
            this.getServletConfig().getServletContext().getRequestDispatcher("/Tarjetas.jsp").forward(request, response);
        }else if (usuario != null && usuario.getCargo()==8) {
            
            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            System.out.println("Candidato");
            this.getServletConfig().getServletContext().getRequestDispatcher("/VerificarCandidato.jsp").forward(request, response);
        }else if (usuario != null && usuario.getCargo()==9) {
            
            sesion.setAttribute("Usuarios", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            System.out.println("Admin");
            this.getServletConfig().getServletContext().getRequestDispatcher("/Soporte/EditorMain2.html").forward(request, response);
        } else {
            request.setAttribute("msje", "Credenciales Incorrectas");
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
    }

    private void cerrarsession(HttpServletRequest request, HttpServletResponse response) throws Exception{
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
