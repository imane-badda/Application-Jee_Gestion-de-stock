/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjbSession;

import Entites.Marque;
import Entites.Produit;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author hp
 */
@Stateless
public class ProduitFacade extends AbstractFacade<Produit> implements ProduitFacadeLocal {

    @PersistenceContext(unitName = "AppGestionDeStock-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProduitFacade() {
        super(Produit.class);
    }
    
    
    public boolean createP(Produit p){
        Produit pd = em.find(Produit.class, p.getReferenceProduit());
        if(pd==null){
            Marque m = em.find(Marque.class, p.getMarqueProduit().getNomMarque());
            if(m!=null){
                Produit pdt = new Produit();
                pdt=p;
                em.persist(p);
                return true;
            }else
                return false;
        }
        return false;
    }
    
    @Override
    public List<Produit> findAll(){
        return em.createQuery("select object(o) from Produit as o").getResultList();
    }

    
    @Override
    public boolean editP(Produit p){
        Produit pd = em.find(Produit.class, p.getReferenceProduit());
        if(pd!=null)
        {
            pd.setDenomination(p.getDenomination());
            pd.setMarqueProduit(p.getMarqueProduit());
            pd.setPoids(p.getPoids());
            pd.setVolume(p.getVolume());
            pd.setPrix(p.getPrix());
            em.persist(pd);
            return true;
        }
        return false;
    }

    @Override
    public boolean remove(String nom){
        Produit pExist=em.find(Produit.class, nom);
       if(pExist!=null){
        em.remove(pExist);
        return true;
       }else 
           return false;
    }
    
    @Override
    public List<Produit> findAllByMarque(String nomM){
        return em.createQuery( "SELECT object(o) from Produit as o WHERE o.marqueProduit.nomMarque = :marque")
               .setParameter("marque", nomM)
               .getResultList();
    }
}
