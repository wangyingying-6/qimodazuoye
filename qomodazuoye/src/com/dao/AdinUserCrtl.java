package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.entity.Admin_NewsInfo;
import com.entity.Admin_UserInfo;
import com.entity.GoodsSort;
import com.entity.ImgInfo;
import com.entity.SiteInfo;
import com.entity.UserInfo;
/**
 * 后台功能类
 * @author Administrator
 *
 */
public class AdinUserCrtl {
	
	/*==用户列表数据分页==*/
	/**
	 * 根据当前页数和每页显示的行数来查询相应的结果
	 * 
	 * @param pageSize
	 *            每页显示的行数
	 * @param pageNow
	 *            当前的页数
	 * @return
	 */
	public ArrayList<UserInfo> getUserForPage(int pageSize, int pageNow) {
		ArrayList<UserInfo> al = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select Top " + pageSize
				+ " * from UserInfo where userId not in(select Top (" + pageSize
				+ " * (" + pageNow + "- 1)) userId from UserInfo)";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				if(al==null){
					al=new ArrayList<UserInfo>();					
				}
				UserInfo userinfo = new UserInfo();
				userinfo.setUserId(rs.getInt("userId"));
				userinfo.setUsername(rs.getString("userName"));				
				userinfo.setUserpwd(rs.getString("userPwd"));
				userinfo.setUserxm(rs.getString("userXm"));
				userinfo.setUsersex(rs.getInt("userSex"));
				userinfo.setUserye(rs.getDouble("userYe"));
				userinfo.setUseremail(rs.getString("userEmail"));
				userinfo.setUseryb(rs.getString("userYb"));
				userinfo.setUseraddr(rs.getString("userAddr"));	
				userinfo.setUserphone(rs.getString("userPhone"));
				userinfo.setUsersj(rs.getString("userSj"));
				userinfo.setUserdate(rs.getString("userDate"));
				userinfo.setUserzt(rs.getInt("userZt"));
				al.add(userinfo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return al;
	}
	/**
	 * 获取总页数
	 * @param pageSize
	 * @return
	 */
	public int getPageCount(int pageSize){
		int pageCount = 0;
		int userCount = 0;//获取到用户的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as userCount from UserInfo";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				userCount = rs.getInt("userCount");
			}
			//页数计算
			if(userCount % pageSize == 0){
				pageCount = userCount / pageSize;
			}else{
				pageCount = userCount / pageSize + 1; 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return pageCount;
	}
	/**
	 * 修改用户资料方法
	 */
	public int updateUser(UserInfo user){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String sql = "update UserInfo set userName=?,userPwd=?,userXm=?,userSex=?,userEmail=?,userYb=?,userAddr=?,userPhone=?,userSj=?" +" where userId=?";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, user.getUsername());
				stmt.setString(2, user.getUserpwd());
				stmt.setString(3, user.getUserxm());
				stmt.setInt(4, user.getUsersex());
				stmt.setString(5, user.getUseremail());
				stmt.setString(6, user.getUseryb());
				stmt.setString(7, user.getUseraddr());
				stmt.setString(8, user.getUserphone());
				stmt.setString(9, user.getUsersj());				
				stmt.setInt(10, user.getUserId());
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
	 * 根据ID删除用户信息
	 * @param userId
	 * @return
	 */
	public int deleteUser(int userId){
		int res = 0;
		String sql = "delete UserInfo where userId=?";
		Connection conn = ConnDB.getConn();
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,  userId);
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
	 * 查询用户余额方法
	 * @param userName
	 * @param userPwd
	 * @return
	 */
	public UserInfo setuserYe(int userId){
		UserInfo user =null;
		Connection conn =ConnDB.getConn();
		ResultSet rs =null;
		Statement stmt =null;
		String sql ="select userYe from UserInfo where userId="+userId;
			try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				if(rs.next()){
					user = new UserInfo();
					user.setUserye(rs.getDouble("userYe"));
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
	 * 修改用户余额方法(充值/扣款)
	 * @param userId
	 * @param userYb
	 * @param userAddr
	 * @return
	 */
	public int updateYe(int userId,Double userYe){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String sql = "update UserInfo set userYe=?" +" where userId=?";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setDouble(1, userYe);
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
	 * 修改用户状态方法
	 */
	public int updateZt(int userId,int userZt){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String sql = "update UserInfo set userZt=?" +" where userId=?";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setInt(1, userZt);
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
	 * 查询所有管理员
	 * @return
	 */
	public ArrayList<Admin_UserInfo> selUser(){
		ArrayList<Admin_UserInfo> al = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from admin_UserInfo";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				if(al == null)
					al = new ArrayList<Admin_UserInfo>();
					Admin_UserInfo auser = new Admin_UserInfo();
					auser.setAdmin_userId(rs.getInt("admin_userId"));
					auser.setAdmin_username(rs.getString("admin_userName"));
					auser.setAdmin_userpwd(rs.getString("admin_userPwd"));				
					al.add(auser);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		
		return al;
	}
	/**
	 * 添加管理员方法
	 * @param user
	 * @return
	 */
	public int addAdmin_User(Admin_UserInfo auser){
		int res =0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt =null;
		String sql ="insert into admin_UserInfo values(?,?)";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, auser.getAdmin_username());
				stmt.setString(2, auser.getAdmin_userpwd());
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
	 * 修改后台管理员资料方法
	 */
	public int updateAdmin_User(Admin_UserInfo auser){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String sql = "update admin_UserInfo set admin_userName=?,admin_userPwd=?" +" where admin_userId=?";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, auser.getAdmin_username());
				stmt.setString(2, auser.getAdmin_userpwd());
				stmt.setInt(3, auser.getAdmin_userId());
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
	 * 根据ID查询管理员方法
	 * @param userId
	 * @return
	 */
	public Admin_UserInfo selUser2(int userId){
		Admin_UserInfo auser = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from admin_UserInfo where admin_userId=" + userId;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){				
				auser = new Admin_UserInfo();				
				auser.setAdmin_username(rs.getString("admin_userName"));
				auser.setAdmin_userpwd(rs.getString("admin_userPwd"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}		
		return auser;
	}
	/**
	 * 根据ID删除后台管理员
	 * @param userId
	 * @return
	 */
	public int deleteAdmin_User(int userId){
		int res = 0;
		String sql = "delete admin_UserInfo where admin_userId=?";
		Connection conn = ConnDB.getConn();
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,  userId);
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
	 * 后台管理员登录方法
	 * @param userName
	 * @param userPwd
	 * @return
	 */
	public Admin_UserInfo login(String userName,String userPwd){
			Admin_UserInfo user =null;
			Connection conn =ConnDB.getConn();
			ResultSet rs =null;
			Statement stmt =null;
			String sql ="select * from admin_UserInfo where admin_userName='"+userName+"' and admin_userPwd='"+userPwd+"'";
				try {
					stmt=conn.createStatement();
					rs=stmt.executeQuery(sql);
					if(rs.next()){
						user = new Admin_UserInfo();						
						user.setAdmin_username(rs.getString("admin_userName"));						
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
	 * 添加新闻方法
	 * @param user
	 * @return
	 */
	public int Admin_addNews(Admin_NewsInfo news){
		int res =0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt =null;
		String sql ="insert into NewsInfo values(?,?,default)";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, news.getNewstitle());
				stmt.setString(2, news.getNewscontent());
				res =stmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				ConnDB.close(null, stmt, conn);
			}
		return res;
	}
	/*==新闻列表数据分页==*/
	/**
	 * 根据当前页数和每页显示的行数来查询相应的结果
	 * 
	 * @param pageSize
	 *            每页显示的行数
	 * @param pageNow
	 *            当前的页数
	 * @return
	 */
	public ArrayList<Admin_NewsInfo> getNewsForPage(int pageSize, int pageNow) {
		ArrayList<Admin_NewsInfo> anews = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select Top " + pageSize
				+ " * from NewsInfo where newsId not in(select Top (" + pageSize
				+ " * (" + pageNow + "- 1)) newsId from NewsInfo)";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				if(anews==null){
					anews=new ArrayList<Admin_NewsInfo>();					
				}
				Admin_NewsInfo news = new Admin_NewsInfo();
				news.setNewsId(rs.getInt("newsId"));
				news.setNewstitle(rs.getString("newsTitle"));				
				news.setNewsdate(rs.getString("newsDate"));
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
	/**
	 * 获取总页数
	 * @param pageSize
	 * @return
	 */
	public int getNewsCount(int pageSize){
		int pageCount = 0;
		int newsCount = 0;//获取到新闻列表的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as newsCount from NewsInfo";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				newsCount = rs.getInt("newsCount");
			}
			//页数计算
			if(newsCount % pageSize == 0){
				pageCount = newsCount / pageSize;
			}else{
				pageCount = newsCount / pageSize + 1; 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return pageCount;
	}
	/**
	 * 根据ID查询新闻方法
	 * @param userId
	 * @return
	 */
	public Admin_NewsInfo selNews(int newsId){
		Admin_NewsInfo news = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from NewsInfo where newsId=" + newsId;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){				
				news = new Admin_NewsInfo();				
				news.setNewstitle(rs.getString("newsTitle"));
				news.setNewscontent(rs.getString("newsContent"));
				news.setNewsdate(rs.getString("newsDate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}		
		return news;
	}
	/**
	 * 修改新闻资料方法
	 */
	public int updateNews(Admin_NewsInfo news){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String sql = "update NewsInfo set newsTitle=?,newsContent=?" +" where newsId=?";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, news.getNewstitle());
				stmt.setString(2, news.getNewscontent());
				stmt.setInt(3, news.getNewsId());
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
	 * 根据ID删除新闻
	 * @param userId
	 * @return
	 */
	public int deleteNews(int newsId){
		int res = 0;
		String sql = "delete NewsInfo where newsId=?";
		Connection conn = ConnDB.getConn();
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,  newsId);
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
	 * 查询网站基本信息方法
	 * @return
	 */
	public SiteInfo setSite(){
		SiteInfo site =null;
		Connection conn =ConnDB.getConn();
		ResultSet rs =null;
		Statement stmt =null;
		String sql ="select * from SiteInfo";
			try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				if(rs.next()){
					site = new SiteInfo();
					site.setSitename(rs.getString("siteName"));
					site.setIcpnumber(rs.getString("icpNumber"));					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				ConnDB.close(rs, stmt, conn);
			}
			
		return site;
	
	}
	/**
	 * 修改网站信息方法
	 * @param site
	 * @return
	 */
	public int updateSite(SiteInfo site){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String sql = "update SiteInfo set siteName=?,icpNumber=?";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, site.getSitename());
				stmt.setString(2, site.getIcpnumber());				
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
	 * 查询LOGO图片方法
	 * @return
	 */
	public ImgInfo setLogoImg(){
		ImgInfo img =null;
		Connection conn =ConnDB.getConn();
		ResultSet rs =null;
		Statement stmt =null;
		String sql ="select * from ImgInfo where imgName='Logoimg'";
			try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				if(rs.next()){
					img = new ImgInfo();
					img.setLogoaddr(rs.getString("imgAddr"));										
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				ConnDB.close(rs, stmt, conn);
			}
			
		return img;
	
	}
	/**
	 * 修改网站LOGO图片方法
	 * @param img
	 * @return
	 */
	public int updateLogoImg(ImgInfo img){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String sql = "update ImgInfo set imgAddr=? where imgName='Logoimg'";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1,img.getLogoaddr());						
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
	 * 添加轮播图片方法
	 * @param img
	 * @return
	 */
	public int addLunboImg(ImgInfo img){
		int res =0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt =null;
		String LunboImg="LunboImg";
		String sql ="insert into ImgInfo values(?,?,?)";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, LunboImg);
				stmt.setString(2, img.getLunboaddr());
				stmt.setString(3, img.getImghref());
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
	 * 查询所有轮播图片
	 * @return
	 */
	public ArrayList<ImgInfo> selLunboImg(){
		ArrayList<ImgInfo> aimg = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from ImgInfo where imgName='LunboImg'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				if(aimg == null)
					aimg = new ArrayList<ImgInfo>();
					ImgInfo img = new ImgInfo();
					img.setImgId(rs.getInt("imgId"));
					img.setLunboaddr(rs.getString("imgAddr"));
					img.setImghref(rs.getString("imgHref"));								
					aimg.add(img);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		
		return aimg;
	}
	/**
	 * 根据ID查询轮播图片方法
	 * @param imgId
	 * @return
	 */
	public ImgInfo selLunbo(int imgId){
		ImgInfo img = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from ImgInfo where imgId=" + imgId;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){				
				img = new ImgInfo();				
				img.setLunboaddr(rs.getString("imgAddr"));
				img.setImghref(rs.getString("imgHref"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}		
		return img;
	}
	/**
	 * 修改轮播图片方法
	 */
	public int updateLunbo(ImgInfo img){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String sql = "update ImgInfo set imgAddr=?,imgHref=?" +" where imgId=?";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, img.getLunboaddr());
				stmt.setString(2, img.getImghref());
				stmt.setInt(3, img.getImgId());
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
	 * 根据ID删除轮播图片
	 * @param imgId
	 * @return
	 */
	public int deleteLunbo(int imgId){
		int res = 0;
		String sql = "delete ImgInfo where imgId=?";
		Connection conn = ConnDB.getConn();
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, imgId);
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
	 * 添加商品分类方法
	 * @param sort
	 * @return
	 */
	public int addGoodsSort(GoodsSort sort){
		int res =0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt =null;
		String sql ="insert into GoodsSort values(?)";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, sort.getSortname());				
				res =stmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				ConnDB.close(null, stmt, conn);
			}
		return res;
	}
	/*==商品类别数据分页==*/
	/**
	 * 商品类别数据分页
	 * 根据当前页数和每页显示的行数来查询相应的结果
	 * 
	 * @param pageSize
	 *            每页显示的行数
	 * @param pageNow
	 *            当前的页数
	 * @return
	 */
	public ArrayList<GoodsSort> getSortForPage(int pageSize, int pageNow) {
		ArrayList<GoodsSort> gsort = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select Top " + pageSize
				+ " * from GoodsSort where sortId not in(select Top (" + pageSize
				+ " * (" + pageNow + "- 1)) sortId from GoodsSort)";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				if(gsort==null){
					gsort=new ArrayList<GoodsSort>();					
				}
				GoodsSort sort = new GoodsSort();
				sort.setSortId(rs.getInt("sortId"));
				sort.setSortname(rs.getString("sortName"));				
				gsort.add(sort);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return gsort;
	}
	/**
	 * 获取总页数
	 * @param pageSize
	 * @return
	 */
	public int getSortCount(int pageSize){
		int pageCount = 0;
		int newsCount = 0;//获取到新闻列表的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as sortCount from GoodsSort";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				newsCount = rs.getInt("sortCount");
			}
			//页数计算
			if(newsCount % pageSize == 0){
				pageCount = newsCount / pageSize;
			}else{
				pageCount = newsCount / pageSize + 1; 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return pageCount;
	}
	/**
	 * 根据ID查询商品类别方法
	 * @param sortId
	 * @return
	 */
	public GoodsSort selGoodsSort(int sortId){
		GoodsSort sort = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from GoodsSort where sortId=" + sortId;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){				
				sort = new GoodsSort();				
				sort.setSortId(rs.getInt("sortId"));
				sort.setSortname(rs.getString("sortName"));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}		
		return sort;
	}
	/**
	 * 修改商品类别方法
	 * @param img
	 * @return
	 */
	public int updateGoodsSort(GoodsSort sort){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String sql = "update GoodsSort set sortName=? where sortId=?";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1,sort.getSortname());	
				stmt.setInt(2, sort.getSortId());
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
	 * 查询所有商品类别
	 * @return
	 */
	public ArrayList<GoodsSort> selsort(){
		ArrayList<GoodsSort> asort = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from GoodsSort";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				if(asort == null)
					asort = new ArrayList<GoodsSort>();
					GoodsSort sort = new GoodsSort();
					sort.setSortId(rs.getInt("sortId"));
					sort.setSortname(rs.getString("sortName"));											
					asort.add(sort);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		
		return asort;
	}
	/**
	 * 根据ID删除商品分类
	 * @param sortId
	 * @return
	 */
	public int deleteGoodsSort(int sortId){
		int res = 0;
		String sql = "delete GoodsSort where sortId=?";
		Connection conn = ConnDB.getConn();
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, sortId);
			res = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(null, stmt, conn);
		}
		return res;
	}

}
