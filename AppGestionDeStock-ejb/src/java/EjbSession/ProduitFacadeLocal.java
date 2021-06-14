/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjbSession;

import Entites.Produit;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author hp
 */
@Local
public interface ProduitFacadeLocal {

    boolean createP(Produit p);

    boolean editP(Produit p);

    boolean remove(String nom);

    Produit find(Object id);

    List<Produit> findAll();

    List<Produit> findRange(int[] range);

    int count();

    public List<Produit> findAllByMarque(String nomM);
    
}
