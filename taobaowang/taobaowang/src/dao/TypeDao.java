package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBUtil;

import entity.Type;

public class TypeDao {
	public int addType(Type type){
		Connection conn=DBUtil.getConnection();
		try {
		PreparedStatement ps=
			conn.prepareStatement("insert into stype(sid,sname,totalnum,simage,sdesc) values(?,?,?,?,?)");
			ps.setString(1,type.getSid());
			ps.setString(2,type.getSname());
			ps.setInt(3,type.getTotalnum());
			ps.setString(4,type.getSimage());
			ps.setString(5,type.getSdesc());
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
	public int updateType(Type type){
		Connection conn=DBUtil.getConnection();
		try {
		PreparedStatement ps=
			conn.prepareStatement("update stype set sname=?,totalnum=?,sdesc=?,simage=? where sid=?");
			ps.setString(1,type.getSname());
			ps.setInt(2,type.getTotalnum());
			ps.setString(3,type.getSdesc());
			ps.setString(4,type.getSimage());
			ps.setString(5,type.getSid());
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
	public int deleteType(String sid){
		Connection conn=DBUtil.getConnection();
		try {
		PreparedStatement ps=
			conn.prepareStatement("delete from stype where sid=?");
			ps.setString(1,sid);		
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
	public  Type getTypeByid(String sid){
		//��ȡ����
		Connection conn=DBUtil.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select * from stype where sid=?");
			ps.setString(1, sid);
			ResultSet rs=ps.executeQuery();
			//����һ�����϶���
						
			if(rs.next()){
				Type type=new Type();
				type.setSid(rs.getString("sid"));
				type.setSname(rs.getString("sname"));
				type.setTotalnum(rs.getInt("totalnum"));
				type.setSdesc(rs.getString("sdesc"));
				type.setSimage(rs.getString("simage"));
				DBUtil.closeAll(conn, ps, rs);	
				return type;				
			}
			//��ѭ������ʱ�������û���Ϣ����װ��ArrayList������			
			
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
		return null;
	}
	public ArrayList<Type> getTypes(){
		Connection conn=DBUtil.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select * from stype");
			ResultSet rs=ps.executeQuery();
			//����һ�����϶���
			ArrayList<Type> mytypes=new ArrayList<Type>();			
			while(rs.next()){
				Type type=new Type();
				type.setSid(rs.getString("sid"));
				type.setSname(rs.getString("sname"));
				type.setTotalnum(rs.getInt("totalnum"));
				type.setSdesc(rs.getString("sdesc"));
				type.setSimage(rs.getString("simage"));
				mytypes.add(type);				
			}
			//��ѭ������ʱ�������û���Ϣ����װ��ArrayList������			
			DBUtil.closeAll(conn, ps, rs);	
			return mytypes;
					
		} catch (SQLException e) {
			e.printStackTrace();
		}			
		return null;
	}
	public static void main(String[] args) {
		TypeDao dao=new TypeDao();
		System.out.println(dao.getTypes().size());
	}
}
