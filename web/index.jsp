<%-- 
    Document   : index
    Created on : 09-07-2020, 01:44:19 PM
    Author     : JonaC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
<jsp:include page="view/components/header.jsp"/>    

    <body>
        <jsp:include page="view/components/menuexterno.jsp"/>
        <img src="assets/img/home yes.jpg" class="img-fluid" width="100%" alt="Responsive image">
        <div class="container">
     
  <div class="row">
      <div class="col-8">
          <h1>Bienvenido a JC Sports</h1>
          <p>
      Encuentra todo lo necesario que requiere todo jugador profesional. Bienvendio a JC Sports, líderes en ropa deportiva. Podrás encontrar una amplia variedad de productos y marcas importadas.
      </p>
      </div>
    <div class="col-4" id="formlogin"><br><br><br><br><br><br>
        <h1 class="card-login">Iniciar Sesion</h1>
        
        <form action="login" method="POST">
  <div class="form-group">
    <label for="email">Email</label>
    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" required>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" name="pass" id="pass">
  </div>
 
   <input name="accion" value="Aceptar" type="submit" id="accion" class="btn btn-danger btn-block" required>
  <button type="submit" class="btn btn-primary btn-block">Registrarme</button>
</form>
    </div>
  </div>
        
</div>
        
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
    
    <jsp:include page="view/components/footer.jsp"/>    
</html>


