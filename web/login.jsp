<%-- 
    Document   : login
    Created on : 14-05-2020, 11:28:12
    Author     : Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>DAEM Graneros</title>
    
    <link rel="stylesheet" href="Assets/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" 
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" 
          integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <script type="text/javascript" src="Assets/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="Assets/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="Assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="Assets/js/main.js"></script>
<!-- Custom Theme files -->
<link href="Assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="Assets/css/loginEstilos.css">
  </head>
  <body>
     <div class="container">
        <div class="row text-center login-page">
	   <div class="col-md-12 login-form">
               <form action="login" method="post" id="frm-login"> 			
	         <div class="row">
		    <div class="col-md-12 login-form-header">
                        <p class="login-form-font-header">DAEM<span>&nbsp; Graneros</span><p>
		    </div>
		</div>
		<div class="row">
		   <div class="col-md-12 login-from-row">
		      <input type="text" name="txtRut"  id="txtRut" placeholder="Ingrese RUT"/>
		   </div>
		</div>
		<div class="row">
		   <div class="col-md-12 login-from-row">
		      <input type="password" name="txtPass" id="txtPass" placeholder="Ingrese Contraseña"/>
		   </div>
		</div>
		<div class="row">
		   <div class="col-md-12 login-from-row">
                       <input class="btn btn-info" type="submit" value="Entrar" id="btn-login">
		   </div>
		</div>
	    </form>
	</div>
     </div>
  </div>
</body>
</html>
