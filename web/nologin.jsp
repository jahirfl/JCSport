<%-- 
    Document   : nologin
    Created on : 05-03-2020, 02:54:33 PM
    Author     : JonaC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
<jsp:include page="view/components/header.jsp"/>    

    <body>
        <jsp:include page="view/components/menuexterno.jsp"/>  
        <img src="assets/img/home 3.jpg" class="img-fluid" width="100%" alt="Responsive image">
        <div class="container">
     
  <div class="row">
      <div class="col-8">
   <div class="card nologin">
  <h5 class="card-header">JC SPORTS</h5>
  <div class="card-body">
    <h5 class="card-title">¡LO SENTIMOS, PERO LOS DATOS INGRESADOS SON INCORRECTOS!</h5>
    <p class="card-text">Por favor, revise sus datos de inicio de sesion. Posiblemente haya ingresado su email o password de forma incorrecta. Vuelva a intentar...</p>
    <a href="login?accion=salir" class="btn btn-primary">Regresar al inicio</a>
  </div>
</div>
          
      </div>

  </div>
        
</div>
        
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
    <jsp:include page="view/components/footer.jsp"/>    
</html>

