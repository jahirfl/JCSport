<%-- 
    Document   : home
    Created on : 09-07-2020, 02:26:30 PM
    Author     : JonaC
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.usuario"%>
<%@page import="modelDAO.usuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="view/components/header.jsp"/>
    <body>
        <jsp:include page="view/components/menu_admin.jsp"/>
        <div class="container">
            <div class="col-12">
                <h1>Lista de usuarios</h1>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Nombres</th>
                            <th scope="col">Apellidos</th>
                            <th scope="col">Email</th>
                            <th scope="col">Opciones</th>
                        </tr>
                    
                        
                    </thead>
                    <tbody>
                        <% 
                         usuarioDAO dao = new usuarioDAO();
                         List<usuario> listar = dao.listar();
                         Iterator<usuario>iterator=listar.iterator();
                         usuario usermodel = null;
                         while (iterator.hasNext())
                         {
                             usermodel = iterator.next();
                         

                        %>
                        <tr>
                            <td><%= usermodel.getId_usuario() %></td>
                            <td><%= usermodel.getNombres() %></td>
                            <td><%= usermodel.getApellidos() %></td>
                            <td><%= usermodel.getEmail()%></td>
                            <td>
                                <a class="btn btn-outline-success" href="usercontrol?accion=edit&id=<%=usermodel.getId_usuario()%>">Editar</a>
                                <a class="btn btn-outline-danger" href="usercontrol?accion=delete&id=<%=usermodel.getId_usuario()%>">Eliminar</a>
                                
                            </td>
                        </tr>
                  <% } %>
                    </tbody>
                    
                </table>
                
            </div>
            
            
        </div>
    </body>
    <jsp:include page="view/components/footer.jsp"/>
</html>
