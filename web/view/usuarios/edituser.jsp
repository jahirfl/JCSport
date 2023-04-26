<%-- 
    Document   : edituser
    Created on : 09-21-2020, 07:57:50 PM
    Author     : JonaC
--%>

<%@page import="model.usuario"%>
<%@page import="modelDAO.usuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
         <jsp:include page="../components/header.jsp"/>  
    <body>
         <jsp:include page="../components/menu_admin.jsp"/>  
       
        <div class="container">
            <div class="row">
                <div class="col-3" ></div>
                <div class="col-9">
                    <h1>Actualizar usuario</h1> 
                    <%
                    usuarioDAO dao1 = new usuarioDAO();
                    int id = Integer.parseInt((String)request.getAttribute("id"));
                    usuario us= (usuario)dao1.list(id);
                    %>
          <form action="usercontrol" class="col-8">
              <div class="form-group">
                  <label for="idusuario">Id Usuario</label>
                   <input type="hidden" class="form-control" id="idusuario" name="idusuario" value="<%=us.getId_usuario()%>">
              </div>
                <div class="form-group">
                    <label for="nombres">Nombres</label>
                    <input type="text" class="form-control" id="nombres" name="nombres" value="<%=us.getNombres()%>">
                   
                </div>
                <div class="form-group">
                    <label for="apellidos">Apellidos</label>
                    <input type="text" class="form-control" id="apellidos" name="apellidos" value="<%=us.getApellidos()%>">
                </div>
                <div class="form-group">
                    <label for="username">Nick</label>
                    <input type="text" class="form-control" id="username" name="username" value="<%=us.getUser_name() %>">
                </div>
       
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%=us.getEmail() %>">
                </div>
              
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" <%=us.getPassword()%>">
                </div>
                <div class="form-group">
                    <label for="tipo">Tipo de usuario</label>
                    <select class="form-control" id="tipo" name="tipo">
                        <option value="1">Administrador</option>
                        <option value="2">Vendedor</option>
                        <option value="3">Cliente</option>
                    </select>
                </div>
                 <div class="form-group">
                    <label for="foto">URL foto</label>
                    <input type="text" class="form-control" id="foto" name="foto" value="<%=us.getFoto()%>">
                </div>
                <div class="form-group">
                    <input name="accion" value="Actualizar" type="submit" id="accion" class="btn btn-danger btn-block">

                </div>
              
          </form>
                </div>
                    
             </div>
            
        </div>
    </body>
         <jsp:include page="../components/footer.jsp"/>  
    
</html>
