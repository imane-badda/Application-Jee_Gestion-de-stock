/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjbSession;

import Entites.Stock;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author hp
 */
@Local
public interface StockFacadeLocal {

    boolean create(String nomStock);

    void edit(Stock stock);

    void remove(Stock stock);

    Stock find(Object id);

    List<Stock> findAll();

    List<Stock> findRange(int[] range);

    int count();

    boolean EntreeDeStock(String nomStock, String refProduit, int quantite);
    
    public boolean SortieDeStock(String nomStock, String refProduit, int quantite);
    
    public boolean ModifierStock(String nomStock, String refProduit, int nouvelleQuantite);
    
    public List<Stock> findAllByStock(String nomS);
}
