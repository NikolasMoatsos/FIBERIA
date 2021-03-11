package fiberia_classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {	

    public User authenticate(String email, String password) throws Exception {
		
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sqlQuery = "SELECT * FROM web_user WHERE email=? AND password=?;";
		
		try{
			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, email);
			stmt.setString(2, password);
			rs = stmt.executeQuery();

			if (!rs.next()) {
				throw new Exception("Wrong email or password");
			}
			User user = new User(rs.getString("name"),rs.getString("surname"),
			rs.getString("username"),rs.getString("password"), rs.getString("email"));
			

			rs.close();
			stmt.close();

			return user;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {
				throw new Exception(e.getMessage());
			}

		}
		
	}

	public void register(User user) throws Exception {
		

		/* Quest 1 - D */
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		String checkSql = "SELECT * FROM web_user WHERE username = ? OR email = ?";
		try{
			con = db.getConnection();
			stmt = con.prepareStatement(checkSql);
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getEmail());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()){
				rs.close();
                stmt.close();
				throw new Exception("username or email already registered");
			} else {
				rs.close();
				String sqlQuery = "INSERT INTO web_user (username,name,surname,email,password) VALUES (?,?,?,?,?);";
				stmt = con.prepareStatement(sqlQuery);
				stmt.setString(1, user.getUsername());
				stmt.setString(2, user.getName());
				stmt.setString(3, user.getSurname());
				stmt.setString(4, user.getEmail());
				stmt.setString(5, user.getPassword());
				stmt.executeUpdate();
				stmt.close();
			}
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			try {
				db.close();
			} catch (Exception e) {
				throw new Exception(e.getMessage());
			}

		}
		
	}//end of register

}