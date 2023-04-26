<%-- 
    Document   : menu_standar
    Created on : 04-10-2020, 03:23:15 PM
    Author     : JonaC
--%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark text-white">

  <a class="navbar-brand" href="usercontrol?accion=home">JC SPORTS</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li>
       
        </li>
      <li class="nav-item active">
        <a class="nav-link" href="usercontrol?accion=home">Inicio <span class="sr-only">(current)</span></a>
      </li>
    
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Comprar</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="login?accion=salir" tabindex="-1" aria-disabled="true">Cerrar Sesion</a>
      </li>
    </ul>
      <img src="${foto}" class="thumbnail rounded-circle" alt="..." width="40px" height="40px">&nbsp
      <span class="navbar-text text-white">
      ${usuario}
    </span>
    &nbsp
    <form class="form-inline my-2 my-lg-0" action="products">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="TxtBuscar">
      <input name="accion" value="Buscar" type="submit" id="accion" class="btn btn-outline-success my-2 my-sm-0">

    </form>
  </div>
</nav>