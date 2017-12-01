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
 * ��������������
 * @author Administrator
 *
 */

public class OrderCtrl {
	/**
	 * ���ɶ�������
	 * @param order
	 * @return
	 */
	public int addOrder(OrderInfo order){
		int res =0;		
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt =null;
		String orderzt="δ����";
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
	 * �����û�ID��ѯ������Ϣ
	 * �û��ύ�����ɹ�����ʾ���û�������Ϣ
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
	 * ��֤�û�֧������
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
	 * �û�֧���ɹ��� ������״̬�޸�Ϊ���ڴ���
	 * @param orderId
	 * @return
	 */
	public int updateOrderZt(int orderId){
		int res = 0;
		Connection conn =ConnDB.getConn();
		PreparedStatement stmt = null;
		String orderzt="���ڴ���";
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
	 * ��ȡ������ҳ��
	 * @param pageSize
	 * @return
	 */
	public int getOrderCount(int pageSize){
		int pageCount = 0;
		int orderCount = 0;//��ȡ������������
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
			//ҳ������
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
	 * ���ݶ����Ų�ѯ�û�������Ϣ
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
	 * ���ݶ���ID�޸Ķ���״̬
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
	 * ���ݶ�����ɾ������
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
	 * �����û�ID��ѯ�û��Ķ���
	 * �û���¼��Ա���Ŀ��Բ鿴�ѹ�����Ʒ
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
	 * �û�������ϸ��Ϣ����
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
