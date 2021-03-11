package fiberia_classes;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;





public class ProductDAO {
 
    public void register(Product product) throws Exception {
        
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        String sql = "INSERT INTO product (productName, price, description, category,gender,size,color,brand,packaged,username,imageName, postDate, purchaseDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?);";

        try {
            
            con = db.getConnection();

            stmt = con.prepareStatement(sql);
            stmt.setString(1, product.getProductName());
            stmt.setDouble(2, product.getPrice());
            stmt.setString(3, product.getDescription());
            stmt.setString(4, product.getCategory());
            stmt.setString(5, product.getGender());
            stmt.setString(6, product.getSize());
            stmt.setString(7, product.getColor());
            stmt.setString(8, product.getBrand());
            stmt.setString(9, product.getPackaged());
			stmt.setString(10, product.getUsername());
			stmt.setString(11, product.getImageName());
			stmt.setString(12, product.getPostDate());
			stmt.setString(13, product.getPurchaseDate());
            stmt.executeUpdate();
            
            stmt.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }

    }


    public Product findProduct(Integer id) throws Exception {
		DB db =new DB();
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM product WHERE productId=? ;";
		try{
			con=db.getConnection();
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, id);
			rs=stmt.executeQuery();
			if(!rs.next()){
				throw new Exception("not found");
			}
			Product product=new Product(rs.getInt("productId"),rs.getString("productName"), rs.getDouble("price"),rs.getString("description"),rs.getString("category"),rs.getString("gender"), rs.getString("size"),rs.getString("color"), rs.getString("brand"), rs.getString("packaged"), rs.getString("username"),rs.getString("imageName"),rs.getString("postDate"),rs.getString("purchaseDate"));
				rs.close();
				stmt.close();
				db.close();
				return product;
			}catch(Exception e){
				throw new Exception("e.getMessage()");
			}finally{
				try {
					db.close();
				} catch (Exception e) {				
					throw new Exception("e.getMessage()");
				}
		}		
		
	}
	
	public void deleteProduct(Integer id) throws Exception {
		DB db =new DB();
		Connection con=null;
		PreparedStatement stmt=null;
		String sql="DELETE FROM product WHERE productId=? ;";
		try{
			con=db.getConnection();
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.executeUpdate();
			stmt.close();
			db.close();
			}catch(Exception e){
				throw new Exception("e.getMessage()");
			}finally{
				try {
					db.close();
				} catch (Exception e) {				
					throw new Exception("e.getMessage()");
				}
		}		
		
    }

    public List<Product> getProducts() throws Exception {
		List<Product> products = new ArrayList<Product>();
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "select * from product ;";
		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();

			while(rs.next()) {

				products.add( new Product(rs.getInt("productId"),rs.getString("productName"), rs.getDouble("price"),rs.getString("description"),rs.getString("category"),rs.getString("gender"), rs.getString("size"),rs.getString("color"), rs.getString("brand"), rs.getString("packaged"), rs.getString("username"),rs.getString("imageName"), rs.getString("postDate"),rs.getString("purchaseDate"), rs.getInt("orderId")));
			}
			rs.close();
			stmt.close();
			db.close();
			return products;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}
    

	}
	
	public List<Product> getUserProducts(String username) throws Exception {
		List<Product> products = new ArrayList<Product>();
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM product where username = ? ;";
		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, username);
			rs=stmt.executeQuery();

			while(rs.next()) {

				products.add( new Product(rs.getInt("productId"),rs.getString("productName"), rs.getDouble("price"),rs.getString("description"),rs.getString("category"),rs.getString("gender"), rs.getString("size"),rs.getString("color"), rs.getString("brand"), rs.getString("packaged"), rs.getString("username"),rs.getString("imageName"), rs.getString("postDate"),rs.getString("purchaseDate"), rs.getInt("orderId")));
			}
			rs.close();
			stmt.close();
			db.close();
			return products;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}
    

	}
	

	public void uploadNewImage(Product product) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		String imageName=product.getImageName();
		int productId=product.getId();
		String sqlQuery="UPDATE product SET imageName= ? WHERE productId=? ;";
		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, imageName);
			stmt.setInt(2, productId);
			stmt.executeUpdate();
			stmt.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }


	}

	public void updateFields( int id,String productName,String brand,String gender,String category,String size,String color,Double price,String packaged,String discription,String purchaseDate) throws Exception{
	DB db = new DB();
	Connection con = null;
	PreparedStatement stmt = null;
	String sqlQuery="UPDATE product SET productName= ? ,price=?, description=?, category=?, gender=? ,size=? ,color=? ,brand=? ,packaged=?, purchaseDate=?  WHERE productId=? ;";
	try {
	con = db.getConnection();

	stmt = con.prepareStatement(sqlQuery);
	stmt.setString(1, productName);
	stmt.setDouble(2, price);
	stmt.setString(3, discription);
	stmt.setString(4, category);
	stmt.setString(5, gender);
	stmt.setString(6, size);
	stmt.setString(7, color);
	stmt.setString(8, brand);
	stmt.setString(9, packaged);
	stmt.setString(10, purchaseDate);
	stmt.setInt(11, id);
	stmt.executeUpdate();
	
	stmt.close();

} catch (Exception e) {
	throw new Exception(e.getMessage());
} finally {

	try {
		db.close();
	} catch (Exception e) {
		
	}

}


}
	public List<Product> getProductsByCategory(String gender,String category) throws Exception {
	List<Product> products = new ArrayList<Product>();
	DB db = new DB();
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String sqlQuery = "";
	if (category == null){
		if (gender.equals("Kid")) {
			sqlQuery ="SELECT * FROM product where gender = ?;";
		} else {
			sqlQuery = "SELECT * FROM product where gender = ?  OR gender = ? ;";
		}
	} else {
		if (gender.equals("Kid")) {
			sqlQuery = "SELECT * FROM product where gender = ? AND category = ? ;";
		} else {
		sqlQuery = "SELECT * FROM product where (gender = ? AND category = ?) OR (gender = ? AND category = ?) ;";
		}
	}
	try {

		con = db.getConnection();
		stmt = con.prepareStatement(sqlQuery);
		if (category == null){
			if (gender.equals("Kid")) {
				stmt.setString(1, gender);
			} else {
				stmt.setString(1, gender);
				stmt.setString(2, "Unisex");
			}
		} else {
			if (gender.equals("Kid")) {
				stmt.setString(1, gender);
				stmt.setString(2, category);
			} else {
				stmt.setString(1, gender);
				stmt.setString(2, category);
				stmt.setString(3, "Unisex");
				stmt.setString(4, category);
			}
		}
		rs=stmt.executeQuery();

		while(rs.next()) {

			products.add( new Product(rs.getInt("productId"),rs.getString("productName"), rs.getDouble("price"),rs.getString("description"),rs.getString("category"),rs.getString("gender"), rs.getString("size"),rs.getString("color"), rs.getString("brand"), rs.getString("packaged"), rs.getString("username"),rs.getString("imageName"), rs.getString("postDate"),rs.getString("purchaseDate"), rs.getInt("orderId")));
		}
		rs.close();
		stmt.close();
		db.close();
		return products;

	} catch (Exception e) {
		throw new Exception(e.getMessage());
	} finally {

		try {
			db.close();
		} catch (Exception e) {

		}

	}


}

}

