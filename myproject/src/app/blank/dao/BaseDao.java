package app.blank.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class BaseDao {
	
//	private static final String URL="jdbc:odbc:message"; 
//	private static final String DRIVER_CLASS_NAME="sun.jdbc.odbc.JdbcOdbcDriver";
	private static final String URL="jdbc:sqlserver://localhost:1433;DatabaseName=message"; 
	private static final String USERNAME="sa"; 
	private static final String PASSWORD="sa"; 
	private static final String DRIVER_CLASS_NAME="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	
	//驱动
	static{
		try {
			Class.forName(DRIVER_CLASS_NAME);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取连接对象
	 *@author Lu.bl
	 *@date 2015-5-28
	 * @return
	 */
	public Connection getConnection(){
		Connection con = null;
		try {
//			con = DriverManager.getConnection(URL);
			con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	/**
	 * 关闭并释放资源
	 *@author Lu.bl
	 *@date 2015-5-28
	 * @param con 连接对象
	 * @param stmt 语句对象
	 * @param rs 结果集对象
	 */
	public void closeAll(Connection con, Statement stmt, ResultSet rs){
		if(null != rs){
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(null != stmt){
			try {
				stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(null != con){
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 执行非查询SQL
	 *@author Lu.bl
	 *@date 2015-5-28
	 * @param sql 要执行的sql
	 * @param params SQL语句的参数
	 * @return 受影响的行数
	 */
	public int executeUpdate(String sql, Object... params){
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		
		try{
			con = this.getConnection();
			pstmt = con.prepareStatement(sql);
			if(null != params){
				for(int i=0; i<params.length; i++){
					pstmt.setObject(i+1, params[i]);
				}
			}
			count = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll(con, pstmt, null);
		}
		return count;
	}
}
