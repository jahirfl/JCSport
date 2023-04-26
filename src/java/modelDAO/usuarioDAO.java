/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelDAO;

import config.conexion;
import interfaces.usuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.usuario;

/**
 *
 * @author JonaC
 */
public class usuarioDAO implements usuarios{
    Connection conect;
    conexion con = new conexion();
    PreparedStatement ps = null;
    ResultSet rs;
    usuario user = new usuario();

    @Override
    public int validar(usuario user) 
    {
        int contador=0;
        conect=conexion.getConnection();
        String query="SELECT * FROM usuarios WHERE Email=? AND Password=? AND Estado=1";
        try
        {
            contador = contador +1;
            ps=conect.prepareStatement(query);
            ps.setString(1,user.getEmail());
            ps.setString(2, user.getPassword());
            rs=ps.executeQuery();
            rs.last();
            if(rs.getRow()>0)
            {
                user.setEmail(rs.getString("Email"));
                user.setNombres(rs.getString("Nombres"));
                user.setApellidos(rs.getString("Apellidos"));
                user.setPassword(rs.getString("Password"));
                user.setFoto(rs.getString("Foto_Perfil"));
                user.setTipo(rs.getInt("Tipo_Usuario"));
                user.setId_usuario(rs.getInt("Id_Usuario"));
                if(contador==1)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
        }
        catch(Exception e)
        {
            System.err.println("ERROR:" +e);
        
        }
        finally
        {
            try
            {
                if(conexion.getConnection()!=null) conexion.getConnection().close();
                if(ps!=null) ps.close();
                if(rs!=null) rs.close();
             
            }
            catch(SQLException ex)
            {
                System.err.println("Error:" +ex);
                
            
            }
        }
        return 0;
    }

    @Override
    public List listar() {
           ArrayList <usuario> list = new ArrayList<>();
           String query="SELECT * FROM usuarios WHERE Estado=1";
           try
           {
               conect=conexion.getConnection();
               ps=conect.prepareStatement(query);
               rs=ps.executeQuery();
               while (rs.next())
               {
                    usuario user = new usuario();
                    user.setId_usuario(rs.getInt("Id_Usuario"));
                    user.setNombres(rs.getString("Nombres"));
                    user.setApellidos(rs.getString("Apellidos"));
                    user.setUser_name(rs.getString("User_Name"));
                    user.setEmail(rs.getString("Email"));
                    user.setPassword(rs.getString("Password"));
                    user.setTipo(rs.getInt("Tipo_Usuario"));
                    user.setFoto(rs.getString("Foto_Perfil"));
                    user.setEstado(rs.getInt("Estado"));
                    list.add(user);
               }
           }
           catch(Exception e)
           {
               System.out.println("ERROR: " +e);
           
           }
           return list;

    }

    @Override
    public usuario list(int id) {
        String query = "SELECT * FROM usuarios WHERE id_usuario="+id;
        try
        {
            conect=conexion.getConnection();
            ps=conect.prepareStatement(query);
            rs=ps.executeQuery();
            while (rs.next())
            {
                user.setId_usuario(rs.getInt("Id_Usuario"));
                user.setNombres(rs.getString("Nombres"));
                user.setApellidos(rs.getString("Apellidos"));
                user.setUser_name(rs.getString("User_Name"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setTipo(rs.getInt("Tipo_Usuario"));
                user.setFoto(rs.getString("Foto_Perfil"));
                user.setEstado(rs.getInt("Estado"));
            }
        }
        catch(Exception e)
        {
            System.out.println("ERROR: "+e);
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
        return user;
    }

    @Override
    public boolean add(usuario user) {
        conect = conexion.getConnection();
        String query ="INSERT INTO usuarios (nombres, apellidos, user_name, email, password, tipo_usuario, foto_perfil) VALUES (?,?,?,?,?,?,?)";
        try
        {
            ps=conect.prepareStatement(query);
            ps.setString(1, user.getNombres());
            ps.setString(2, user.getApellidos());
            ps.setString(3, user.getUser_name());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPassword());
            ps.setInt(6, user.getTipo());
            ps.setString(7, user.getFoto());
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

    @Override
    public boolean edit(usuario user) 
    {
        String query="UPDATE usuarios SET nombres=?,apellidos=?,user_name=?,email=?,password=?,tipo_usuario=?,foto_perfil=? WHERE id_usuario=?";
        try
        {
            conect = conexion.getConnection();
            ps=conect.prepareStatement(query);
            ps.setString(1, user.getNombres());
            ps.setString(2, user.getApellidos());
            ps.setString(3, user.getUser_name());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPassword());
            ps.setInt(6, user.getTipo());
            ps.setString(7, user.getFoto());
            ps.setInt(8, user.getId_usuario());
            ps.executeUpdate();
        }
        catch(Exception e)
        {
            System.err.println("Error: "+e);
        
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

    @Override
    public boolean delete(int id) {
       String query="UPDATE usuarios SET estado='0' WHERE id_usuario="+id;
       //String query2="DELETE FROM usuarios WHERE id_usuario="+id;
       try
       {
           conect=conexion.getConnection();
           ps=conect.prepareStatement(query);
           ps.executeUpdate();
       
       }
       
       catch(Exception e)
       {
           System.err.println("Error: "+e);
       
       
       }
         finally
        {
            try 
            {
                if(conexion.getConnection()!=null) conexion.getConnection().close();
                if (ps !=null) ps.close();
             
            
            }
            catch(SQLException ex)
            {
                 System.err.println("Error: "+ex);
            }
                   
        
        }
       return false;
       
    }
    
    
}
