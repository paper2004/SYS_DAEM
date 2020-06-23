<%-- 
    Document   : registro
    Created on : 14-05-2020, 11:28:23
    Author     : Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Resgistro de Usuarios</title>
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

<!-- //web font -->
</head>
<body>
  <div class="container">
    <div class="form-group col-md-12">
        <h1>Registro de usuario</h1>
    </div>
  </div>
  <div class="container">
    <form class="form-group" method="post" id="frm-registro" action="registrar">
      
      <div class="form-row">
        <div class="form-group col-md-9">
            <input type="text" class="form-control" id="txtRut" name="txtRut" placeholder="Ingrese su RUT">
        </div>
      </div>
      <div class="form-row">
          <div class="form-group col-md-9">
            <input type="text" class="form-control" id="txtNombre" name="txtNombre" placeholder="Ingrese Nombre">
         </div>
      </div>
      <div class="form-row">
       <div class="form-group col-md-9">
            <input type="text" class="form-control" id="txtApellido" name="txtApellido" placeholder="Ingrese Apellido">
         </div>
      </div>
      <div class="form-row">
            <div class="form-group col-md-9">
                <input type="password" class="form-control" id="txtPass" name="txtPass" placeholder="Ingrese Password">
         </div>
      </div>
       <div class="form-row">
            <div class="form-group col-md-9">
                <input type="password" class="form-control" id="txtPass2" name="txtPass2" placeholder="Re-ingrese Password">
         </div>
      </div>
      <div class="form-row">
            <div class="form-group col-md-9">
            <input type="text" class="form-control" id="txtProceso" name="txtProceso" placeholder="Ingrese Proceso">
         </div>
      </div>
      <div class="form-row">
            <div class="form-group col-md-9">
            <input type="text" class="form-control" id="txtCargo" name="txtCargo" placeholder="Ingrese Cargo">
         </div>
      </div>
      <div class="form-row">
            <div class="form-group col-md-9">
            <input type="email" class="form-control" id="txtEmail" name="txtEmail" placeholder="Ingrese Email">
         </div>
      </div>
      <div class="form-row">
          <div class="form-group col-md-9">
              <select class="form-group" name="cboIdEstablecimiento" id="cboIdEstablecimiento" >
                  <option  selected="">Escoja un establecimiento </option>
                  
                  
                  
                  
              </select>
              
         </div>
      </div>  
        
        
            <button type="submit" class="btn btn-primary">Registrate</button>
    </form>
  </div>
</body>
</html>
