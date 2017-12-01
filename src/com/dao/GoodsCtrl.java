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
 * ��Ʒ������
 * @author Administrator
 *
 */
public class GoodsCtrl {
	/**
	 * �����Ʒ����
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
	/*==��Ʒ�б����ݷ�ҳ==*/
	/**
	 * ���ݵ�ǰҳ����ÿҳ��ʾ����������ѯ��Ӧ�Ľ��
	 * 
	 * @param pageSize
	 *            ÿҳ��ʾ������
	 * @param pageNow
	 *            ��ǰ��ҳ��
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
	 * ��ȡ��ҳ��
	 * @param pageSize
	 * @return
	 */
	public int getGoodsCount(int pageSize){
		int pageCount = 0;
		int goodsCount = 0;//��ȡ����Ʒ������
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
			//ҳ������
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
	 * ����ID��ѯ��Ʒ����
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
	 * �޸���Ʒ����
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
	 * ����IDɾ����Ʒ
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
	/*==�Ƽ����������ؼۡ�������Ʒ�������ݷ�ҳ==*/	
	/**
	 * ���ݵ���������������Ʒ	 * 
	 * ���ݵ�ǰҳ����ÿҳ��ʾ����������ѯ��Ӧ�Ľ��
	 * 
	 * @param pageSize
	 * 				 ÿҳ��ʾ������
	 * @param pageNow
	 * 				��ǰ��ҳ��
	 * @param tj
	 * 				��ѯ���������Ƽ����ؼ۵ȣ�
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
	 * ��ȡ����������������Ʒ����ҳ��
	 * @param pageSize
	 * @param tj
	 * @return
	 */
	public int getDaohlGoodsCount(int pageSize,String tj){
		int pageCount = 0;
		int goodsCount = 0;//��ȡ����Ʒ������
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
			//ҳ������
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
	 * ���ҵ����ټ���Ʒ����	 
	 * @param tj
	 * @return
	 */
	public int getSumGoodsCount(String tj){	
		int goodsCount = 0;//��ȡ����Ʒ������
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
	/*==������Ʒ���ݷ�ҳ==*/	
	/**
	 * ���ݵ�����������Ʒ������Ʒ
	 * ���ݵ�ǰҳ����ÿҳ��ʾ����������ѯ��Ӧ�Ľ��
	 * 
	 * @param pageSize
	 * 				 ÿҳ��ʾ������
	 * @param pageNow
	 * 				��ǰ��ҳ��
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
	 * ������Ʒ����ҳ��
	 * @param pageSize	
	 * @return
	 */
	public int getToGoodsCount(int pageSize){
		int pageCount = 0;
		int goodsCount = 0;//��ȡ����Ʒ������
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
			//ҳ������
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
	 * ������Ʒ���ܸ���	
	 * @return
	 */
	public int getToGoodsCount2(){	
		int goodsCount = 0;//��ȡ����Ʒ������
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
	 * ��ҳ������Ʒ
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
	 * ��ҳ��Ʒ�Ƽ�
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
	 * ��ҳ��������
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
	/*==������Ʒ�����ѯ��Ʒ���ݷ�ҳ==*/
	/**
	 * ������Ʒ�����ѯ��Ʒ
	 * ���ݵ�ǰҳ����ÿҳ��ʾ����������ѯ��Ӧ�Ľ��
	 * 
	 * @param pageSize
	 *            ÿҳ��ʾ������
	 * @param pageNow
	 *            ��ǰ��ҳ��
	 * @param sort
	 * 			  ��Ʒ����
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
	 * ��ȡ������Ʒ��ҳ��
	 * @param pageSize
	 * @param sort
	 * @return
	 */
	public int getSortGoodsCount(int pageSize,int sortId){
		int pageCount = 0;
		int goodsCount = 0;//��ȡ����Ʒ������
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
			//ҳ������
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
	 * ������Ʒ�ܸ���
	 * @param pageSize
	 * @param sort
	 * @return
	 */
	public int getSortGoodsCount2(int sortId){		
		int goodsCount = 0;//��ȡ����Ʒ������
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
	/*==������Ʒ���ݷ�ҳ==*/
	/**
	 * �����û�����ؼ��ֲ�ѯ��Ʒ
	 * ���ݵ�ǰҳ����ÿҳ��ʾ����������ѯ��Ӧ�Ľ��
	 * 
	 * @param pageSize
	 *            ÿҳ��ʾ������
	 * @param pageNow
	 *            ��ǰ��ҳ��
	 * @param GoodsName
	 * 			  ��Ʒ�����ؼ���
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
	 * ��ȡ������Ʒ��ҳ��
	 * @param pageSize
	 * @param sort
	 * @param GoodsName
	 * @return
	 */
	public int getSearchGoodsCount(int pageSize,String GoodsName){
		int pageCount = 0;
		int goodsCount = 0;//��ȡ����Ʒ������
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
			//ҳ������
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
	 * ������Ʒ���ܸ���	
	 * @return
	 */
	public int getSearchGoodsCount2(String GoodsName){	
		int goodsCount = 0;//��ȡ����Ʒ������
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
	 * �����Ʒ
	 * 
	 * @param sortId
	 * 			  ��Ʒ����Id
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
	 * �����Ʒ���۷���
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
	 * �鿴��Ʒ���۷���
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
	/*==�����б����ݷ�ҳ==*/
	/**
	 * ���ݵ�ǰҳ����ÿҳ��ʾ����������ѯ��Ӧ�Ľ��
	 * 
	 * @param pageSize
	 *            ÿҳ��ʾ������
	 * @param pageNow
	 *            ��ǰ��ҳ��
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
	 * ��ȡ��Ʒ������ҳ��
	 * @param pageSize
	 * @return
	 */
	public int goodsCommentCount(int pageSize){
		int pageCount = 0;
		int CommentCount = 0;//��ȡ����Ʒ������
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
			//ҳ������
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
	 * ɾ����Ʒ����
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
