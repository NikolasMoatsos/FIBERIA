package fiberia_classes;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class OrderDAO {
        public void addOrder(String buyer, String purchaseDate) throws Exception{
            DB db = new DB();
            Connection con = null;
            PreparedStatement stmt = null;
            int orderId = 0;
            ResultSet rs=null;
            CartDAO cartdao= new CartDAO();
            List<Product> products = new ArrayList<Product>();
            products = cartdao.getProductsFromCart(buyer);
            List<Integer> ids= new ArrayList<Integer>();
            int total = 0;
            for( Product prod:products){
                total+=prod.getPrice();

            }
            
            String sql="INSERT INTO orders(orderId, orderDate,orderTotal,username) VALUES (?, ?, ?, ?);";
            try {
            
                con = db.getConnection();
    
                stmt = con.prepareStatement(sql);
                stmt.setInt(1, 0);
                stmt.setString(2, purchaseDate);
                stmt.setDouble(3, total);
                stmt.setString(4, buyer);
                stmt.executeUpdate();
                
                stmt.close();
    
            } catch (Exception e) {
                throw new Exception("e.getMessage()");
            } finally {
    
                try {
                    db.close();
                } catch (Exception e) {
                }
    
            }
        
        sql="SELECT max(orderId) AS orderId FROM ORDERS WHERE username=? ;";
        try{
			con=db.getConnection();
			stmt=con.prepareStatement(sql);
			stmt.setString(1, buyer);
			rs=stmt.executeQuery();
			if(!rs.next()){
				throw new Exception("not found");
            }
            else{ 
                orderId = rs.getInt("orderId"); 
            
                rs.close();
				stmt.close();
				db.close();
             }
			}catch(Exception e){
				throw new Exception("e.getMessage()");
			}finally{
				try {
					db.close();
				} catch (Exception e) {				
					throw new Exception("e.getMessage()");
				}
        }

        CartDAO cartdao1 = new CartDAO();
        WishlistDAO wishlistdao = new WishlistDAO();

        for(Product prod : products) {
            ids.add(prod.getId());
            prod.setOrderId(orderId);
        }
        for(int id:ids){
            String sqlQuery="UPDATE product SET orderId= ? WHERE productId=? ;";
            try {
    
                con = db.getConnection();
                stmt = con.prepareStatement(sqlQuery);
                stmt.setInt(1, orderId);
                stmt.setInt(2, id);
                stmt.executeUpdate();
                
                
               
                stmt.close();
            } catch (Exception e) {
                throw new Exception("e.getMessage()");
            } finally {
                
                try {
                    db.close();
                } catch (Exception e) {
                    
                }
    
            }

            cartdao.deleteOrderProductsFromCart(id);
            wishlistdao.deleteOrderProductsFromWhishlist(id);

        }
        }
    public List<Integer> findOrderIdsofuser(String username) throws Exception{
        List<Integer> ids = new ArrayList<Integer>();
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null ;
        String sql="SELECT orderId FROM orders WHERE username=?;";
        try {

			con = db.getConnection();
            stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
			rs = stmt.executeQuery();

			while(rs.next()) {
				ids.add( rs.getInt("orderId"));
			}
			rs.close();
			stmt.close();
			db.close();
			return ids;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

    }

    public List<Product> getProductsFromOrder(int orderId) throws Exception{
        List<Product> products = new ArrayList<Product>();
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null ;
        String sql = "SELECT * FROM product WHERE orderId=? ;";
        try {

			con = db.getConnection();
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, orderId);
			rs = stmt.executeQuery();

			while(rs.next()) {
				products.add( new Product(rs.getInt("productId"),rs.getString("productName"), rs.getDouble("price"),rs.getString("description"),rs.getString("category"),rs.getString("gender"), rs.getString("size"),rs.getString("color"), rs.getString("brand"), rs.getString("packaged"), rs.getString("username"),rs.getString("imageName"), rs.getString("postDate"),rs.getString("purchaseDate")));
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

    public Order findorder(int orderId) throws Exception{
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null ;
        String sql = "SELECT * FROM orders WHERE orderId=? ;";
        try {

			con = db.getConnection();
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, orderId);
			rs = stmt.executeQuery();

			if(!rs.next()){
				throw new Exception("not found");
			}
			Order order=new Order(rs.getInt("orderId"),rs.getString("orderDate"),rs.getString("username"),rs.getDouble("orderTotal"));
			rs.close();
			stmt.close();
			db.close();
			return order;

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
    
    
