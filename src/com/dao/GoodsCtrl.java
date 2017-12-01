package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.entity.CommentInfo;
import com.entity.GoodsInfo;

/**
 * 商品操作类
 * @author Administrator
 *
 */
public class GoodsCtrl {
	/**
	 * 添加商品方法
	 * @param goods
	 * @return
	 */
	public int addGoods(GoodsInfo goods){
		int res =0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt =null;
		String sql ="insert into GoodsInfo values(?,?,?,?,?,?,?,?,?,?,?,?)";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, goods.getGoodsname());
				stmt.setString(2, goods.getGoodssort());
				stmt.setDouble(3, goods.getGoodsprice());
				stmt.setDouble(4, goods.getGoodscarr());
				stmt.setString(5, goods.getGoodsaddr());
				stmt.setString(6, goods.getGoodsimg());
				stmt.setString(7, goods.getGoodstuijian());
				stmt.setString(8, goods.getGoodsxianliang());
				stmt.setString(9, goods.getGoodstejia());
				stmt.setString(10, goods.getGoodscuxiao());
				stmt.setString(11, goods.getGoodszt());
				stmt.setString(12, goods.getGoodsintro());
				res =stmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				ConnDB.close(null, stmt, conn);
			}
		return res;
	}
	/*==商品列表数据分页==*/
	/**
	 * 根据当前页数和每页显示的行数来查询相应的结果
	 * 
	 * @param pageSize
	 *            每页显示的行数
	 * @param pageNow
	 *            当前的页数
	 * @return
	 */
	public ArrayList<GoodsInfo> getGoodsForPage(int pageSize, int pageNow) {
		ArrayList<GoodsInfo> agoods = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select Top " + pageSize
				+ " * from GoodsInfo where goodsId not in(select Top (" + pageSize
				+ " * (" + pageNow + "- 1)) goodsId from GoodsInfo)";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				if(agoods==null){
					agoods=new ArrayList<GoodsInfo>();					
				}
				GoodsInfo goods = new GoodsInfo();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsname(rs.getString("goodsName"));
				goods.setGoodssort(rs.getString("goodsSort"));
				goods.setGoodsprice(rs.getDouble("goodsPrice"));
				goods.setGoodscarr(rs.getDouble("goodsCarr"));
				goods.setGoodsaddr(rs.getString("goodsAddr"));
				goods.setGoodsimg(rs.getString("goodsImg"));				
				goods.setGoodszt(rs.getString("goodsZt"));
				agoods.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return agoods;
	}
	/**
	 * 获取总页数
	 * @param pageSize
	 * @return
	 */
	public int getGoodsCount(int pageSize){
		int pageCount = 0;
		int goodsCount = 0;//获取到商品的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as goodsCount from GoodsInfo";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				goodsCount = rs.getInt("goodsCount");
			}
			//页数计算
			if(goodsCount % pageSize == 0){
				pageCount = goodsCount / pageSize;
			}else{
				pageCount = goodsCount / pageSize + 1; 
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
	 * 根据ID查询商品方法
	 * @param goodsId
	 * @return
	 */
	public GoodsInfo selgoods(int goodsId){
		GoodsInfo goods = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from GoodsInfo where goodsId=" + goodsId;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){				
				goods = new GoodsInfo();				
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsname(rs.getString("goodsName"));
				goods.setGoodssort(rs.getString("goodsSort"));
				goods.setGoodsprice(rs.getDouble("goodsPrice"));
				goods.setGoodscarr(rs.getDouble("goodsCarr"));
				goods.setGoodsaddr(rs.getString("goodsAddr"));
				goods.setGoodsimg(rs.getString("goodsImg"));
				goods.setGoodstuijian(rs.getString("goodsTuijian"));
				goods.setGoodsxianliang(rs.getString("goodsXianliang"));
				goods.setGoodstejia(rs.getString("goodsTejia"));
				goods.setGoodscuxiao(rs.getString("goodsCuxiao"));				
				goods.setGoodszt(rs.getString("goodsZt"));
				goods.setGoodsintro(rs.getString("goodsIntro"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}		
		return goods;
	}
	/**
	 * 修改商品方法
	 */
	public int updateGoods(GoodsInfo goods){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String sql = "update GoodsInfo set goodsName=?,goodsSort=?,goodsPrice=?,goodsCarr=?,goodsAddr=?,goodsImg=?,goodsTuijian=?,goodsXianliang=?,goodsTejia=?,goodsCuxiao=?,goodsZt=?,goodsIntro=?" +" where goodsId=?";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, goods.getGoodsname());
				stmt.setString(2, goods.getGoodssort());
				stmt.setDouble(3, goods.getGoodsprice());
				stmt.setDouble(4, goods.getGoodscarr());
				stmt.setString(5, goods.getGoodsaddr());
				stmt.setString(6, goods.getGoodsimg());
				stmt.setString(7, goods.getGoodstuijian());
				stmt.setString(8, goods.getGoodsxianliang());
				stmt.setString(9, goods.getGoodstejia());
				stmt.setString(10, goods.getGoodscuxiao());
				stmt.setString(11, goods.getGoodszt());
				stmt.setString(12, goods.getGoodsintro());
				stmt.setInt(13, goods.getGoodsId());
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
	 * 根据ID删除商品
	 * @param userId
	 * @return
	 */
	public int deleteGoods(int goodsId){
		int res = 0;
		String sql = "delete GoodsInfo where goodsId=?";
		Connection conn = ConnDB.getConn();
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, goodsId);
			res = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(null, stmt, conn);
		}
		return res;
	}
	/*==推荐、限量、特价、促销商品搜索数据分页==*/	
	/**
	 * 根据导航栏连接搜索商品	 * 
	 * 根据当前页数和每页显示的行数来查询相应的结果
	 * 
	 * @param pageSize
	 * 				 每页显示的行数
	 * @param pageNow
	 * 				当前的页数
	 * @param tj
	 * 				查询条件：（推荐、特价等）
	 * @return
	 */
	public ArrayList<GoodsInfo> getDaohlGoods(int pageSize, int pageNow,String tj) {
		ArrayList<GoodsInfo> agoods = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select Top " + pageSize
				+ " * from GoodsInfo where goodsId not in(select Top (" + pageSize
				+ " * (" + pageNow + "- 1)) goodsId from GoodsInfo) and "+tj+"='true' and goodsZt='true' order by goodsId desc";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				if(agoods==null){
					agoods=new ArrayList<GoodsInfo>();					
				}
				GoodsInfo goods = new GoodsInfo();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsname(rs.getString("goodsName"));				
				goods.setGoodsprice(rs.getDouble("goodsPrice"));
				goods.setGoodsimg(rs.getString("goodsImg"));
				agoods.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return agoods;
	}
	/**
	 * 获取导航栏连接搜索商品的总页数
	 * @param pageSize
	 * @param tj
	 * @return
	 */
	public int getDaohlGoodsCount(int pageSize,String tj){
		int pageCount = 0;
		int goodsCount = 0;//获取到商品的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as goodsCount from GoodsInfo where "+tj+"='true' and goodsZt='true'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				goodsCount = rs.getInt("goodsCount");
			}
			//页数计算
			if(goodsCount % pageSize == 0){
				pageCount = goodsCount / pageSize;
			}else{
				pageCount = goodsCount / pageSize + 1; 
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
	 * 共找到多少件商品方法	 
	 * @param tj
	 * @return
	 */
	public int getSumGoodsCount(String tj){	
		int goodsCount = 0;//获取到商品的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as goodsCount from GoodsInfo where "+tj+"='true' and goodsZt='true'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				goodsCount = rs.getInt("goodsCount");
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return goodsCount;
	}
	/*==最新商品数据分页==*/	
	/**
	 * 根据导航栏最新商品搜索商品
	 * 根据当前页数和每页显示的行数来查询相应的结果
	 * 
	 * @param pageSize
	 * 				 每页显示的行数
	 * @param pageNow
	 * 				当前的页数
	 * @return
	 */
	public ArrayList<GoodsInfo> getToGoods(int pageSize, int pageNow) {
		ArrayList<GoodsInfo> agoods = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select Top " + pageSize
				+ " * from GoodsInfo where goodsId not in(select Top (" + pageSize
				+ " * (" + pageNow + "- 1)) goodsId from GoodsInfo) and goodsZt='true' order by goodsId desc";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);			
			while(rs.next()){
				if(agoods==null){
					agoods=new ArrayList<GoodsInfo>();					
				}
				GoodsInfo goods = new GoodsInfo();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsname(rs.getString("goodsName"));				
				goods.setGoodsprice(rs.getDouble("goodsPrice"));
				goods.setGoodsimg(rs.getString("goodsImg"));
				agoods.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return agoods;
	}
	/**
	 * 最新商品的总页数
	 * @param pageSize	
	 * @return
	 */
	public int getToGoodsCount(int pageSize){
		int pageCount = 0;
		int goodsCount = 0;//获取到商品的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as goodsCount from GoodsInfo where goodsZt='true'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				goodsCount = rs.getInt("goodsCount");
			}
			//页数计算
			if(goodsCount % pageSize == 0){
				pageCount = goodsCount / pageSize;
			}else{
				pageCount = goodsCount / pageSize + 1; 
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
	 * 最新商品的总个数	
	 * @return
	 */
	public int getToGoodsCount2(){	
		int goodsCount = 0;//获取到商品的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as goodsCount from GoodsInfo where goodsZt='true'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				goodsCount = rs.getInt("goodsCount");
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return goodsCount;
	}
	/**
	 * 首页今日新品
	 * @return
	 */
	public ArrayList<GoodsInfo> getToGoods2() {
		ArrayList<GoodsInfo> agoods = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from GoodsInfo where goodsZt='true' order by goodsId desc";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);			
			while(rs.next()){
				if(agoods==null){
					agoods=new ArrayList<GoodsInfo>();					
				}
				GoodsInfo goods = new GoodsInfo();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsname(rs.getString("goodsName"));				
				goods.setGoodsprice(rs.getDouble("goodsPrice"));
				goods.setGoodsimg(rs.getString("goodsImg"));
				agoods.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return agoods;
	}
	/**
	 * 首页精品推荐
	 * @return
	 */
	public ArrayList<GoodsInfo> getjptjGoods() {
		ArrayList<GoodsInfo> agoods = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from GoodsInfo where goodsTuijian='true' and goodsZt='true' order by goodsId desc";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);			
			while(rs.next()){
				if(agoods==null){
					agoods=new ArrayList<GoodsInfo>();					
				}
				GoodsInfo goods = new GoodsInfo();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsname(rs.getString("goodsName"));				
				goods.setGoodsprice(rs.getDouble("goodsPrice"));
				goods.setGoodsimg(rs.getString("goodsImg"));
				agoods.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return agoods;
	}
	/**
	 * 首页人气热卖
	 * @return
	 */
	public ArrayList<GoodsInfo> getxlGoods() {
		ArrayList<GoodsInfo> agoods = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from GoodsInfo where goodsXianliang='true' and goodsZt='true' order by goodsId desc";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);			
			while(rs.next()){
				if(agoods==null){
					agoods=new ArrayList<GoodsInfo>();					
				}
				GoodsInfo goods = new GoodsInfo();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsname(rs.getString("goodsName"));
				goods.setGoodsimg(rs.getString("goodsImg"));
				agoods.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return agoods;
	}
	/*==根据商品分类查询商品数据分页==*/
	/**
	 * 根据商品分类查询商品
	 * 根据当前页数和每页显示的行数来查询相应的结果
	 * 
	 * @param pageSize
	 *            每页显示的行数
	 * @param pageNow
	 *            当前的页数
	 * @param sort
	 * 			  商品分类
	 * @return
	 */
	public ArrayList<GoodsInfo> getSortGoods(int pageSize, int pageNow,int sortId) {
		ArrayList<GoodsInfo> agoods = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select Top " + pageSize
		+ " * from GoodsInfo where goodsId not in(select Top (" + pageSize
		+ " * (" + pageNow + "- 1)) goodsId from GoodsInfo) and GoodsSort='"+sortId+"' and goodsZt='true'";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				if(agoods==null){
					agoods=new ArrayList<GoodsInfo>();					
				}
				GoodsInfo goods = new GoodsInfo();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsname(rs.getString("goodsName"));				
				goods.setGoodsprice(rs.getDouble("goodsPrice"));				
				goods.setGoodsimg(rs.getString("goodsImg"));
				agoods.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return agoods;
	}
	/**
	 * 获取分类商品总页数
	 * @param pageSize
	 * @param sort
	 * @return
	 */
	public int getSortGoodsCount(int pageSize,int sortId){
		int pageCount = 0;
		int goodsCount = 0;//获取到商品的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as goodsCount from GoodsInfo where GoodsSort='"+sortId+"' and goodsZt='true'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				goodsCount = rs.getInt("goodsCount");
			}
			//页数计算
			if(goodsCount % pageSize == 0){
				pageCount = goodsCount / pageSize;
			}else{
				pageCount = goodsCount / pageSize + 1; 
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
	 * 分类商品总个数
	 * @param pageSize
	 * @param sort
	 * @return
	 */
	public int getSortGoodsCount2(int sortId){		
		int goodsCount = 0;//获取到商品的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as goodsCount from GoodsInfo where GoodsSort='"+sortId+"' and goodsZt='true'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				goodsCount = rs.getInt("goodsCount");
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return goodsCount;
	}
	/*==搜索商品数据分页==*/
	/**
	 * 根据用户输入关键字查询商品
	 * 根据当前页数和每页显示的行数来查询相应的结果
	 * 
	 * @param pageSize
	 *            每页显示的行数
	 * @param pageNow
	 *            当前的页数
	 * @param GoodsName
	 * 			  商品搜索关键字
	 * @return
	 */
	public ArrayList<GoodsInfo> SearchGoods(int pageSize, int pageNow,String GoodsName) {
		ArrayList<GoodsInfo> agoods = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select Top " + pageSize
		+ " * from GoodsInfo where goodsId not in(select Top (" + pageSize
		+ " * (" + pageNow + "- 1)) goodsId from GoodsInfo) and goodsName like '%"+GoodsName+"%' and goodsZt='true'";
		try {			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				if(agoods==null){
					agoods=new ArrayList<GoodsInfo>();					
				}
				GoodsInfo goods = new GoodsInfo();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsname(rs.getString("goodsName"));				
				goods.setGoodsprice(rs.getDouble("goodsPrice"));				
				goods.setGoodsimg(rs.getString("goodsImg"));
				agoods.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return agoods;
	}
	/**
	 * 获取搜索商品总页数
	 * @param pageSize
	 * @param sort
	 * @param GoodsName
	 * @return
	 */
	public int getSearchGoodsCount(int pageSize,String GoodsName){
		int pageCount = 0;
		int goodsCount = 0;//获取到商品的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as goodsCount from GoodsInfo where goodsName like '%"+GoodsName+"%' and goodsZt='true'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				goodsCount = rs.getInt("goodsCount");
			}
			//页数计算
			if(goodsCount % pageSize == 0){
				pageCount = goodsCount / pageSize;
			}else{
				pageCount = goodsCount / pageSize + 1; 
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
	 * 搜索商品的总个数	
	 * @return
	 */
	public int getSearchGoodsCount2(String GoodsName){	
		int goodsCount = 0;//获取到商品的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as goodsCount from GoodsInfo where goodsName like '%"+GoodsName+"%' and goodsZt='true'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				goodsCount = rs.getInt("goodsCount");
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return goodsCount;
	}	
	/**
	 * 相关商品
	 * 
	 * @param sortId
	 * 			  商品分类Id
	 * @return
	 */
	public ArrayList<GoodsInfo> xgGoods(int sortId) {
		ArrayList<GoodsInfo> agoods = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from GoodsInfo where GoodsSort ='"+sortId+"' and goodsZt='true' order by goodsId desc";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				if(agoods==null){
					agoods=new ArrayList<GoodsInfo>();					
				}
				GoodsInfo goods = new GoodsInfo();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsname(rs.getString("goodsName"));				
				goods.setGoodsprice(rs.getDouble("goodsPrice"));				
				goods.setGoodsimg(rs.getString("goodsImg"));
				agoods.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return agoods;
	}
	/**
	 * 添加商品评论方法
	 * @param comment
	 * @return
	 */
	public int addComment(CommentInfo comment){
		int res =0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt =null;
		String sql ="insert into CommentInfo values(?,?,?,default)";
			try {
				stmt =conn.prepareStatement(sql);				
				stmt.setInt(1, comment.getGoodsid());
				stmt.setString(2, comment.getCommentname());
				stmt.setString(3, comment.getCommentContent());				
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
	 * 查看商品评论方法
	 * @param goodsId
	 * @return
	 */
	public ArrayList<CommentInfo> goodsComment(int goodsId) {
		ArrayList<CommentInfo> acomment = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from CommentInfo where goodsId="+goodsId;
		try {			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				if(acomment==null){
					acomment=new ArrayList<CommentInfo>();					
				}
				CommentInfo comment = new CommentInfo();
				comment.setCommentname(rs.getString("commentName"));	
				comment.setCommentContent(rs.getString("commentContent"));
				comment.setCommentDate(rs.getString("commentDate"));				
				acomment.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return acomment;
	}	
	/*==评论列表数据分页==*/
	/**
	 * 根据当前页数和每页显示的行数来查询相应的结果
	 * 
	 * @param pageSize
	 *            每页显示的行数
	 * @param pageNow
	 *            当前的页数
	 * @return
	 */
	public ArrayList<CommentInfo> selgoodsComment(int pageSize, int pageNow) {
		ArrayList<CommentInfo> acomment = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select Top " + pageSize
				+ " * from CommentInfo where commentId not in(select Top (" + pageSize
				+ " * (" + pageNow + "- 1)) commentId from CommentInfo) order by commentId desc";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				if(acomment==null){
					acomment=new ArrayList<CommentInfo>();					
				}
				CommentInfo comment = new CommentInfo();
				comment.setCommentId(rs.getInt("commentId"));
				comment.setGoodsid(rs.getInt("goodsId"));
				comment.setCommentname(rs.getString("commentName"));
				comment.setCommentContent(rs.getString("commentContent"));
				comment.setCommentDate(rs.getString("commentDate"));				
				acomment.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return acomment;
	}
	/**
	 * 获取商品评论总页数
	 * @param pageSize
	 * @return
	 */
	public int goodsCommentCount(int pageSize){
		int pageCount = 0;
		int CommentCount = 0;//获取到商品的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as goodsCommentCount from CommentInfo";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				CommentCount = rs.getInt("goodsCommentCount");
			}
			//页数计算
			if(CommentCount % pageSize == 0){
				pageCount = CommentCount / pageSize;
			}else{
				pageCount = CommentCount / pageSize + 1; 
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
	 * 删除商品评论
	 * @param commentId
	 * @return
	 */
	public int deleteGoodsComment(int commentId){
		int res = 0;
		String sql = "delete CommentInfo where commentId=?";
		Connection conn = ConnDB.getConn();
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, commentId);
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
