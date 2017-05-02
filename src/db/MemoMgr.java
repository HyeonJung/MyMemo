package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemoMgr {
	DBConnectionMgr pool;
	
	public MemoMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 메모 목록
	 * @param email
	 * @return
	 */
	public Vector<MemoBean> getMemoContent(String email) {
		Vector<MemoBean> vlist = new Vector<MemoBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select * from memo where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemoBean bean = new MemoBean();
				bean.setEmail(rs.getString("email"));
				bean.setContent(rs.getString("content"));
				bean.setDeldate(rs.getDate("deldate"));
				bean.setImportance(rs.getBoolean("importance"));
				bean.setNotidate(rs.getDate("notidate"));
				bean.setModDate(rs.getDate("ModDate"));
				bean.setRegdate(rs.getDate("regdate"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}
	
	
	/**
	 * 메모 작성
	 * @param bean
	 * @return
	 */
	public boolean WriteMemo(MemoBean bean) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert memo (content, regdate, importance, email)"
					+ "values (?, now(), ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getContent());
			pstmt.setBoolean(2, bean.getImportance());
			pstmt.setString(3, bean.getEmail());
			if(pstmt.executeUpdate() == 1){
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	/**
	 * 중요 메모 목록
	 */
	
	public int ImportanceMemo(String email) {
		int icount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "select count(*) from memo where importance='1' AND email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				icount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return icount;
	}
}
