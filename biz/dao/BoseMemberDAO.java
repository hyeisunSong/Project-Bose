package biz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import biz.vo.BoseMemberVO;
import common.JDBCConnection;

public class BoseMemberDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public int insertMember(BoseMemberVO vo) {
		int result = 0;
		
		try {
			 con = JDBCConnection.getConn();
			 String sql = "insert into bose_member values(?, ?, ?, ?, ?, ?)";
			 ps = con.prepareStatement(sql);
			 ps.setString(1, vo.getId());
			 ps.setString(2, vo.getPassword());
			 ps.setString(3, vo.getName());
			 ps.setString(4, vo.getBirth());
			 ps.setString(5, vo.getGender());
			 ps.setString(6, vo.getPhone());
			 
			 result = ps.executeUpdate();
			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(ps, con);
		}
		
		return result;
	}// 
	
	public BoseMemberVO login(String id, String pw) {
		BoseMemberVO vo = null;
		
		try {
			con = JDBCConnection.getConn();
			String sql = "select * from bose_member where (substr(id, 0, instr(id, '@')-1) = ? or id = ?) and password = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, id);
			ps.setString(3, pw);
			rs = ps.executeQuery();
			if (rs.next()) {
				vo = new BoseMemberVO();
				vo.setId(rs.getString("id"));
				vo.setPassword(rs.getString("password"));
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setGender(rs.getString("gender"));
				vo.setPhone(rs.getString("phone"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, ps, con);
		}
		
		return vo;
	}//
	
	public int idCheck(String id) {
		int result = 0;
		
		try {
			con = JDBCConnection.getConn();
			String sql = "select count(*) from bose_member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, ps, con);
		}
		
		return result;
	}
}
