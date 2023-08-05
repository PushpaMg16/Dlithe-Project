package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDatabase {
	Connection con;
	
	public UserDatabase(Connection con) {
		this.con = con;
	}
	
	//user login
	public User logUser(String username, String password, String userType) {
		User user = null;
		try {
			String query = "SELECT * FROM users WHERE username=? AND password=? AND userType=? LIMIT 1";
			PreparedStatement pst = this.con.prepareStatement(query);
			pst.setString(1, username);
			pst.setString(2, password);
			pst.setString(3, userType);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setUsername(rs.getString("username"));
				user.setName(rs.getString("name"));
				user.setUserType(rs.getString("usertype"));
				user.setPassword(rs.getString("password"));
				user.setId(rs.getInt("id"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
