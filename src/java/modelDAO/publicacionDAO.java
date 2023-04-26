/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelDAO;

import config.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.publicacion;
import model.usuario;

/**
 *
 * @author MINEDUCYT
 */
public class publicacionDAO {
     Connection conect;
    conexion con = new conexion();
    PreparedStatement ps = null;
    ResultSet rs;
    publicacion publi = new publicacion();
    
     public List listar() {
           ArrayList <publicacion> list = new ArrayList<>();
           String query="SELECT * FROM publicacion ORDER BY creacion DESC";
           try
           {
               conect=conexion.getConnection();
               ps=conect.prepareStatement(query);
               rs=ps.executeQuery();
               while (rs.next())
               {
                    publicacion publi = new publicacion();
                    publi.setTitulo(rs.getString("titulo"));
                    publi.setDescripcion(rs.getString("descripcion"));
                    publi.setContenido(rs.getString("contenido"));
                    publi.setImagen(rs.getString("imagen"));
                    publi.setEstado(rs.getInt("estado"));
                    list.add(publi);
               }
           }
           catch(Exception e)
           {
               System.out.println("ERROR: " +e);
           
           }
           return list;

    }
     
     public boolean add(publicacion publi) {
        conect = conexion.getConnection();
        String query ="INSERT INTO publicacion (titulo, descripcion, contenido, imagen, categoria_id, usuario_id) VALUES (?,?,?,?,?,?)";
        try
        {
            ps=conect.prepareStatement(query);
            ps.setString(1,publi.getTitulo());
            ps.setString(2, publi.getDescripcion());
            ps.setString(3, publi.getContenido());
            ps.setString(4, publi.getImagen());
            ps.setInt(5, publi.getCategoria_id());
            ps.setInt(6, publi.getUsuario_id());
            ps.executeUpdate();
        }
        catch(Exception e)
        {
            System.err.println("ERROR: " +e);
         
        }
        finally
        {
            try 
            {
                if(conexion.getConnection()!=null) conexion.getConnection().close();
                if (ps !=null) ps.close();
                if(rs !=null) rs.close();
            
            }
            catch(SQLException ex)
            {
                 System.err.println("Error: "+ex);
            }
                           
        }
        return false;
    }

}
