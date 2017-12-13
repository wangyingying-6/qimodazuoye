package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBUtil;
import entity.Room;

public class RoomDao {
	 public Room selectRoomByRid(String rid){
	    	Connection  conn=DBUtil.getConnection();
	        try {
				PreparedStatement ps=conn.prepareStatement("select * from room where rid=?");
			    ps.setString(1,rid);
			    ResultSet rs=ps.executeQuery();
			    Room r=new Room();
			    if(rs.next()){
			    	//O(object)\R(relation) mapping
			    	r.setRid(rs.getString("rid"));
			    	r.setSname(rs.getString("sname"));
			    	r.setRstatus(rs.getString("rstatus"));
			    	r.setRprice(rs.getDouble("rprice"));
			    	//�ر����ݿ���Դ
			    	DBUtil.closeAll(conn, ps, rs);
			    	return r;
			    }
			    return null;   
	        
	        } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null; 
	    }
	 public Room selectRoom(Room room){
	    	Connection  conn=DBUtil.getConnection();
	        try {
				PreparedStatement ps=conn.prepareStatement("select * from room where rid=?");
			    ps.setString(1,room.getRid());
			    ResultSet rs=ps.executeQuery();
			    Room rm=new Room();
			    if(rs.next()){
			    	//O(object)\R(relation) mapping
			    	rm.setRid(rs.getString("rid"));
			    	rm.setSname(rs.getString("sname"));
			    	rm.setRstatus(rs.getString("rstatus"));
			    	rm.setRprice(rs.getDouble("rprice"));
			    	//�ر����ݿ���Դ
			    	DBUtil.closeAll(conn, ps, rs);
			    	return rm;
			    }
			    return null;   
	        
	        } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null; 	
	    }
	 public ArrayList<Room> selectAllRoom(){
			//��ȡ����
			Connection conn=DBUtil.getConnection();
			try {
				PreparedStatement ps=conn.prepareStatement("select * from room");
				ResultSet rs=ps.executeQuery();
				//����һ�����϶���
				ArrayList<Room> allroom=new ArrayList<Room>();			
				while(rs.next()){
					Room r=new Room();
					r.setRid(rs.getString("rid"));
					r.setSname(rs.getString("sname"));
					r.setRstatus(rs.getString("rstatus"));
					r.setRprice(rs.getDouble("rprice"));
					allroom.add(r);				
				}
				//��ѭ������ʱ�������û���Ϣ����װ��ArrayList������			
				DBUtil.closeAll(conn, ps, rs);	
				return allroom;
						
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
			return null;
		}
	 public int insertRoom(Room room){
			Connection conn=DBUtil.getConnection();
			try {
			PreparedStatement ps=
				conn.prepareStatement("insert into room(rid,sname,rstatus,rprice) values(?,?,?,?)");
				ps.setString(1,room.getRid());
				ps.setString(2,room.getSname());
				ps.setString(3,room.getRstatus());
				ps.setDouble(4,room.getRprice());
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
	 public int deleteRoomByRid(String rid){
	    	Connection  conn=DBUtil.getConnection();//�������ݿ�
	      	 try {
	   			PreparedStatement ps=conn.prepareStatement("delete from room where rid=?");
	   		    ps.setString(1,rid);
	   		    int i=ps.executeUpdate();
	   		    //�ύ��������ύ�����²����ᶪʧ
	   		    conn.commit();
	   		    DBUtil.closeAll(conn, ps, null);
	   		    return i; 
	           } catch (SQLException e) {
	   			// TODO Auto-generated catch block
	   			e.printStackTrace();
	   		}
	           	return 0;
	    }
	 public int updateRoomInfo(Room room){
	    	Connection  conn=DBUtil.getConnection();//�������ݿ�
	      	 try {
	   			PreparedStatement ps=conn.prepareStatement("update room set sname=?,rstatus=?,rprice=? where rid=?");
	   		    ps.setString(1,room.getSname());
	   		    ps.setString(2,room.getRstatus());
	   		    ps.setDouble(3,room.getRprice());
	   		    ps.setString(4,room.getRid());
	   		    int i=ps.executeUpdate();
	   		    //�ύ��������ύ�����²����ᶪʧ
	   		    conn.commit();
	   		    DBUtil.closeAll(conn, ps, null);
	   		    return i; 
	           } catch (SQLException e) {
	   			// TODO Auto-generated catch block
	   			e.printStackTrace();
	   		}
	           	return 0;
	    }
	 public void updateRoomStatus(Room room){
	    	Connection  conn=DBUtil.getConnection();//�������ݿ�
	    	 try {
	 			PreparedStatement ps=conn.prepareStatement("update room set rstatus=? where rid=?");
	 		    ps.setString(1,room.getRstatus());
	 		    ps.setString(2,room.getRid());
	 		    ps.executeUpdate();
	 		    //�ύ��������ύ�����²����ᶪʧ
	 		    conn.commit();
	 		    DBUtil.closeAll(conn, ps, null);
	 		        
	         } catch (SQLException e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 		}
		}
	 	public static void main(String[] args) {
	 		RoomDao dao=new RoomDao();
			System.out.println(dao.selectAllRoom().size());
//			Room p=new Room();
//			p.setRid("p001");
//			p.setSname("iphone");
//			p.setRstatus(1);
//			p.setRprice(5000);	
//			dao.insertRoom(p);
		}
}
