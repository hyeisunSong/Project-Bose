package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCConnection {
	public static Connection getConn() {
		Connection con = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			con = DriverManager.getConnection(url, "hr", "hr");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	public static void close(ResultSet rs, PreparedStatement ps, Connection con) {
		try {
			if (rs != null) rs.close();
			close(ps, con);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(PreparedStatement ps, Connection con) {
		try {
			if (ps != null) ps.close();
			if (con != null) con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
