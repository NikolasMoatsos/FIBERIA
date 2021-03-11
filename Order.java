package fiberia_classes;

public class Order {

    private int id;
    private String purchaseDate;
    private String buyer;
    private Double total;

    public Order(int id, String purchaseDate, String buyer, Double total) {
        this.id = id;
        this.purchaseDate = purchaseDate;
        this.buyer = buyer;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getBuyer() {
        return buyer;
    }

    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Order [buyer=" + buyer + ", id=" + id + ", purchaseDate=" + purchaseDate + ", total=" + total + "]";
    }
    

    
}

