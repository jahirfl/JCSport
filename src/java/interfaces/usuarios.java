/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;
import model.usuario;

/**
 *
 * @author JonaC
 */
public interface usuarios {
    public int validar (usuario user);
    public List listar();
    public usuario list(int id);
    public boolean add (usuario user);
    public boolean edit(usuario user);
    public boolean delete(int id);
}
