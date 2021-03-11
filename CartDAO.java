package fiberia_classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    public void addToCart(String username, int productId) throws Exception{
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        String sql = "INSERT INTO cart (username, productId) VALUES (?, ?);";

        try {
            
            con = db.getConnection();
            stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
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
    


    public List<Product> getProductsFromCart (String username) throws Exception{
        List<Product> products = new ArrayList<Product>();
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null ;
        String sql = "SELECT * FROM cart INNER JOIN product ON cart.productId = product.productId WHERE cart.username = ? ;";
        try {

			con = db.getConnection();
            stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
			rs = stmt.executeQuery();

			while(rs.next()) {
                products.add( new Product(rs.getInt("productId"),rs.getString("productName"), rs.getDouble("price"),rs.getString("description"),rs.getString("category"),
                rs.getString("gender"), rs.getString("size"),rs.getString("color"), rs.getString("brand"), 
                rs.getString("packaged"), rs.getString("username"),rs.getString("imageName"), rs.getString("postDate"),rs.getString("purchaseDate")));
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

    public void deleteFromCart(String username, int productId) throws Exception{
        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		String sql="DELETE FROM cart WHERE username=? and productId=? ;";
		try{
			con=db.getConnection();
			stmt=con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setInt(2, productId);
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

    public void deleteOrderProductsFromCart(int productId) throws Exception{
        
        DB db = new DB();
		Connection con = null;
        PreparedStatement stmt = null;
        
        String sql="DELETE FROM cart WHERE productId=? ;";

        try{
			con=db.getConnection();
			stmt=con.prepareStatement(sql);
            stmt.setInt(1, productId);
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

}
