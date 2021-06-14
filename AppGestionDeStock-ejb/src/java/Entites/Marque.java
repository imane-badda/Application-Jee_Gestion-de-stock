/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entites;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author hp
 */

/**
 *
 * @author hp
 */
@Entity
public class Marque implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    
    private String nomMarque;
    private String origine ;
    @OneToMany
    public List<Produit> ListeDesProduits=new ArrayList<>(); 
 

    public Marque() {
    }


    public Marque(String nomMarque, String origine) {
        this.nomMarque = nomMarque;
        this.origine = origine;
    }

    public List<Produit> getListeDesProduits() {
        return ListeDesProduits;
    }

    public String getNomMarque() {
        return nomMarque;
    }

    public String getOrigine() {
        return origine;
    }

    public void setNomMarque(String nomMarque) {
        this.nomMarque = nomMarque;
    }

    public void setOrigine(String origine) {
        this.origine = origine;
    }

    public void setListeDesProduits(List<Produit> ListeDesProduits) {
        this.ListeDesProduits = ListeDesProduits;
    }
    
    
    
}
 







