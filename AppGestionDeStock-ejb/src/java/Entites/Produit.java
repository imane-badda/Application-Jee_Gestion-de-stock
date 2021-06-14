/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entites;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author hp
 */

/**
 *
 * @author hp
 */
@Entity
public class Produit implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    private String referenceProduit;
    @ManyToOne
    public Marque marqueProduit;
    private String denomination; 
    private float prix;
    private float poids; 
    private float volume;


    public Produit(String referenceProduit, Marque marqueProduit, String denomination, float prix, float poids, float volume) {
        this.referenceProduit = referenceProduit;
        this.marqueProduit = marqueProduit;
        this.denomination = denomination;
        this.prix = prix;
        this.poids = poids;
        this.volume = volume;
    }

    public Produit() {
    }

    public String getReferenceProduit() {
        return referenceProduit;
    }

    public Marque getMarqueProduit() {
        return marqueProduit;
    }

    public String getDenomination() {
        return denomination;
    }

    public float getPrix() {
        return prix;
    }

    public float getPoids() {
        return poids;
    }

    public float getVolume() {
        return volume;
    }

    public void setReferenceProduit(String referenceProduit) {
        this.referenceProduit = referenceProduit;
    }

    public void setMarqueProduit(Marque marqueProduit) {
        this.marqueProduit = marqueProduit;
    }

    public void setDenomination(String denomination) {
        this.denomination = denomination;
    }

    public void setPrix(float prix) {
        this.prix = prix;
    }

    public void setPoids(float poids) {
        this.poids = poids;
    }

    public void setVolume(float volume) {
        this.volume = volume;
    }
    
    
}







