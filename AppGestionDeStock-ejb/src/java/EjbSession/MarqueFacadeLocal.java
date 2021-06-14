/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjbSession;

import Entites.Marque;
import Entites.Produit;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author hp
 */
@Local
public interface MarqueFacadeLocal {

    boolean create(String nom, String origine);

    void edit(Marque marque);

    boolean remove(String nom);

    Marque find(Object id);

    List<Marque> findAll();

    List<Marque> findRange(int[] range);

    int count();
    
    List<Produit> listingProduits(String nom);
    
    void ajouterProduits(String nomMarque, Produit p);

    Marque findMarque(String nomMarque);
    
}
