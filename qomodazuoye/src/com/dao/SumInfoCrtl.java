package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * ͳ����Ϣ�ࣨ��Ա����Ʒ�����ȣ�
 * @author Administrator
 *
 */
public class SumInfoCrtl {
	/**
	 * ��Ա����
	 * @return
	 */
	public int UserCount(){	
		int userCount = 0;//��ȡ��User������
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
	 * ��������
	 * @return
	 */
	public int OrderCount(){	
		int orderCount = 0;//��ȡ��order������
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
	 * ��������
	 * @return
	 */
	public int NewsCount(){	
		int newsCount = 0;//��ȡ��order������
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
