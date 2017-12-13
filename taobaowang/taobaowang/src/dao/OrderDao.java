package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBUtil;


import entity.Order;
import entity.OrderDetail;
import entity.Room;
import entity.User;

public class OrderDao {
	public int insertNewOrder(Order order){
		Connection conn=DBUtil.getConnection();
		try {
		PreparedStatement ps=
			conn.prepareStatement("insert into ordertable(oid,userid,totalprice,otime,ostatus) values(?,?,?,sysdate,'1')");
			ps.setString(1,order.getOid());
			ps.setString(2,order.getUser().getUserid());
			ps.setDouble(3,order.getTotalprice());
			int i=ps.executeUpdate();
			//�ύ��������ύ�����²������ܶ�ʧ
			conn.commit();
			DBUtil.closeAll(conn, ps, null);
			return i;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	//����һ��������ϸ
	public int insertNewOrderDetail(OrderDetail orderd){
		Connection conn=DBUtil.getConnection();
		try {
		PreparedStatement ps=
			conn.prepareStatement("insert into odetail(odid,rid,oid) values(?,?,?)");
			ps.setString(1,orderd.getOdid());
			ps.setString(2,orderd.getRoom().getRid());
			ps.setString(3,orderd.getOrder().getOid());
			int i=ps.executeUpdate();
			//�ύ��������ύ�����²������ܶ�ʧ
			conn.commit();
			DBUtil.closeAll(conn, ps, null);
			return i;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	//�޸Ķ���״̬
	public int updateOrderStatus(Order order){
		Connection conn=DBUtil.getConnection();
		try {
		PreparedStatement ps=
			conn.prepareStatement("update ordertable set ostatus=? where oid=?");
			ps.setString(1,order.getOstatus());
			ps.setString(2,order.getOid());
			int i=ps.executeUpdate();
			//�ύ��������ύ�����²������ܶ�ʧ
			conn.commit();
			DBUtil.closeAll(conn, ps, null);
			return i;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	//��ȡ�����ҵĶ���
	public ArrayList<Order> getAllOrderB(String userid){
		Connection conn=DBUtil.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select * from ordertable where userid=?");
			ps.setString(1,userid);
			ResultSet rs=ps.executeQuery();
			//����һ�����϶���
			ArrayList<Order> myorders=new ArrayList<Order>();			
			while(rs.next()){
				Order order=new Order();
				order.setOid(rs.getString("oid"));
				order.setOstatus(rs.getString("ostatus"));
				order.setOtime(rs.getString("otime"));
				order.setTotalprice(rs.getDouble("totalprice"));
				User u=new User();
				u.setUserid(rs.getString("userid"));
				order.setUser(u);
				//�Ѹ�User������뼯���б���
				myorders.add(order);				
			}
			//��ѭ������ʱ�������û���Ϣ����װ��ArrayList������			
			DBUtil.closeAll(conn, ps, rs);	
			return myorders;
					
		} catch (SQLException e) {
			e.printStackTrace();
		}			
		return null;
	}
	//��ʱ��λ�ȡ�����ҵĶ���
	//�涨��ʱ���ʽxxxx-xx-xx 2015-05-01  2015-06-03
	//todate(?,'yyyy-mm-dd')
	public ArrayList<Order> getAllOrderB(String start,String end){
		Connection conn=DBUtil.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select * from ordertable where  otime between to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd')");
		
			ps.setString(1,start);
			ps.setString(2,end);
			ResultSet rs=ps.executeQuery();
			//����һ�����϶���
			ArrayList<Order> myorders=new ArrayList<Order>();			
			while(rs.next()){
				Order order=new Order();
				order.setOid(rs.getString("oid"));
				order.setOstatus(rs.getString("ostatus"));
				order.setOtime(rs.getString("otime"));
				order.setTotalprice(rs.getDouble("totalprice"));
				User u=new User();
				u.setUserid(rs.getString("userid"));
				order.setUser(u);
				//�Ѹ�User������뼯���б���
				myorders.add(order);				
			}
			//��ѭ������ʱ�������û���Ϣ����װ��ArrayList������			
			DBUtil.closeAll(conn, ps, rs);	
			return myorders;
					
		} catch (SQLException e) {
			e.printStackTrace();
		}			
		return null;
	}
	//���ݶ�����Ż�ö�����ϸ
	public ArrayList<OrderDetail> getOrderDetail(String oid){
		Connection conn=DBUtil.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select odid,oid,o.rid orid,rprice,sname,rstatus from odetail o,room r where o.rid=r.rid and o.oid=?");
			ps.setString(1,oid);
			ResultSet rs=ps.executeQuery();
			//����һ�����϶���
			ArrayList<OrderDetail> myorders=new ArrayList<OrderDetail>();			
			while(rs.next()){
				OrderDetail order=new OrderDetail();
				order.setOdid(rs.getString("odid"));
				
				Order o=new Order();
				o.setOid(rs.getString("oid"));
				order.setOrder(o);
				
				Room p=new Room();
				p.setRid(rs.getString("orid"));
				p.setRprice(rs.getDouble("rprice"));
				p.setSname(rs.getString("sname"));
			    p.setRstatus(rs.getString("rstatus"));
			    
				order.setRoom(p);
				//�Ѹ�User������뼯���б���
				myorders.add(order);				
			}
			//��ѭ������ʱ�������û���Ϣ����װ��ArrayList������			
			DBUtil.closeAll(conn, ps, rs);	
			return myorders;
					
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<Order> getAllOrder(){
		Connection conn=DBUtil.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select * from ordertable order by otime desc");
			ResultSet rs=ps.executeQuery();
			//����һ�����϶���
			ArrayList<Order> orders=new ArrayList<Order>();			
			while(rs.next()){
				Order order=new Order();
				order.setOid(rs.getString("oid"));
				order.setOstatus(rs.getString("ostatus"));
				order.setOtime(rs.getString("otime"));
				order.setTotalprice(rs.getDouble("totalprice"));
				User u=new User();
				u.setUserid(rs.getString("userid"));
				order.setUser(u);
				//�Ѹ�User������뼯���б���
				orders.add(order);				
			}
			//��ѭ������ʱ�������û���Ϣ����װ��ArrayList������			
			DBUtil.closeAll(conn, ps, rs);	
			return orders;
					
		} catch (SQLException e) {
			e.printStackTrace();
		}			
		return null;
	}
}
