/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.publicacion;
import model.usuario;
import modelDAO.publicacionDAO;
import modelDAO.usuarioDAO;

/**
 *
 * @author JonaC
 */
public class usercontrol extends HttpServlet {

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
                int id;
  
        //Instanciamos la clase usuario y la clase DAO tambien
        usuario user = new usuario();
        publicacion publi = new publicacion();
       //Falta importar el dao
        publicacionDAO publidao = new publicacionDAO();
        usuarioDAO dao=new usuarioDAO();
        String accion=request.getParameter("accion");
        switch (accion) {
            case "home":
            {
                 request.getRequestDispatcher("home.jsp").forward(request, response);
                 break;
            
            }
                  case "addproducto":
            {
                 request.getRequestDispatcher("view/productos/addproducto.jsp").forward(request, response);
                 break;
            
            }
              case "Guardar producto":
            {
                 String titulo=request.getParameter("titulo");
                 String descripcion=request.getParameter("descripcion");
                 String contenido = request.getParameter("contenido");
                 String imagen = request.getParameter("imagen");
                 int categoria = Integer.parseInt(request.getParameter("categoria"));
                 int usuario = Integer.parseInt(request.getParameter("usuario"));
                 publi.setTitulo(titulo);
                 publi.setDescripcion(descripcion);
                 publi.setContenido(contenido);
                 publi.setImagen(imagen);
                 publi.setCategoria_id(categoria);
                 publi.setUsuario_id(usuario);
                 //Falta agregar la siguiente linea
                 publidao.add(publi);
                 request.getRequestDispatcher("home.jsp").forward(request, response);
                 break;
            
            }
            case "edit": 
            {
                request.setAttribute("id", request.getParameter("id"));
                RequestDispatcher vista = request.getRequestDispatcher("view/usuarios/edituser.jsp");
                vista.forward(request, response);
                break;
            
            }
            case "delete" : 
            {
                id=Integer.parseInt(request.getParameter("id"));
                user.setId_usuario(id);
                dao.delete(id);
                RequestDispatcher vista = request.getRequestDispatcher("home.jsp");
                vista.forward(request, response);
                break;
            
            }
            case "Actualizar":
            {
                id = Integer.parseInt(request.getParameter("idusuario"));
                String nombres=request.getParameter("nombres");
                String apellidos=request.getParameter("apellidos");
                String username=request.getParameter("username");
                String email=request.getParameter("email");
                String password=request.getParameter("password");
                String tipo=request.getParameter("tipo");
                String foto=request.getParameter("foto");
                user.setId_usuario(id);
                user.setNombres(nombres);
                user.setApellidos(apellidos);
                user.setUser_name(username);
                user.setEmail(email);
                user.setPassword(password);
                user.setTipo(Integer.parseInt(tipo));
                user.setFoto(foto);
                dao.edit(user);
                RequestDispatcher vista = request.getRequestDispatcher("home.jsp");
                vista.forward(request, response);
                break;
            
            }
            case "addform":
                {
                    RequestDispatcher vista = request.getRequestDispatcher("view/usuarios/adduser.jsp");
                    vista.forward(request, response);
                    //request.getRequestDispatcher("view/master/view_users.jsp").forward(request, response);
                    break;
                }
            case "Guardar":
                {
                    String nombres = request.getParameter("nombres");
                    String apellidos=request.getParameter("apellidos");
                    String username=request.getParameter("username");
                    String email=request.getParameter("email");
                    String password=request.getParameter("password");
                    String tipo=request.getParameter("tipo");
                    String foto="localhost/img/ejemplo1.jpg";
                    //Asignando valores al modelo
                    user.setNombres(nombres);
                    user.setApellidos(apellidos);
                    user.setUser_name(username);
                    user.setEmail(email);
                    user.setPassword(password);
                    user.setTipo(Integer.parseInt(tipo));
                    user.setFoto(foto);
                    dao.add(user);
                    RequestDispatcher vista = request.getRequestDispatcher("home.jsp");
                    vista.forward(request, response);
                    break;
            
                }
            
        }
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
