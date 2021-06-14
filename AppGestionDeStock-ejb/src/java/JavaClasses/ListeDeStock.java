package JavaClasses;

import java.io.Serializable;
import java.util.List;


public class ListeDeStock implements Serializable{
    private List<ElementDeStock> ListElementStock;

    public ListeDeStock(List<ElementDeStock> ListElementStock) {
        this.ListElementStock = ListElementStock;
    }

    public List<ElementDeStock> getListElementStock() {
        return ListElementStock;
    }

    public void setListElementStock(List<ElementDeStock> ListElementStock) {
        this.ListElementStock = ListElementStock;
    }

    public ElementDeStock contient(String refProd) {
        for(int i=0; i<ListElementStock.size(); i++){
            if(ListElementStock.get(i).getRefProduit().equals(refProd))
                return ListElementStock.get(i);
        }
        return null;
    }
    
}
