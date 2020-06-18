package Include;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Carlos
 */
public class Usuario {
        
        private int id_establecimiento;
        private String rut;
	private String nombre;
        private String apellido;
        private String pass;
        private String proceso;
        private String cargo;
        private String email;
        private String last_session;

    public Usuario(int id_establecimiento, String rut, String nombre, String apellido, String pass, String proceso, String cargo, String email) {
        this.id_establecimiento=id_establecimiento;
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.pass = pass;
        this.proceso = proceso;
        this.cargo = cargo;
        this.email = email;
        //this.last_session = last_session;
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd hh:mm:ss");
        this.last_session = sdf.format(d);
    }
    public Usuario(String rut, String pass){
        this.rut = rut;
        this.pass = pass;
    }
    public Usuario(String rut){
       this.rut=rut;   
       
    }

    public int getId_establecimiento() {
        return id_establecimiento;
    }

    public void setId_establecimiento(int id_establecimiento) {
        this.id_establecimiento = id_establecimiento;
    }
    /**
     * @return the rut
     */
    public String getRut() {
        return rut;
    }
    /**
     * @param rut the rut to set
     */
    public void setRut(String rut) {
        this.rut = rut;
    }
    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }
    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    /**
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }
    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    /**
     * @return the pass
     */
    public String getPass() {
        return pass;
    }
    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
    }
    /**
     * @return the proceso
     */
    public String getProceso() {
        return proceso;
    }
    /**
     * @param proceso the proceso to set
     */
    public void setProceso(String proceso) {
        this.proceso = proceso;
    }
    /**
     * @return the cargo
     */
    public String getCargo() {
        return cargo;
    }
    /**
     * @param cargo the cargo to set
     */
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }
    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    /**
     * @return the last_session
     */
    public String getLast_session() {
        return last_session;
    }
    /**
     * @param last_session the last_session to set
     */
    public void setLast_session(String last_session) {
        this.last_session = last_session;
    }
}
