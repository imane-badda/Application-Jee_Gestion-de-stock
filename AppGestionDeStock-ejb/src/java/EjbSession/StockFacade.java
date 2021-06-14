/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjbSession;

import Entites.Stock;
import JavaClasses.ElementDeStock;
import JavaClasses.ListeDeStock;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author hp
 */
@Stateless
public class StockFacade extends AbstractFacade<Stock> implements StockFacadeLocal {

    @PersistenceContext(unitName = "AppGestionDeStock-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StockFacade() {
        super(Stock.class);
    }
    
    @Override
    public boolean create(String nomStock){
       Stock sExist=em.find(Stock.class, nomStock);
       if(sExist==null){
        Stock s = new Stock(nomStock);
        em.persist(s);
        return true;
       }else 
           return false;
    }

    @Override
    public boolean EntreeDeStock(String nomStock, String refProduit, int quantite) {
        Stock s=em.find(Stock.class, nomStock);
        if(s!=null)
        {
           if(s.getListeStock()==null)
           {
               ElementDeStock ei = new ElementDeStock(refProduit, quantite);
               List<ElementDeStock> l = new ArrayList<ElementDeStock>()  ;
               l.add(ei);
               ListeDeStock listStck = new ListeDeStock(l);
               s.setListeStock(listStck);
               return true;
           }else {
               ElementDeStock e = s.getListeStock().contient(refProduit);
                if(e==null)
                {
                    ElementDeStock newE = new ElementDeStock(refProduit, quantite);
                    s.getListeStock().getListElementStock().add(newE);
                }else
                {
                    e.setQuantite(e.getQuantite() + quantite);
                }
                return true;
           }
             
        }
        
        return false;
    }
    
    @Override
    public boolean SortieDeStock(String nomStock, String refProduit, int quantite) {
        Stock s=em.find(Stock.class, nomStock);
        if(s!=null)
        { 
           ElementDeStock e = s.getListeStock().contient(refProduit);
           if(e!=null)
           {
               e.setQuantite(e.getQuantite() - quantite);
               return true;
           }else
           {
               return false;
           }
             
        }
        return false;
    }
    
    @Override
    public boolean ModifierStock(String nomStock, String refProduit, int nouvelleQuantite) {
        Stock s=em.find(Stock.class, nomStock);
        if(s!=null)
        {
           ElementDeStock e = s.getListeStock().contient(refProduit);
           if(e!=null)
           {
               e.setQuantite(nouvelleQuantite);
               return true;
           }else
           {
               return false;
           }
             
        }
        return false;
    }
    
    public List<Stock> findAll(){
        return em.createQuery("select object(o) from Stock as o").getResultList();
    }
    
    public List<Stock> findAllByStock(String nomS){
        return em.createQuery( "SELECT object(o) from Stock as o WHERE o.NomStock = :nom")
               .setParameter("nom", nomS)
               .getResultList();
    }
    
}
