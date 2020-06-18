/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import org.apache.catalina.connector.Response;
/**
 *
 * @author Carlos
 */
public class Conexion {
    private String username ="root";
    private String password="paper8159/";
    private String hostname="localhost";
    private String port ="3306";
    private String database ="SYS_DAEM";
    private String classname ="com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://"+hostname+":"+port+"/"+database+"?useTimezone=true&serverTimezone=UTC";
    private Connection conn;
    
    public Conexion(){
        try{
            Class.forName(classname);
            conn= DriverManager.getConnection(url,username, password);
            
        }catch(Exception e){
            System.err.println(e.getMessage());
        }
    }
    public Connection getConnection(){
        return this.conn;
    }
    
    
}
