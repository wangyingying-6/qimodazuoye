package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBUtil;

import entity.Book;
import entity.Room;
import entity.User;

public class BookDao {
	 public Book selectBookByRidandUserid(String rid){
	    	Connection  conn=DBUtil.getConnection();
	        try {
				PreparedStatement ps=conn.prepareStatement("select userid,b.rid,bid,starttime,endtime,b.rprice totalp,r.rid,rstatus,r.rprice pprice from book b,room r where b.rid=r.rid and b.rid=?");
			    ps.setString(1,rid);
			    ResultSet rs=ps.executeQuery();
			    Book b=new Book();
			    if(rs.next()){
			    	//O(object)\R(relation) mapping
			    	User u=new User();
			    	u.setUserid(rs.getString("userid"));
			    	b.setUser(u);
			    	Room r=new Room();
			    	r.setRid(rs.getString("rid"));
			    	r.setRprice(rs.getDouble("pprice"));
			    	b.setRoom(r);
			    	b.setBid(rs.getString("bid"));
			    	
			    	b.setStarttime(rs.getString("starttime"));
			    	b.setEndtime(rs.getString("endtime"));
			    	b.setRprice(rs.getDouble("totalp"));
			    	//�ر����ݿ���Դ
			    	DBUtil.closeAll(conn, ps, rs);
			    	return b;
			    }
			    return null;   
	        } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null; 
	    }
	 public ArrayList<Book> selectAllBook(String userid){
			//��ȡ����
			Connection conn=DBUtil.getConnection();
			try {
				PreparedStatement ps=conn.prepareStatement("select userid,b.rid,bid,starttime,endtime,b.rprice totalp,r.rid,sname,rstatus,r.rprice pprice from book b,room r where b.rid=r.rid and userid=?");
				 ps.setString(1,userid);
				ResultSet rs=ps.executeQuery();
				//����һ�����϶���
				ArrayList<Book> allbook=new ArrayList<Book>();			
				while(rs.next()){
					Book b=new Book();
					User u=new User();
					u.setUserid(rs.getString("userid"));
					b.setUser(u);
					Room r=new Room();
			    	r.setRid(rs.getString("rid"));
			    	r.setRprice(rs.getDouble("pprice"));
			    	b.setRoom(r);
					b.setBid(rs.getString("bid"));
					
					b.setStarttime(rs.getString("starttime"));
			    	b.setEndtime(rs.getString("endtime"));
			    	b.setRprice(rs.getDouble("totalp"));
					allbook.add(b);				
				}
				//��ѭ������ʱ�������û���Ϣ����װ��ArrayList������			
				DBUtil.closeAll(conn, ps, rs);	
				return allbook;
						
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
			return null;
		}
	 public ArrayList<Book> selectAllBook(){
			//��ȡ����
			Connection conn=DBUtil.getConnection();
			try {
				PreparedStatement ps=conn.prepareStatement("select userid,b.rid,bid,starttime,endtime,b.rprice totalp,r.rid,sname,rstatus,r.rprice pprice from book b,room r where b.rid=r.rid");
				
				ResultSet rs=ps.executeQuery();
				//����һ�����϶���
				ArrayList<Book> allbook=new ArrayList<Book>();			
				while(rs.next()){
					Book b=new Book();
					User u=new User();
					u.setUserid(rs.getString("userid"));
					b.setUser(u);
					Room r=new Room();
			    	r.setRid(rs.getString("rid"));
			    	r.setRprice(rs.getDouble("pprice"));
			    	b.setRoom(r);
					b.setBid(rs.getString("bid"));
					
					b.setStarttime(rs.getString("starttime"));
			    	b.setEndtime(rs.getString("endtime"));
			    	b.setRprice(rs.getDouble("totalp"));
					allbook.add(b);				
				}
				//��ѭ������ʱ�������û���Ϣ����װ��ArrayList������			
				DBUtil.closeAll(conn, ps, rs);	
				return allbook;
						
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
			return null;
		}
	 public int insertBook(Book book){
			Connection conn=DBUtil.getConnection();
			try {
			PreparedStatement ps=
				conn.prepareStatement("insert into book(userid,rid,btime,bid,starttime,endtime,rprice) values(?,?,sysdate,?,to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),?)");
				ps.setString(1,book.getUser().getUserid());
				ps.setString(2,book.getRoom().getRid());
				ps.setString(3,book.getBid());
				
				ps.setString(4,book.getStarttime());
				ps.setString(5,book.getEndtime());
				
				ps.setDouble(6,book.getRoom().getRprice());
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
	 public int removeRoomfromBook(String rid,String userid){
			Connection  conn=DBUtil.getConnection();//�������ݿ�
	     	 try {
	  			PreparedStatement ps=conn.prepareStatement("delete from book where rid=? and userid=?");
	  		    ps.setString(1,rid);
	  		    ps.setString(2,userid);
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
	 public int deleteBookByUserid(String userid){
	    	Connection  conn=DBUtil.getConnection();//�������ݿ�
	      	 try {
	   			PreparedStatement ps=conn.prepareStatement("delete from book where userid=?");
	   		    ps.setString(1,userid);
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
	 public int updateBookInfo(Book book){
	    	Connection  conn=DBUtil.getConnection();//�������ݿ�
	      	 try {
	   			PreparedStatement ps=conn.prepareStatement("update book set  starttime=to_date(?,'yyyy-mm-dd'),endtime=to_date(?,'yyyy-mm-dd') where userid=? and rid=?");
	   		   
	   			 
	   		    ps.setString(1,book.getStarttime());
	   		    ps.setString(2,book.getEndtime());
	   		    ps.setString(3,book.getUser().getUserid());
	   		    ps.setString(4,book.getRoom().getRid());
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
	

}
