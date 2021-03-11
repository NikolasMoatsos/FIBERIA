package fiberia_classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WishlistDAO {

    public void addToWishlist(String username, int productId) throws Exception{
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        String sql = "INSERT INTO WISHLIST (username, productId) VALUES (?, ?);";

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
    


    public List<Product> getProductsFromWishlist (String username) throws Exception{
        List<Product> products = new ArrayList<Product>();
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null ;
        String sql = "SELECT * FROM WISHLIST INNER JOIN product ON WISHLIST.productId = product.productId WHERE WISHLIST.username = ? ;";
        try {

			con = db.getConnection();
            stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
			rs = stmt.executeQuery();

			while(rs.next()) {
				products.add( new Product(rs.getInt("productId"),rs.getString("productName"), rs.getDouble("price"),rs.getString("description"),rs.getString("category"),rs.getString("gender"), rs.getString("size"),rs.getString("color"), rs.getString("brand"), rs.getString("packaged"), rs.getString("username"),rs.getString("imageName"), rs.getString("postDate"),rs.getString("purchaseDate"),rs.getInt("orderId")));
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

    public void deleteFromWishlist(String username, int productId) throws Exception{
        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		String sql="DELETE FROM WISHLIST WHERE username=? and productId=? ;";
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

    public void deleteOrderProductsFromWhishlist(int productId) throws Exception{
        
        DB db = new DB();
		Connection con = null;
        PreparedStatement stmt = null;
        
        String sql="DELETE FROM wishlist WHERE productId=? ;";

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
