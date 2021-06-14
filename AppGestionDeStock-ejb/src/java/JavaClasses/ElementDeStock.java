
package JavaClasses;

import java.io.Serializable;

public class ElementDeStock implements Serializable{
    private String RefProduit ;
    private int Quantite;

    public ElementDeStock(String RefProduit, int Quantite) {
        this.RefProduit = RefProduit;
        this.Quantite = Quantite;
    }

    public String getRefProduit() {
        return RefProduit;
    }

    public int getQuantite() {
        return Quantite;
    }

    public void setRefProduit(String RefProduit) {
        this.RefProduit = RefProduit;
    }

    public void setQuantite(int Quantite) {
        this.Quantite = Quantite;
    }
    
    
}
