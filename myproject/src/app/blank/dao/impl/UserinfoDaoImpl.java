package app.blank.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import app.blank.dao.BaseDao;
import app.blank.dao.UserinfoDao;
import app.blank.entity.Userinfo;


public class UserinfoDaoImpl extends BaseDao implements UserinfoDao {

	/**
	 * 查找用户
	 */
	@Override
	public Userinfo getInfoByName(String username) {
		Userinfo info = null;
		String sql = "select * from msg_userinfo where username=?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			con = this.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			if(rs.next()){
				info = new Userinfo();
				info.setUsername(rs.getString("username"));
				info.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, stmt, rs);
		}
	
		return info;
	}
	/**
	 * 列出用户
	 */
	@Override
	public List<Userinfo> list() {
		List<Userinfo> infoList = new ArrayList<Userinfo>();
		String sql = "select * from msg_userinfo";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = this.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				Userinfo info = new Userinfo();
				info.setUsername(rs.getString("username"));
				info.setPassword(rs.getString("password"));
				info.setEmail(rs.getString("email"));
				infoList.add(info);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, stmt, rs);
		}
		
		
		return infoList;
	}

	/**
	 * 新增用户
	 */
	@Override
	public int add(Userinfo info) {
		String sql = "insert into msg_userinfo values(?,?,?)";
		
		return this.executeUpdate(sql, info.getUsername(),info.getPassword(),info.getEmail());
	}

	/**
	 * 更新用户
	 */
	@Override
	public int update(Userinfo info) {
		String sql = "update msg_userinfo set username=?,password=?,email=?";
		
		return this.executeUpdate(sql, info.getUsername(),info.getPassword(),info.getEmail());
	}

	/**
	 * 删除用户
	 */
	@Override
	public int delete(int username) {
		String sql = "delete from msg_userinfo where username=?";
		
		return this.executeUpdate(sql, username);
	}
	
}






