package fiberia_classes;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ShippingDAO {
 
    public void register(String firstname, String lastname, String phone, String shippingAddress, String zipCode, String email, String username) throws Exception {
        
        int orderId = 0;
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs=null;

        String sql="SELECT max(orderId) AS orderId FROM ORDERS WHERE username=? ;";
        try{
			con=db.getConnection();
			stmt=con.prepareStatement(sql);
			stmt.setString(1, username);
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
				throw new Exception("e.getMessage() gfhsdbzdfdf");
			}finally{
				try {
					db.close();
				} catch (Exception e) {				
					throw new Exception("e.getMessage()");
				}
        }


        sql = "INSERT INTO shipping_form (firstname, lastname, phone, shippingAddress, zipCode, email, orderId) VALUES (?,?,?,?,?,?,?);";

        try {
            
            con = db.getConnection();

            stmt = con.prepareStatement(sql);
            stmt.setString(1, firstname);
            stmt.setString(2, lastname);
            stmt.setString(3, phone);
            stmt.setString(4, shippingAddress);
            stmt.setString(5, zipCode);
            stmt.setString(6, email);
            stmt.setInt(7, orderId);
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
}




       /**  sql="SELECT max(orderId) AS orderId FROM ORDERS WHERE username=?";
        try{
			con=db.getConnection();
			stmt=con.prepareStatement(sql);
			stmt.setString(1, username);
			rs=stmt.executeQuery();
			if(!rs.next()){
				throw new Exception("not found");
            }
            else{
            orderId=rs.getInt("orderId");

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

        String sqlQuery="UPDATE shipping_form SET orderId = ? WHERE firstname= ? ;";

        try {
    
            con = db.getConnection();
            stmt = con.prepareStatement(sqlQuery);
            stmt.setInt(1, orderId);
            stmt.setString(2, firstname);
            stmt.executeUpdate();
            
            
           
            stmt.close();
        } catch (Exception e) {
            throw new Exception("e.getMessage() AAAAAAAAAAAAAA");
        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }
    }

*/
