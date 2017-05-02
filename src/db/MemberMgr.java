package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;


public class MemberMgr {
	DBConnectionMgr pool;
	
	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean MemberSignUp(MemberBean member) {
		String sql = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean complete = false;
		try {
			con = pool.getConnection();
			sql = "insert member (email, name, pass, regDate)"
					+ "values (?, ?, ?, now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPass());
			if(pstmt.executeUpdate() == 1)
				complete = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return complete;
	}
	
	public boolean MemberLogin(String email, String pass) {
		String sql = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean complete = false;
		try {
			con = pool.getConnection();
			sql = "select name from member where email=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			complete = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return complete;
	}
	
	public int totalMemo(String email) {
		String sql = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = -1;
		try {
			con = pool.getConnection();
			sql = "select count(*) from memo where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return count;	
	}
	
	
}
