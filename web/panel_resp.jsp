<%-- 
    Document   : panel
    Created on : 19-05-2020, 20:47:04
    Author     : Carlos
--%>

<%@page import="Include.Usuario"%>
<%@page import="Controlador.ControladorUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    Object rut = sesion.getAttribute("txtRut")== null ? null:sesion.getAttribute("txtRut");
    

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="Assets/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="Assets/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="Assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="Assets/js/main.js"></script>
<!-- Custom Theme files -->
<link href="Assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />


<!-- //Custom Theme files -->
<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">

    </head>
    <body>
      <%
          if (rut!=null){
              Controlador.ControladorUsuario cu = new ControladorUsuario();
              Usuario user = new Usuario(rut.toString());
              
      %>
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <a class="navbar-brand" href="#">Navbar</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
              </li>
              <li class="nav-item"><%= cu.getViewUser(user)%></li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
              <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
          </div>
        </nav>
      
      <% 
      }else{
              response.getWriter().print("Por favor inicie sesión");
              response.getWriter().print("<a href='login.jsp'>Iniciar Sesión</a>");
          }
          

          %>
        
</body>
</html>
