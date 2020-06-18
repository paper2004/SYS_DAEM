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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
  <link rel="stylesheet" href="Assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="Assets/css/estilo.css">
  <script src="Assets/js/jquery-3.5.1.min.js"></script>
  <script src="Assets/js/bootstrap.min.js"></script>
  <style>
  .modal-header, h4, .close {
    background-color: #5cb85c;
    color:white !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-footer {
    background-color: #f9f9f9;
  }
  </style>
</head>
<body>
     <%
          if (rut!=null){
              Controlador.ControladorUsuario cu = new ControladorUsuario();
              Usuario user = new Usuario(rut.toString());
      %>
<!--navbar-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand"  href="#"><img class="logo" src="Assets/img/daem.png"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ">
      
      <li class="nav-item active">
        <a class="nav-link" href="#" id="btnRecepcion" data-toggle="modal" data-target="#exampleModalLong">Recepci&oacute;n</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#" id="btnInventario" data-toggle="modal" data-target="#exampleModalLong">Inventario</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#" id="btnNotaCredito" data-toggle="modal" data-target="#exampleModalLong">Nota Credito</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#" id="btnBodega" data-toggle="modal" data-target="#exampleModalLong">Bodega</a>
      </li>
     <li class="nav-item active">
        <a class="nav-link" href="#" id="btnProveedor" data-toggle="modal" data-target="#exampleModalLong">Proveedor</a>
      </li>
        <li class="nav-item active">
        <a class="nav-link" href="#" id="btnArticulo" data-toggle="modal" data-target="#exampleModalLong">Articulo</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#" id="btnEstablecimiento" data-toggle="modal" data-target="#exampleModalLong">Establecimiento</a>
      </li>
      <li class="nav-item active">
          <label class="text-center "> <%= cu.getViewUser(user)%></label>
      </li>
    </ul>
  </div>
</nav>
<!--fin navbar    -->
<div class="container">
    
<!-- Inicio Modal Recepcion -->
<form class="form-horizontal"  method="post" name=""> 
    <div class="modal fade" id="modRecepcion" tabindex="-1" role="dialog" aria-labelledby="modalRecepcion" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalRecepcion">Recepci&oacute;n</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                </div>
                <div class="modal-body">
                    <div class="form-grou formulario">
                        <label class="control-label">Seleccione proveedor</label>
                            <select class="custom-select">
                                <option selected>--</option>
                            </select>
                    </div>
                    <div class="form-grou formulario">
                        <label class="control-label">Seleccione Nota Credito</label>
                            <select class="custom-select">
                                <option selected>--</option>
                            </select>
                    </div>
                    <div class="form-grou formulario">
                        <label class="control-label">Estado</label>
                        <select class="custom-select">
                            <option selected>--</option>
                        </select>
                    </div>
                    <div class="form-group">
				        <label for="nombre" class="control-label">N° Orden Proveedor</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			         </div>
                    <div class="form-group">
				        <label for="nombre" class="control-label">N° Factura Proveedor</label>
					    <input class="form-control" id="facturaProveedor" name="facturaProveedor"/>
			         </div>
                    <div class="form-group">
				        <label for="nombre" class="control-label">Fecha Recepci&oacute;n</label>
					    <input class="form-control" type="datetime-local" id="fechaRecepcion" name="fechaRecepcion">
			         </div>
                     <div class="form-grou formulario">
                        <label class="control-label">Seleccione Financiamiento</label>
                            <select class="custom-select">
                                <option selected>--</option>
                            </select>
                    </div>
                    <div class="input-group">
                        <div class="custom-file">
                          <input type="file" class="custom-file-input" id="customFileLang" lang="es">
                          <label class="custom-file-label" for="customFileLang">Seleccionar Archivo</label>
                        </div>
                    </div>
                    <div class="form-group">
				        <label for="nombre" class="control-label">Fecha Entrega</label>
					    <input class="form-control" type="datetime-local" id="fechaEntrega" name="fechaEntrega">
			         </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary">Guardar Cambios</button>
                </div>
            </div>
        </div>
    </div>
</form>  
    
<!--Fin Modal Recepcion-->

    
<!--   Inicio Modal Inventario-->
    
<form class="form-horizontal"  method="post" name=""> 
    <div class="modal fade" id="modInventario" tabindex="-1" role="dialog" aria-labelledby="modInventario" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modalInventario">Inventario</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
                <div class="form-group">
				        <label for="nombre" class="control-label">Articulo</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			    </div>
               <div class="form-group">
				        <label for="nombre" class="control-label">Usuario</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			    </div>
              <div class="form-grou formulario">
                  <label class="control-label">Establecimiento</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
              <div class="form-grou formulario">
                  <label class="control-label">Proveedor</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
              
              <div class="form-grou formulario">
                  <label class="control-label">Bodega</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Responsable Recepci&oacute;n</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Ingresar Cantidad</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Valor</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">%IVA</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Valor Total</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Fecha de Ingreso</label>
					    <input class="form-control" type="datetime-local" id="fechaIngreso" name="fechaIngreso">
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Observaciones</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary">Guardar Cambios</button>
          </div>
        </div>
      </div>
    </div>
</form> 
<!--    Fin Modal Inventario-->
    
<!--   Inicio Modal Nota de Credito-->
    
<form class="form-horizontal"  method="post" name=""> 
    <div class="modal fade" id="modNotaCredito" tabindex="-1" role="dialog" aria-labelledby="modNotaCredito" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modNotaCredito">Nota de Cr&eacute;dito</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="form-grou formulario">
                  <label class="control-label">Proveedor</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
                
              <div class="form-grou formulario">
                  <label class="control-label">Articulo</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
              
              <div class="form-grou formulario">
                  <label class="control-label">Establecimiento</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Cantidad</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Valor</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Total</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Ingresar Cantidad</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Valor</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Valor Total</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">%IVA</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Total Nota de Cr&eacute;dito</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Fecha de Ingreso</label>
					    <input class="form-control" type="datetime-local" id="fechaIngreso" name="fechaIngreso">
			  </div>
              
              
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary">Guardar Cambios</button>
          </div>
        </div>
      </div>
    </div>
</form> 
<!--    Fin Modal Nota Credito-->
    
<!--   Inicio Modal Bodega-->
    
<form class="form-horizontal"  method="post" name=""> 
    <div class="modal fade" id="modBodega" tabindex="-1" role="dialog" aria-labelledby="modBodega" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modBodega">Bodega</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="form-grou formulario">
                  <label class="control-label">Bodega</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
                
              <div class="form-grou formulario">
                  <label class="control-label">Articulo</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
              
              <div class="form-grou formulario">
                  <label class="control-label">Establecimiento</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
              
              <div class="form-grou formulario">
                  <label class="control-label">Proveedor</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
              
             
              <div class="form-group">
				        <label for="nombre" class="control-label">Fecha de Ingreso</label>
					    <input class="form-control" type="datetime-local" id="fechaIngreso" name="fechaIngreso">
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Observaciones</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary">Guardar Cambios</button>
          </div>
        </div>
      </div>
    </div>
</form> 
<!--    Fin Modal Bodega-->
    
<!--   Inicio Modal Proveedor-->
    
<form class="form-horizontal"  method="post" name=""> 
    <div class="modal fade" id="modProveedor" tabindex="-1" role="dialog" aria-labelledby="modProveedor" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modProveedor">Proveedor</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="form-grou formulario">
                  <label class="control-label">Proveedor</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
                
              <div class="form-grou formulario">
                  <label class="control-label">Nombre Proveedor</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Rut Proveedor</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Giro Proveedor</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
             <div class="form-grou formulario">
                  <label class="control-label">Convenio Proveedor</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
             
              <div class="form-group">
				        <label for="nombre" class="control-label">Fecha de Ingreso</label>
					    <input class="form-control" type="datetime-local" id="fechaIngreso" name="fechaIngreso">
			  </div>
              
                          
              
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary">Guardar Cambios</button>
          </div>
        </div>
      </div>
    </div>
</form> 
<!--    Fin Modal Proveedor-->
    
<!--   Inicio Modal Articulo-->
    
<form class="form-horizontal"  method="post" name=""> 
    <div class="modal fade" id="modArticulo" tabindex="-1" role="dialog" aria-labelledby="modArticulo" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modArticulo">Articulo</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="form-group">
				        <label for="nombre" class="control-label">Nombre Articulo</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
                
              <div class="form-grou formulario">
                  <label class="control-label">Tipo Articulo</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
              
              <div class="form-grou formulario">
                  <label class="control-label">Convenio</label>
                    <select class="custom-select">
                      <option selected>--</option>
                    </select>
              </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Marca</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
             <div class="form-group">
				        <label for="nombre" class="control-label">Cantidad</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Detalle Cantidad</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Valor Unitario</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Total Cantidad</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Valor Saldo</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Observaciones</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
             
              <div class="form-group">
				        <label for="nombre" class="control-label">Fecha de Ingreso</label>
					    <input class="form-control" type="datetime-local" id="fechaIngreso" name="fechaIngreso">
			  </div>
           </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary">Guardar Cambios</button>
          </div>
        </div>
      </div>
    </div>
</form> 
<!--    Fin Modal Articulo-->

<!--   Inicio Modal Establecimiento-->
    
<form class="form-horizontal"  method="post" name=""> 
    <div class="modal fade" id="modEstablecimiento" tabindex="-1" role="dialog" aria-labelledby="modEstablecimiento" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modEstablecimiento">Establecimiento</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              
              <div class="form-grou formulario">
                <label class="control-label">Rut Director</label>
                <select class="custom-select" id="cboRutDirector" name="cboRutDirector">
                    <option selected>--</option>
                </select>
              </div>
              
              <div class="form-grou formulario">
                <label class="control-label">Nombre Director</label>
                 <input class="form-control" id="txtNombreDirector" name="txtNombreDirector"/>
              </div>
              
              <div class="form-grou formulario">
                <label class="control-label">Convenio</label>
                <input class="form-control" id="txtUsuario" name="txtUsuario"/>
              </div>
              
              <div class="form-group">
                <label for="nombre" class="control-label">Marca</label>
	          <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
	      </div>
              
             <div class="form-group">
                <label for="nombre" class="control-label">Cantidad</label>
                    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
             </div>
              
             <div class="form-group">
		<label for="nombre" class="control-label">Detalle Cantidad</label>
                    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
	     </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Valor Unitario</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Total Cantidad</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Valor Saldo</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
              
              <div class="form-group">
				        <label for="nombre" class="control-label">Observaciones</label>
					    <input class="form-control" id="ordenProveedor" name="ordenProveedor"/>
			  </div>
             
              <div class="form-group">
				        <label for="nombre" class="control-label">Fecha de Ingreso</label>
					    <input class="form-control" type="datetime-local" id="fechaIngreso" name="fechaIngreso">
			  </div>
           </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary">Guardar Cambios</button>
          </div>
        </div>
      </div>
    </div>
</form> 
<!--    Fin Modal Establecimiento-->
 
<!--   Inicio Modal Login-->
    
<form class="form-horizontal"  method="post" name=""> 
    <div class="modal fade" id="modLogin" tabindex="-1" role="dialog" aria-labelledby="modLogin" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modLogin">Login</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              
              
              
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary">Ingresar</button>
          </div>
        </div>
      </div>
    </div>
</form> 
<!--    Fin Modal Login-->
    
<!--fin container-->
</div>
<!-- Inicio script modal-->
<script>
$(document).ready(function(){
  $("#btnRecepcion").click(function(){
    $("#modRecepcion").modal();
  });

    $("#btnInventario").click(function(){
    $("#modInventario").modal();
  });
    $("#btnNotaCredito").click(function(){
    $("#modNotaCredito").modal();
  });
    
    $("#btnBodega").click(function(){
    $("#modBodega").modal();
  });
    
    $("#btnProveedor").click(function(){
    $("#modProveedor").modal();
  });
    
    $("#btnArticulo").click(function(){
    $("#modArticulo").modal();
  });
  
    $("#btnEstablecimiento").click(function(){
    $("#modEstablecimiento").modal();
  });
    
    $("#btnImprimir").click(function(){
    $("#modImprimir").modal();
  });
}); 
</script>
<!-- Fin script modal-->
    

        <thead class="thead-light">
        <div class="container">
            
            <div class="row justify-content-md-center">
                <button class="btn btn-secondary" type="button">Imprimir</button>
                <div class="col col-lg-6">  
                    <div class="input-group md-form form-sm form-1 pl-0">
                        <div class="input-group md-form form-sm form-2 pl-0">
                            <input class="form-control my-0 py-1 red-border" type="text" placeholder="Buscar" aria-label="Buscar">
                                <div class="input-group-append">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="button">Buscar</button>
                                    </span>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
<div class="table-responsive-lg">
  <table class="table table-condensed table-bordered table-hover">
      <thead class="thead-light">
          <div class="container">
            <div class="row justify-content-md-center">
                <div class="col col-lg-10">
                  <tr>
                    <th>Art&iacute;culo</th>
                    <th>Recepcion</th>
                    <th>Tipo Artculo</th>
                    <th>Bodega</th>
                    <th>Cantidad</th>
                    <th>Valor</th>
                    <th>Establecimiento</th>
                    <th>Convenio</th>
                    <th>Observaci&oacute;n</th>
                    <th>Imagen Factura</th>
                    <th>Imprimir</th>
                  </tr>
                  <tr>
                    <td>Telón</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><button type="button" id="btnImprimir" class="btn btn-primary">Detalles</button>
                        <form class="form-horizontal"  method="post" name=""> 
                            <div class="modal fade" id="modImprimir" tabindex="-1" role="dialog" aria-labelledby="modImprimir" aria-hidden="true">
                              <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h5 class="modal-title" id="modImprimir">Detalles</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                  </div>
                                  <div class="modal-body">
                                       
                                            
                                  </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                    <button type="button" class="btn btn-primary">Imprimir</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                        </form> 
                    </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                </div>
            </div>
         </div>
      
    </thead>
  </table>
</div>
        </thead>  
         <% 
      }else{
              response.getWriter().print("Por favor inicie sesión");
              response.getWriter().print("<a href='login.jsp'>Iniciar Sesión</a>");
          }
          

          %>

    </body>
</html>
