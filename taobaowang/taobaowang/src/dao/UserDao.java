package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBUtil;

import entity.User;
public class UserDao {
    public User selectUser(User user){
    	Connection  conn=DBUtil.getConnection();
        try {
			PreparedStatement ps=conn.prepareStatement("select * from uinfo where username=?");
		    ps.setString(1,user.getUsername());
		    ResultSet rs=ps.executeQuery();
		    User ru=new User();
		    if(rs.next()){
		    	//O(object)\R(relation) mapping
		    	ru.setUserid(rs.getString("userid"));
		    	ru.setUsername(rs.getString("username"));
		    	ru.setPassword(rs.getString("password"));
		    	ru.setRole(rs.getString("role"));
		    	ru.setStatus(rs.getString("status"));
		    	ru.setWrongnum(rs.getInt("wrongnum"));
		    	ru.setCardid(rs.getString("cardid"));
		    	ru.setSex(rs.getString("sex"));
		    	ru.setTele(rs.getString("tele"));
		    	//�ر����ݿ���Դ
		    	DBUtil.closeAll(conn, ps, rs);
		    	return ru;
		    }
		    return null;   
        
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null; 
		
		
    }
  //�ı��û�״̬�Լ��������
    public void updateUserStatus(User user){
    	Connection  conn=DBUtil.getConnection();//�������ݿ�
    	 try {
 			PreparedStatement ps=conn.prepareStatement("update uinfo set status=?,wrongnum=? where userid=?");
 		    ps.setString(1,user.getStatus());
 		    ps.setInt(2, user.getWrongnum());
 		    ps.setString(3, user.getUserid());
 		    ps.executeUpdate();
 		    //�ύ��������ύ�����²����ᶪʧ
 		    conn.commit();
 		    DBUtil.closeAll(conn, ps, null);
 		        
         } catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
 	
 		
 		
	}
    //��ѯ�����û���Ϣ
    public ArrayList<User> selectALLUser(){
    	Connection  conn=DBUtil.getConnection();
        try {
			PreparedStatement ps=conn.prepareStatement("select * from uinfo");
		    ResultSet rs=ps.executeQuery();
		    //����һ�����϶���
		    ArrayList<User> alluser=new ArrayList<User>();
		    while(rs.next()){
		    	//ÿѭ��һ�Σ������ݿ��л�ȡһ���û���Ϣ
		    	//��װ��һ��User������
		    	User ru=new User();
		    	//O(object)\R(relation) mapping
		    	ru.setUserid(rs.getString("userid"));
		    	ru.setUsername(rs.getString("username"));
		    	ru.setPassword(rs.getString("password"));
		    	ru.setRole(rs.getString("role"));
		    	ru.setStatus(rs.getString("status"));
		    	ru.setWrongnum(rs.getInt("wrongnum"));
		    	ru.setCardid(rs.getString("cardid"));
		    	ru.setSex(rs.getString("sex"));
		    	ru.setTele(rs.getString("tele"));
		    	//�Ѹ�User������뼯���б���
		    	alluser.add(ru);
		    }
		    //��ѭ������ʱ��˵�������û���Ϣ����װ��ArrayList������
		    
		    DBUtil.closeAll(conn, ps, rs);
		    return alluser;
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return null;
    }
    public static void main(String[] args) {
    	
    }
    public int deleteUserByUserid(String userid){
    	Connection  conn=DBUtil.getConnection();//�������ݿ�
      	 try {
   			PreparedStatement ps=conn.prepareStatement("delete from uinfo where userid=?");
   		    ps.setString(1, userid);
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
    public int updateUserInfo(User user){
    	Connection  conn=DBUtil.getConnection();//�������ݿ�
      	 try {
   			PreparedStatement ps=conn.prepareStatement("update uinfo set username=?,password=?,role=?,status=?,wrongnum=?,sex=?,tele=?,cardid=?,question=?,answer=?,credit=? where userid=?");
   		    ps.setString(1, user.getUsername());
   		    ps.setString(2, user.getPassword());
   		    ps.setString(3, user.getRole());
   		    ps.setString(4, user.getStatus());
   		    ps.setInt(5, user.getWrongnum());
   		    ps.setString(6, user.getSex());
   		    ps.setString(7, user.getTele());
   		    ps.setString(8, user.getCardid());
   		    ps.setString(12, user.getUserid());
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
    public int insertUser(User user){
    	Connection  conn=DBUtil.getConnection();//�������ݿ�
   	 try {
			PreparedStatement ps=conn.prepareStatement("insert into uinfo(userid,username,password,role,status,wrongnum,sex,tele,cardid,question,answer,credit) values(?,?,?,?,?,?,?,?,?,?,?,?)");
		    ps.setString(1, user.getUserid());
		    ps.setString(2, user.getUsername());
		    ps.setString(3, user.getPassword());
		    ps.setString(4, user.getRole());
		    ps.setString(5, "1");
		    ps.setInt(6, 0);
		    ps.setString(7, user.getSex());
   		    ps.setString(8, user.getTele());
   		    ps.setString(9, user.getCardid());
   		    ps.setInt(12, 0);
   		   
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
