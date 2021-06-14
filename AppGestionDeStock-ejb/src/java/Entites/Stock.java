package Entites;

import JavaClasses.ListeDeStock;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Stock implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String NomStock;
    private ListeDeStock ListeStock;

    public Stock(String NomStock) {
        this.NomStock = NomStock;
    }

    public Stock() {
    }
    
    public Stock(String NomStock, ListeDeStock ListeStock) {
        this.NomStock = NomStock;
        this.ListeStock = ListeStock;
    }

   
    public void setNomStock(String NomStock) {
        this.NomStock = NomStock;
    }
    
    public String getNomStock() {
        return NomStock;
    }

    public void setListeStock(ListeDeStock ListeStock) {
        this.ListeStock = ListeStock;
    }

    public ListeDeStock getListeStock() {
        return ListeStock;
    }
    
    
}
