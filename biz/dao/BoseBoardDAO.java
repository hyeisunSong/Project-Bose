package biz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import biz.vo.BoseBoardVO;
import biz.vo.BoseCateVO;
import common.JDBCConnection;

public class BoseBoardDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public void insertBoard(BoseBoardVO vo) {
		try {
			 con = JDBCConnection.getConn();
			 String sql = "insert into bose_board(seq, title, writer, content, password, id, cate_no) values(bose_board_seq.nextval, ?, ?, ?, ?, ?, ?)";
			 ps = con.prepareStatement(sql);
			 ps.setString(1, vo.getTitle());
			 ps.setString(2, vo.getWriter());
			 ps.setString(3, vo.getContent());
			 ps.setString(4, vo.getPassword());
			 ps.setString(5, vo.getId());
			 ps.setInt(6, vo.getCate_no());
			 
			 ps.executeUpdate();
			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(ps, con);
		}
	} //
	
	public List<BoseBoardVO> selectAllBoard(int start, int end, int cateNo, String searchText) {
		List<BoseBoardVO> list = new ArrayList<>();
		BoseBoardVO vo = null;
		int cnt = 1;
		
		try {
			con = JDBCConnection.getConn();
			String sql = "select * from (select row_number() over(order by b.seq desc) r, b.*, c.cate_name from bose_board b, bose_category c where b.cate_no = c.cate_no";
			if (cateNo > 1) sql += " and c.cate_no = ?";
			if (searchText != null) sql += " and title like '%" + searchText + "%'";
			sql += ") where r between ? and ?";
			
			ps = con.prepareStatement(sql);
			if (cateNo > 1) ps.setInt(cnt++, cateNo);
			ps.setInt(cnt++, start);
			ps.setInt(cnt++, end);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				vo = new BoseBoardVO();
				vo.setSeq(rs.getInt("seq"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setContent(rs.getString("content"));
				vo.setReg_date(rs.getDate("reg_date"));
				vo.setPassword(rs.getString("password"));
				vo.setUsertype(rs.getString("usertype"));
				vo.setId(rs.getString("id"));
				vo.setCate_no(rs.getInt("cate_no"));
				vo.setCate_name(rs.getString("cate_name"));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, ps, con);
		}
		
		return list;
	} // 
	
	public BoseBoardVO selectOneBoard(int seq) {
		BoseBoardVO vo = null;
		
		try {
			con = JDBCConnection.getConn();
			String sql = "select * from bose_board b, bose_category c where b.cate_no = c.cate_no and seq = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, seq);
			rs = ps.executeQuery();
			if (rs.next()) {
				vo = new BoseBoardVO();
				vo.setSeq(rs.getInt("seq"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setContent(rs.getString("content"));
				vo.setReg_date(rs.getDate("reg_date"));
				vo.setPassword(rs.getString("password"));
				vo.setUsertype(rs.getString("usertype"));
				vo.setId(rs.getString("id"));
				vo.setCate_no(rs.getInt("cate_no"));
				vo.setCate_name(rs.getString("cate_name"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, ps, con);
		}
		
		return vo;
	} // 
	
	public List<BoseCateVO> getAllCategory() {
		List<BoseCateVO> list = new ArrayList<>();
		BoseCateVO vo = null;
		
		try {
			con = JDBCConnection.getConn();
			String sql = "select * from bose_category";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				vo = new BoseCateVO();
				vo.setCate_no(rs.getInt("cate_no"));
				vo.setCate_name(rs.getString("cate_name"));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, ps, con);
		}
		
		return list;
	} //
	
	public int totalBoardCnt(int cateNo, String searchText) {
		int result = 0;
		try {
			con = JDBCConnection.getConn();
			String sql = "select count(*) from bose_board b, bose_category c where b.cate_no = c.cate_no";
			if (cateNo > 1) sql += " and c.cate_no = " + cateNo;
			if (searchText != null) sql += " and title like '%" + searchText + "%'";
			ps = con.prepareStatement(sql);
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
	} //
	
	public int deleteBoard(int seq) {
		int result = 0;
		try {
			 con = JDBCConnection.getConn();
			 String sql = "delete from bose_board where seq = ?";
			 ps = con.prepareStatement(sql);
			 ps.setInt(1, seq);
			 result = ps.executeUpdate();
			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(ps, con);
		}
		
		return result;
	} //
	
	public int updateBoard(BoseBoardVO vo) {
		int result = 0;
		try {
			 con = JDBCConnection.getConn();
			 String sql = "update bose_board set title = ?, content = ?, password = ?, cate_no = ? where seq = ?";
			 ps = con.prepareStatement(sql);
			 ps.setString(1, vo.getTitle());
			 ps.setString(2, vo.getContent());
			 ps.setString(3, vo.getPassword());
			 ps.setInt(4, vo.getCate_no());
			 ps.setInt(5, vo.getSeq());
			 
			 result = ps.executeUpdate();
			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(ps, con);
		}
		
		return result;
	}
}
