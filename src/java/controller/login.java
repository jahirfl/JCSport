/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.usuario;
import modelDAO.usuarioDAO;

/**
 *
 * @author JonaC
 */
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    usuarioDAO dao = new usuarioDAO();
    usuario user = new usuario();
    int resultado;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String accion = request.getParameter("accion");
       if (accion.equals("Aceptar"))
       {
           String email = request.getParameter("email");
           String pass = request.getParameter("pass");
           user.setEmail(email);
           user.setPassword(pass);
           resultado=dao.validar(user);
           if (resultado>0)
           {
               request.getSession().setAttribute("usuario", user.getNombres() +" "+user.getApellidos());
               request.getSession().setAttribute("foto", user.getFoto());
               request.getSession().setAttribute("id", user.getId_usuario());
               
               //request.getRequestDispatcher("home.jsp").forward(request, response);
               int tipo = user.getTipo();
               if (tipo==1)
               {
                   request.getRequestDispatcher("home.jsp").forward(request, response);
               }
               else if (tipo==2)
               {
                   request.getRequestDispatcher("usuariosnormales.jsp").forward(request, response);
               }
               
           
           }
           else if (resultado<1)
           {
               request.getRequestDispatcher("nologin.jsp").forward(request, response);
               
           }

       }
       else if (accion.equals("salir"))
           {
               request.getRequestDispatcher("index.jsp").forward(request, response);
           
           
           }
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
