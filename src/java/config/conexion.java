package config;
//Importamos las librerias necesarias
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author JonaC
 */
public class conexion {
    //DATOS DE CONEXION A BASE DE DATOS
    private static final String DBUSER="root";
    private static final String DBPASS="";
    private static final String DBHOST="localhost";
    private static final String PORT="3306";
    private static final String DBNAME="miproyecto";
    private static final String CLASS="com.mysql.jdbc.Driver";
    private static final String URL="jdbc:mysql://"+DBHOST+":"+PORT+"/"+DBNAME;
  
    //CONSTRUCTOR
    public static Connection getConnection()
    {
        //Inicialiazamos la variable conexion
        Connection conect=null;
        //Generamos un Try/Catch para preveer y capturar posibles errores
    try 
    {
        //REFERENCIA A DRIVER MYSQL
        Class.forName("com.mysql.jdbc.Driver");
        //Conexion a base de datos obtenida por medio del metodo getConnection(host,usuario,password)
        conect= DriverManager.getConnection(URL,DBUSER,DBPASS);
        //Mostramos por consola el estado de conexion y detalles
        System.out.println("Conectado a BD: "+DBNAME);
        System.out.println("CONEXION EXITOSA A BASE DE DATOS: "+DBNAME);
    }
    catch ( SQLException e)
    {
        //Capturamos en la variable e, excepciones de tipo SQL o relacionadas a la clase tambien
        //Mostramos por consola el error capturado 
        System.err.println("ERROR: "+e);
    }   
    catch (ClassNotFoundException ex) {
            Logger.getLogger(conexion.class.getName()).log(Level.SEVERE, null, ex);
        }

    //Una vez culminado el proceso, retornamos la conexion a base de datos por medio de la variable conect
        System.out.println("Retornando conexion");
    return conect;
   }
   
   }
 
            
            
            
            
            
            
            
            
            
            
            
            
            
            
    
    

