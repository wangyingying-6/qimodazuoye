package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 统计信息类（会员、商品总数等）
 * @author Administrator
 *
 */
public class SumInfoCrtl {
	/**
	 * 会员总数
	 * @return
	 */
	public int UserCount(){	
		int userCount = 0;//获取到User的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as UserCount from UserInfo ";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				userCount = rs.getInt("UserCount");
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return userCount;
	}
	/**
	 * 订单总数
	 * @return
	 */
	public int OrderCount(){	
		int orderCount = 0;//获取到order的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as OrderCount from OrderInfo ";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				orderCount = rs.getInt("OrderCount");
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return orderCount;
	}
	/**
	 * 新闻总数
	 * @return
	 */
	public int NewsCount(){	
		int newsCount = 0;//获取到order的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as NewsCount from NewsInfo ";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				newsCount = rs.getInt("NewsCount");
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return newsCount;
	}

}
