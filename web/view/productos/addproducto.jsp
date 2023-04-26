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
                    <h1>Agregar un producto</h1> 
          <form action="usercontrol" class="col-8">
                <div class="form-group">
                    <label for="nombres">Nombre del producto</label>
                    <input type="text" class="form-control" id="titulo" name="titulo">
                   
                </div>
                <div class="form-group">
                    <label for="apellidos">Descripcion</label>
                    <textarea  class="form-control" id="descripcion" name="descripcion"></textarea>
                </div>
                <div class="form-group">
                    <label for="username">Contenido</label>
                    <input type="text" class="form-control" id="contenido" name="contenido">
                </div>
       
                <div class="form-group">
                    <label for="email">Imagen del producto</label>
                    <input type="text" class="form-control" id="imagen" name="imagen">
                </div>
                <div class="form-group">
                    <label for="tipo">Categoria</label>
                    <select class="form-control" id="categoria" name="categoria">
                        <option value="1">Social</option>
                    </select>
                </div>
              
                <div class="form-group">
                    <label for="tipo">Usuario</label>
                    <select class="form-control" id="usuario" name="usuario">
                        <option value="15">Administrador</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <input name="accion" value="Guardar producto" type="submit" id="accion" class="btn btn-success btn-block">

                </div>
              
          </form>
                </div>
                    
             </div>
            
        </div>
    </body>
         <jsp:include page="../components/footer.jsp"/>  
    
</html>
