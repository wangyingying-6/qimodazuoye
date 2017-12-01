package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.entity.Admin_NewsInfo;
import com.entity.UserInfo;

/**
 * 用户信息操作类
 * @author Administrator
 *
 */
public class UserCrtl {
	/**
	 * 用户注册方法
	 * @param user
	 * @return
	 */
	public int addUser(UserInfo user){
		int res =0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt =null;
		String sql ="insert into UserInfo  values(?,?,?,?,?,?,?,?,?,?,default,default)";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, user.getUsername());
				stmt.setString(2, user.getUserpwd());
				stmt.setString(3, user.getUserxm());
				stmt.setInt(4, user.getUsersex());
				stmt.setDouble(5, 0);
				stmt.setString(6, user.getUseremail());
				stmt.setString(7, user.getUseryb());
				stmt.setString(8, user.getUseraddr());
				stmt.setString(9, user.getUserphone());
				stmt.setString(10, user.getUsersj());
				res =stmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				ConnDB.close(null, stmt, conn);
			}
		return res;
	}
	/**
	 * 用户登录方法
	 * @param userName
	 * @param userPwd
	 * @return
	 */
	public UserInfo login(String userName,String userPwd){
			UserInfo user =null;
			Connection conn =ConnDB.getConn();
			ResultSet rs =null;
			Statement stmt =null;
			String sql ="select * from UserInfo where username='"+userName+"' and userpwd='"+userPwd+"'";
				try {
					stmt=conn.createStatement();
					rs=stmt.executeQuery(sql);
					if(rs.next()){
						user = new UserInfo();
						user.setUserId(rs.getInt("userId"));
						user.setUsername(rs.getString("userName"));
						user.setUserzt(rs.getInt("userZt"));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					ConnDB.close(rs, stmt, conn);
				}
				
			return user;
		
	}
	/**
	 * 修改用户 资料方法
	 */
	public int updateUser(UserInfo user){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String sql = "update UserInfo set userXm=?,userSex=?,userEmail=?,userPhone=?,userSj=?,userAddr=?,userYb=?" +" where userId=?";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, user.getUserxm());
				stmt.setInt(2, user.getUsersex());
				stmt.setString(3, user.getUseremail());
				stmt.setString(4, user.getUserphone());
				stmt.setString(5, user.getUsersj());
				stmt.setString(6, user.getUseraddr());
				stmt.setString(7, user.getUseryb());
				stmt.setInt(8, user.getUserId());
				res = stmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				ConnDB.close(null, stmt, conn);
			}
		
		return res;
		
	}
	/**
	 * 修改用户收货地址
	 * @param user
	 * @return
	 */
	public int updateAddr(int userId,int userYb,String userAddr ){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String sql = "update UserInfo set userYb=?,userAddr=?" +" where userId=?";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setInt(1, userYb);
				stmt.setString(2, userAddr);
				stmt.setInt(3, userId);
				res = stmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				ConnDB.close(null, stmt, conn);
			}
		
		return res;
		
	}
	/**
	 * 查询用户旧密码方法
	 * @param userName
	 * @param userPwd
	 * @return
	 */
	public UserInfo setuserPwd(int userId){
		UserInfo user =null;
		Connection conn =ConnDB.getConn();
		ResultSet rs =null;
		Statement stmt =null;
		String sql ="select userPwd from UserInfo where userId="+userId;
			try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				if(rs.next()){
					user = new UserInfo();					
					user.setUserpwd(rs.getString("userPwd"));					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				ConnDB.close(rs, stmt, conn);
			}
			
		return user;
	
	}
	/**
	 * 根据Id查询用户信息
	 * @param userId
	 * @return
	 */
	/**
	 * @param userId
	 * @return
	 */
	public UserInfo selUser(int userId){
		UserInfo user = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from UserInfo where userId=" + userId;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){				
				user = new UserInfo();				
				user.setUsername(rs.getString("userName"));
				user.setUserpwd(rs.getString("userPwd"));
				user.setUserxm(rs.getString("userXm"));
				user.setUsersex(rs.getInt("userSex"));
				user.setUserye(rs.getDouble("userYe"));
				user.setUseremail(rs.getString("userEmail"));
				user.setUseryb(rs.getString("userYb"));
				user.setUseraddr(rs.getString("userAddr"));
				user.setUserphone(rs.getString("userPhone"));
				user.setUsersj(rs.getString("userSj"));
				user.setUserdate(rs.getString("userDate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}		
		return user;
	}
	/**
	 * 修改用户密码方法
	 * @param userId
	 * @param userYb
	 * @param userAddr
	 * @return
	 */
	public int updatePwd(int userId,String userPwd){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String sql = "update UserInfo set userPwd=?" +" where userId=?";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, userPwd);
				stmt.setInt(2, userId);
				res = stmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				ConnDB.close(null, stmt, conn);
			}
		
		return res;
		
	}
	/**
	 * 查询最新新闻方法
	 * @return
	 */
	public ArrayList<Admin_NewsInfo> selNews(){
		ArrayList<Admin_NewsInfo> anews = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select top 10 * from NewsInfo order by newsId desc";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				if(anews == null){
					anews = new ArrayList<Admin_NewsInfo>();
				}
				Admin_NewsInfo news = new Admin_NewsInfo();
				news.setNewsId(rs.getInt("newsId"));
				news.setNewstitle(rs.getString("newsTitle"));								
				anews.add(news);	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		
		return anews;
	}
	
}
