<%-- 
    Document   : usuariosnormales
    Created on : 10-15-2021, 07:47:23 AM
    Author     : MINEDUCYT
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.publicacion"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.publicacionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <jsp:include page="view/components/header.jsp"/>
    <body>
        <jsp:include page="view/components/menu_standar.jsp"/>
        <br>
        <div class="row">
             
              
 
        <% 
                         publicacionDAO dao = new publicacionDAO();
                         List<publicacion> listar = dao.listar();
                         Iterator<publicacion>iterator=listar.iterator();
                         publicacion publimodel = null;
                         while (iterator.hasNext())
                         {
                             publimodel = iterator.next();
                        %>
        <div class="col-4">
                        
        <div class="card">
            <div class="card-header">
             <%= publimodel.getTitulo()%>
             <%if(publimodel.getEstado()==1){%>  
                   <span class="badge bg-warning text-dark">Disponible</span>
                   <%}%>
                   
                   <%if(publimodel.getEstado()==0){%>
                    <span class="badge bg-danger text-white">Agotado</span>
                   <%}%>
             </div>
              <div class="card-body">
               <h5 class="card-title"><%= publimodel.getTitulo()%>
               </h5>
               <img src="<%= publimodel.getImagen()%>" class="img-thumbnail" alt="...">
               <p class="card-text"style="font-size: 10pt;"><span><%= publimodel.getDescripcion()%></p>
               <p class="card-text"><h5 class="badge rounded-pill bg-dark text-white card-text" style="padding: 8px; font-size: 10pt;"><%= publimodel.getContenido()%></h5></p>
               <a href="#" class="btn btn-primary">Mas detalles</a>
                <a href="#" class="btn btn-success">Comprar</a>
             </div>
        </div>
       </div>
                 <% } %>
        </div>
    </body>
</html>
