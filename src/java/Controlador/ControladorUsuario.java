/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Include.Usuario;
import Modelo.ModeloUsuario;

/**
 *
 * @author Carlos
 */
public class ControladorUsuario {
    
    public boolean create(Usuario u){
            ModeloUsuario mu = new ModeloUsuario();
            return mu.crearUsuario(u);
    }
    
    public boolean validate(Usuario u){
            ModeloUsuario mu = new ModeloUsuario();
            return mu.autenticar(u);
    }
    
    public  String getViewUser(Usuario u){
        String htmlcode="";
        htmlcode +="<div class=''><h4>Bienvenido "+u.getRut()+" <a href='logout'> Cerrar Sesión</a> </h4></div>";
        
        return htmlcode;
    }
}
