<%-- 
    Document   : adduser
    Created on : 09-14-2020, 12:32:23 PM
    Author     : JonaC
--%>

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
                    <h1>Agregar un usuario</h1> 
          <form action="usercontrol" class="col-8">
                <div class="form-group">
                    <label for="nombres">Nombres</label>
                    <input type="text" class="form-control" id="nombres" name="nombres">
                   
                </div>
                <div class="form-group">
                    <label for="apellidos">Apellidos</label>
                    <input type="text" class="form-control" id="apellidos" name="apellidos">
                </div>
                <div class="form-group">
                    <label for="username">Nick</label>
                    <input type="text" class="form-control" id="username" name="username">
                </div>
       
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>
              
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <div class="form-group">
                    <label for="tipo">Tipo de usuario</label>
                    <select class="form-control" id="tipo" name="tipo">
                        <option value="1">Administrador</option>
                        <option value="2">Estandar</option>
                        <option value="3">Cliente</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <input name="accion" value="Guardar" type="submit" id="accion" class="btn btn-danger btn-block">

                </div>
              
          </form>
                </div>
                    
             </div>
            
        </div>
    </body>
         <jsp:include page="../components/footer.jsp"/>  
    
</html>
