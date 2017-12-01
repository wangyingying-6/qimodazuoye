package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.entity.OrderInfo;
import com.entity.UserInfo;

/**
 * 订单操作方法类
 * @author Administrator
 *
 */

public class OrderCtrl {
	/**
	 * 生成订单方法
	 * @param order
	 * @return
	 */
	public int addOrder(OrderInfo order){
		int res =0;		
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt =null;
		String orderzt="未付款";
		String sql ="insert into OrderInfo values(?,?,?,?,?,?,?,?,?,?,?,?,?,default)";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setInt(1, order.getUserid());
				stmt.setString(2, order.getUsername());
				stmt.setString(3, order.getUseraddr());
				stmt.setString(4, order.getUseryb());
				stmt.setString(5, order.getUsersj());
				stmt.setString(6, order.getUseremail());
				stmt.setInt(7, order.getGoodsId());
				stmt.setString(8, order.getGoodsname());
				stmt.setDouble(9, order.getGoodsprice());
				stmt.setDouble(10, order.getGoodscarr());
				stmt.setInt(11, order.getGoodssl());
				stmt.setString(12, order.getGoodssm());
				stmt.setString(13, orderzt);
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
	 * 根据用户ID查询订单信息
	 * 用户提交订单成功后显示出用户订单信息
	 * @param userId
	 * @return
	 */
	public OrderInfo ToOrder(int userId) {
		OrderInfo order = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select Top 1 * from OrderInfo where userId="+userId+" order by orderId desc";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);			
			while(rs.next()){
				order = new OrderInfo();
				order.setOrderId(rs.getInt("orderId"));
				order.setGoodsId(rs.getInt("goodsId"));
				order.setGoodsname(rs.getString("goodsName"));
				order.setGoodsprice(rs.getDouble("goodsPrice"));
				order.setGoodscarr(rs.getDouble("goodsCarr"));
				order.setGoodssl(rs.getInt("goodsSl"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return order;
	}
	/**
	 * 验证用户支付密码
	 * @param userId
	 * @return
	 */
	public UserInfo selUserPwd(int userId){
		UserInfo user =null;
		Connection conn =ConnDB.getConn();
		ResultSet rs =null;
		Statement stmt =null;
		String sql ="select userPwd from UserInfo where userId="+userId+"";
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
	 * 用户支付成功后 将订单状态修改为正在处理
	 * @param orderId
	 * @return
	 */
	public int updateOrderZt(int orderId){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String orderzt="正在处理";
		String sql = "update OrderInfo set orderZt=?" +" where orderId=?";
			try {
				stmt =conn.prepareStatement(sql);	
				stmt.setString(1, orderzt);
				stmt.setInt(2, orderId);
				res = stmt.executeUpdate();				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				ConnDB.close(null, stmt, conn);
			}		
		return res;		
	}
	
	/*==订单列表数据分页==*/
	/**
	 * 根据当前页数和每页显示的行数来查询相应的结果
	 * 
	 * @param pageSize
	 *            每页显示的行数
	 * @param pageNow
	 *            当前的页数
	 * @return
	 */
	public ArrayList<OrderInfo> getOrderForPage(int pageSize, int pageNow) {
		ArrayList<OrderInfo> aorder = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select Top " + pageSize
				+ " * from OrderInfo where orderId not in(select Top (" + pageSize
				+ " * (" + pageNow + "- 1)) orderId from OrderInfo) order by orderId desc";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				if(aorder==null){
					aorder=new ArrayList<OrderInfo>();					
				}
				OrderInfo order = new OrderInfo();
				order.setOrderId(rs.getInt("orderId"));
				order.setUserid(rs.getInt("userId"));
				order.setGoodsname(rs.getString("goodsName"));
				order.setGoodsprice(rs.getDouble("goodsPrice"));
				order.setOrderzt(rs.getString("orderZt"));
				order.setOrderdate(rs.getString("orderDate"));
				aorder.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return aorder;
	}
	/**
	 * 获取订单总页数
	 * @param pageSize
	 * @return
	 */
	public int getOrderCount(int pageSize){
		int pageCount = 0;
		int orderCount = 0;//获取到订单的总数
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as orderCount from OrderInfo";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				orderCount = rs.getInt("orderCount");
			}
			//页数计算
			if(orderCount % pageSize == 0){
				pageCount = orderCount / pageSize;
			}else{
				pageCount = orderCount / pageSize + 1; 
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
	 * 根据订单号查询用户订单信息
	 * @param orderId
	 * @return
	 */
	public OrderInfo selOrder(int orderId){
		OrderInfo order = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from OrderInfo where orderId=" + orderId;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){				
				order = new OrderInfo();				
				order.setUsername(rs.getString("userName"));
				order.setUseraddr(rs.getString("userAddr"));
				order.setUseryb(rs.getString("userYb"));
				order.setUsersj(rs.getString("userSj"));
				order.setUseremail(rs.getString("userEmail"));				
				order.setGoodssm(rs.getString("goodsSm"));
				order.setOrderzt(rs.getString("orderZt"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}		
		return order;
	}
	/**
	 * 根据订单ID修改订单状态
	 * @param orderId
	 * @param orderZt
	 * @return
	 */
	public int updateOrder(int orderId,String orderZt){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String sql = "update OrderInfo set orderZt=?" +" where orderId=?";
			try {
				stmt =conn.prepareStatement(sql);
				stmt.setString(1, orderZt);
				stmt.setInt(2, orderId);
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
	 * 根据订单号删除订单
	 * @param orderId
	 * @return
	 */
	public int deleteOrder(int orderId){
		int res = 0;
		String sql = "delete OrderInfo where orderId=?";
		Connection conn = ConnDB.getConn();
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, orderId);
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
	 * 根据用户ID查询用户的订单
	 * 用户登录会员中心可以查看已购买商品
	 * @param userId
	 * @return
	 */
	public ArrayList<OrderInfo> UserOrder(int userId) {
		ArrayList<OrderInfo> aorder = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from OrderInfo where userId="+userId;
		try {			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				if(aorder==null){
					aorder=new ArrayList<OrderInfo>();					
				}
				OrderInfo order = new OrderInfo();
				order.setOrderId(rs.getInt("orderId"));				
				order.setGoodsname(rs.getString("goodsName"));
				order.setGoodsId(rs.getInt("goodsId"));
				order.setGoodsprice(rs.getDouble("goodsPrice"));
				order.setOrderzt(rs.getString("orderZt"));
				order.setOrderdate(rs.getString("orderDate"));
				aorder.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return aorder;
	}
	/**
	 * 用户订单详细信息方法
	 * @param orderId
	 * @return
	 */
	public OrderInfo UserOrderInfo(int orderId) {
		OrderInfo order = null;
		Connection conn = ConnDB.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from OrderInfo where orderId="+orderId;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()){				
				order = new OrderInfo();
				order.setOrderId(rs.getInt("orderId"));
				order.setUserid(rs.getInt("userId"));
				order.setUsername(rs.getString("userName"));
				order.setUseraddr(rs.getString("userAddr"));
				order.setUseryb(rs.getString("userYb"));
				order.setUsersj(rs.getString("userSj"));
				order.setUseremail(rs.getString("userEmail"));				
				order.setGoodssm(rs.getString("goodsSm"));
				order.setGoodsname(rs.getString("goodsName"));				
				order.setGoodsprice(rs.getDouble("goodsPrice"));
				order.setGoodscarr(rs.getDouble("goodsCarr"));
				order.setGoodssl(rs.getInt("goodsSl"));				
				order.setOrderzt(rs.getString("orderZt"));
				order.setOrderdate(rs.getString("orderDate"));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnDB.close(rs, stmt, conn);
		}
		return order;
	}

}
