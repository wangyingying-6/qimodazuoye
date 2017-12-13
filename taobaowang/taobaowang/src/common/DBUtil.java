package common;
//数据库操作的所有类
import java.sql.*;
//在项目中加载驱动程序包
public class DBUtil {
	//获取一个连接对象
	public static Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Connection conn=null;
		 try {
			conn=DriverManager.getConnection("jdbc:oracle:thin:@127.0.1:1521:Orcl","hot","hot");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	public static void closeAll(Connection conn,PreparedStatement ps,ResultSet rs){
		try{if(rs!=null){
			rs.close();
		}
		if(ps!=null){
			ps.close();
		}
		if(conn!=null){
			conn.close();
		}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException{
		//选择驱动程序
		Connection conn=DBUtil.getConnection();
		String sql="select * from uinfo";
		PreparedStatement ps = conn.prepareStatement("sql");
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			System.out.println(rs.getString("username")+"");
			System.out.println(rs.getString("role")+"");
			System.out.println(rs.getString("status"));
		}
		DBUtil.closeAll(conn, ps, rs);
	}
}
