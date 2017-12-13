package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBUtil;

import entity.Comment;
import entity.User;

public class CommentDao {
	 public Comment selectCommentByCmid(String cmid){
	    	Connection conn=DBUtil.getConnection();
	        try {
				PreparedStatement ps=conn.prepareStatement("select * from commenttable where cmid=?");
			    ps.setString(1,cmid);
			    ResultSet rs=ps.executeQuery();
			    Comment c=new Comment();
			    if(rs.next()){
			    	//O(object)\R(relation) mapping
			    	c.setRid(rs.getString("rid"));
			    	c.setSname(rs.getString("sname"));
			    	c.setCdesc(rs.getString("cdesc"));
			    	c.setCtime(rs.getString("ctime"));
			    	c.setCmid(rs.getString("cmid"));
			    	User u=new User();
					u.setUserid(rs.getString("userid"));
					c.setUser(u);
			    	//关闭数据库资源
			    	DBUtil.closeAll(conn, ps, rs);
			    	return c;
			    }
			    return null;   
	        
	        } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null; 
	    }
	 public ArrayList<Comment> selectAllComment(){
			//获取连接
			Connection conn=DBUtil.getConnection();
			try {
				PreparedStatement ps=conn.prepareStatement("select * from commenttable");
				ResultSet rs=ps.executeQuery();
				//创建一个集合对象
				ArrayList<Comment> allroom=new ArrayList<Comment>();			
				while(rs.next()){
					Comment c=new Comment();
					c.setRid(rs.getString("rid"));
					c.setSname(rs.getString("sname"));
					c.setCdesc(rs.getString("cdesc"));
					c.setCtime(rs.getString("ctime"));
					c.setCmid(rs.getString("cmid"));
					User u=new User();
					u.setUserid(rs.getString("userid"));
					c.setUser(u);
					allroom.add(c);				
				}
				//当循环结束时，所有用户信息都封装到ArrayList集合中			
				DBUtil.closeAll(conn, ps, rs);	
				return allroom;
						
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
			return null;
		}
	 public ArrayList<Comment> getAllComment(String userid){
			Connection conn=DBUtil.getConnection();
			try {
				PreparedStatement ps=conn.prepareStatement("select * from commenttable where userid=?");
				ps.setString(1,userid);
				ResultSet rs=ps.executeQuery();
				//创建一个集合对象
				ArrayList<Comment> mycomment=new ArrayList<Comment>();			
				while(rs.next()){
					Comment co=new Comment();
					co.setRid(rs.getString("rid"));
					co.setSname(rs.getString("sname"));
					co.setCdesc(rs.getString("cdesc"));
					co.setCtime(rs.getString("ctime"));
					co.setCmid(rs.getString("cmid"));
					User u=new User();
					u.setUserid(rs.getString("userid"));
					co.setUser(u);
					//把该User对象放入集合中保存
					mycomment.add(co);				
				}
				//当循环结束时，所有用户信息都封装到ArrayList集合中			
				DBUtil.closeAll(conn, ps, rs);	
				return mycomment;
						
			} catch (SQLException e) {
				e.printStackTrace();
			}			
			return null;
		}
	 public int insertComment(Comment comment){
			Connection conn=DBUtil.getConnection();
			try {
			PreparedStatement ps=
				conn.prepareStatement("insert into commenttable(rid,sname,userid,cdesc,ctime,cmid) values(?,?,?,?,sysdate,?)");
				ps.setString(1,comment.getRid());
				ps.setString(2,comment.getSname());
				ps.setString(3,comment.getUser().getUserid());
				ps.setString(4,comment.getCdesc());
				ps.setString(5,comment.getCmid());
				int i=ps.executeUpdate();
				//提交，如果不提交，更新操作可能丢失
				conn.commit();
				DBUtil.closeAll(conn, ps, null);
				return i;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				return 0;
		}
	 public int deleteCommentByCmid(String cmid){
	    	Connection  conn=DBUtil.getConnection();//连接数据库
	      	 try {
	   			PreparedStatement ps=conn.prepareStatement("delete from commenttable where cmid=?");
	   		    ps.setString(1,cmid);
	   		    int i=ps.executeUpdate();
	   		    //提交，如果不提交，更新操作会丢失
	   		    conn.commit();
	   		    DBUtil.closeAll(conn, ps, null);
	   		    return i; 
	           } catch (SQLException e) {
	   			// TODO Auto-generated catch block
	   			e.printStackTrace();
	   		}
	           	return 0;
	    }
	 public int updateCommentInfo(Comment comment){
	    	Connection  conn=DBUtil.getConnection();//连接数据库
	      	 try {
	   			PreparedStatement ps=conn.prepareStatement("update commenttable set rid=?,sname=?,cdesc=? where cmid=?");
	   		    ps.setString(1,comment.getRid());
	   		    ps.setString(2,comment.getSname());
	   		    ps.setString(3,comment.getCdesc());
	   		    ps.setString(4,comment.getCmid());
	   		    int i=ps.executeUpdate();
	   		    //提交，如果不提交，更新操作会丢失
	   		    conn.commit();
	   		    DBUtil.closeAll(conn, ps, null);
	   		    return i; 
	           } catch (SQLException e) {
	   			// TODO Auto-generated catch block
	   			e.printStackTrace();
	   		}
	           	return 0;
	    }
	 public static void main(String[] args) {
	 		CommentDao dao=new CommentDao();
			System.out.println(dao.selectAllComment().size());
	 }
}
