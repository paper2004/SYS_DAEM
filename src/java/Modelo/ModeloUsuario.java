/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Include.Encriptar;
import Include.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Carlos
 */
public class ModeloUsuario extends Conexion{
    
    public boolean crearUsuario(Usuario u){
        boolean flag = false;
           PreparedStatement pst= null;
        try {
               String sql ="call newUser(?,?,?,?,?,?,?,?,?)";
               pst = getConnection().prepareStatement(sql);
               pst.setString(1, Integer.toString(u.getId_establecimiento()));
               pst.setString(2, u.getRut());
               pst.setString(3, u.getNombre());
               pst.setString(4, u.getApellido());
               pst.setString(5, Encriptar.sha1(u.getPass()));
               pst.setString(6, u.getProceso());
               pst.setString(7, u.getCargo());
               pst.setString(8, u.getEmail());
               pst.setString(9, u.getLast_session());
               
               if(pst.executeUpdate()==1){
                   flag=true;
               }
        } catch (Exception e) {
               System.err.println(e.getMessage());
            
        }finally{
               try {
                   if (getConnection()!=null)getConnection().close();
                   if (pst!=null) pst.close();
               } catch (Exception e) {
                   System.err.println(e.getMessage());
               }
           }
        return flag;
    }
    
    public boolean autenticar(Usuario u){
        boolean flag = false;
        PreparedStatement pst = null;
        PreparedStatement pst2 = null;
        ResultSet rs = null;
        try {
            
            String sql = "call autenticar (?,?)";
            pst = getConnection().prepareStatement(sql);
           
            pst.setString(1, u.getRut());
            pst.setString(2, Encriptar.sha1(u.getPass()));
           
            rs = pst.executeQuery();
            if (rs.absolute(1)) {
                   flag=true;
            }
        } catch (Exception e) {
        }finally{
               try {
                   if (getConnection()!=null)getConnection().close();
                   if (pst!=null) pst.close();
                   if (rs !=null)rs.close();
               } catch (Exception e) {
                   System.err.println(e.getMessage());
               }
           }
    return flag;
    }
    
   
    
    
}
