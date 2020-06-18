$(function (){
    
    $('#frm-registro').validate({
        rules: {
            txtRut:{
                required:true
            },
            txtNombre:{
                required:true
            },
            txtApellido:{
                required:true
            },
            txtPass:{
                required:true,
                minlength:8,
                maxlength:20
            },
            txtPass2:{
                required:true,
                equalTo: "#txtPass"
            },
            txtProceso:{
                required:true
            },
            txtCargo:{
                required:true
            },
            txtEmail:{
                required:true,
                email:true
            }
        },
        
        messages:{
            txtRut:{
                required:"Debes ingresar RUT"
            },
            txtNombre:{
                required:"Debes ingresar Nombre"
            },
            txtApellido:{
                required:"Debes ingresar Apellido"
            },
            txtPass:{
                required:"El campo password es obligatorio",
                minlength:"Contraseña debe tener 8 o mas caracteres",
                maxlength:"Contraseña debe tener maximo 20 caracteres"
            },
            txtPass2:{
                required:"El campo password es obligatorio",
                equalTo:"Las contraseñas deben ser iguales",
                minlength:"Contraseña debe tener 8 o mas caracteres",
                maxlength:"Contraseña debe tener maximo 20 caracteres"
            },
            txtProceso:{
                required:"Ingrese proceso a Realizar"
            },
            txtCargo:{
                required:"Ingrese cargo que desempeña"
            },
            txtEmail:{
                required:"Campo email es obligatorio",
                email:"Email no es valido"
            }
            
      },
        submitHandler: function (form){
            //Funcion ajax para crear usuario
            //form.submit();
            var data = $("#frm-registro").serialize();
            //console.log(data);
            $.post("registrar",data, function(res,est,jqXHR){
              if(res='1'){
               $("#txtRut").val("");
               $("#txtNombre").val("");
               $("#txtApellido").val("");
               $("#txtPass").val("");
               $("#txtPass2").val("");
               $("#txtProceso").val("");
               $("#txtCargo").val("");
               $("#txtEmail").val("");
               alert("Registro Correcto, sera redireccionado al login");
               setTimeout(function(){
                       window.location="login.jsp";
                       
                   },200);
                }else{
               
               alert("Error al registrars");
               
               
           }
            });
        }
    });
    
    $("#frm-login").validate({
        rules: {
            txtRut:{
                required:true
            },
            txtPass:{
                required:true                
            }
        },
        messages:{
           txtRut:{
               required:"Ingrese su RUT"
           },
            txtPass:{
               required:"Ingrese su Contraseña"
            }
       },
          submitHandler: function (form){
            //Funcion ajax para crear usuario
            //form.submit();
            var data = $("#frm-login").serialize();
            //console.log(data);
               $.post("login",data, function(res,est,jqXHR){
               if(res=='1'){
                   alert("Bienvenido, presione aceptar para ser redireccionado al panel principal");
                   setTimeout(function(){
                       window.location="panel.jsp";
                       
                   },200);
          }else{
              alert("Credenciales Incorrectas");
              $("#txtRut").val("");
              $("#txtPass").val("");
              
              
          }
            });
        }
        
        
    });
    
    
    
});
