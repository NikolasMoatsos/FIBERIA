package fiberia_classes;


public class Product {

    private static int counter = 0;
    private int id ;
    private String productName;
    private double price;
    private String description;
    private String category;
    private String gender;
    private String size;
    private String color;
    private String brand;
    private String packaged;
    private String username;
    private String imageName;
    private String purchaseDate;
    private String postDate;
    private int orderId;

    public Product(int id, String productName, double price, String description, String category, String gender, String size, String color, String brand, String packaged, String username, String imageName, String purchaseDate, String postDate, int orderId) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.category = category;
        this.gender = gender;
        this.size = size;
        this.color = color;
        this.brand = brand;
        this.packaged = packaged;
        this.username = username;
        this.imageName = imageName;
        this.purchaseDate = purchaseDate;
        this.postDate = postDate;
        this.orderId = orderId;
    }


    public Product(int id, String productName, double price, String description, String category, String gender, String size, String color, String brand, String packaged, String username,String imageName, String postDate, String purchaseDate) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.category = category;
        this.gender = gender;
        this.size = size;
        this.color = color;
        this.brand = brand;
        this.packaged = packaged;
        this.username = username;
        this.imageName = imageName;
        this.postDate = postDate;
        this.purchaseDate = purchaseDate;
    }

    public Product(String productName, double price, String description, String category, String gender, String size, String color, String brand, String packaged, String username,String imageName, String postDate, String purchaseDate) {
        this.id = 0;
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.category = category;
        this.gender = gender;
        this.size = size;
        this.color = color;
        this.brand = brand;
        this.packaged = packaged;
        this.username = username;
        this.imageName = imageName;
        this.postDate = postDate;
        this.purchaseDate = purchaseDate;
    }

    public Product() {
        this.id = 0;
        this.productName = "";
        this.price = 0;
        this.description = "";
        this.category = "";
        this.gender = "";
        this.size = "";
        this.color = "";
        this.brand = "";
        this.packaged = "";
        this.username = "";
    }
    

    public String getPurchaseDate() {
        return this.purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }
    
    public String getPostDate() {
        return this.postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public String getImageName() {
        return this.imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }
    public String getCategory() {
        return this.category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getProductName() {
        return this.productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getBrand() {
        return this.brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getGender() {
        return this.gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSize() {
        return this.size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return this.color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getPrice() {
        return this.price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPackaged() {
        return this.packaged;
    }

    public void setPackaged(String packaged) {
        this.packaged = packaged;
    }

    public int getOrderId() {
        if((Integer)this.orderId == null){
            return 0;
        }
        return this.orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }


    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", username='" + getUsername() + "'" +
            ", productName='" + getProductName() + "'" +
            ", brand='" + getBrand() + "'" +
            ", gender='" + getGender() + "'" +
            ", category='" + getCategory() + "'" +
            ", size='" + getSize() + "'" +
            ", color='" + getColor() + "'" +
            ", price='" + getPrice() + "'" +
            ", description='" + getDescription() + "'" +
            ", packaged='" + getPackaged() + "'" +
            ", imageName='" + getImageName() + "'" +
            ", postDate='" + getPostDate() + "'" + 
            "}";
    }


}