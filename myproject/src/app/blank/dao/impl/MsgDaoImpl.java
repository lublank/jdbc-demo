package app.blank.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import app.blank.dao.BaseDao;
import app.blank.dao.MsgDao;
import app.blank.entity.Msg;


public class MsgDaoImpl extends BaseDao implements MsgDao {

	/**
	 * message详情
	 */
	@Override
	public Msg getMsgById(int msgId) {
		Msg msg = null;
		String sql = "select * from msg where msgid=?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			con = this.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, msgId);
			rs = stmt.executeQuery();
			if(rs.next()){
				msg = new Msg();
				msg.setMsgid(rs.getInt("msgid"));
				msg.setUsername(rs.getString("username"));
				msg.setTitle(rs.getString("title"));
				msg.setMsgcontent(rs.getString("msgcontent"));
				msg.setState(rs.getInt("state"));
				msg.setSendto(rs.getString("sendto"));
				msg.setCreate_date(rs.getString("create_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, stmt, rs);
		}
		return msg;
	}

	/**
	 * message列表
	 */
	@Override
	public List<Msg> msgList(String sendTo) {
		List<Msg> msgList = new ArrayList<Msg>();
		String sql = "select * from msg where sendto=?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = this.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, sendTo);
			rs = stmt.executeQuery();
			while(rs.next()){
				Msg msg = new Msg();
				msg.setMsgid(rs.getInt("msgid"));
				msg.setUsername(rs.getString("username"));
				msg.setTitle(rs.getString("title"));
				msg.setMsgcontent(rs.getString("msgcontent"));
				msg.setState(rs.getInt("state"));
				msg.setSendto(rs.getString("sendto"));
				msg.setCreate_date(rs.getString("create_date"));
				msgList.add(msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, stmt, rs);
		}
		return msgList;
	}

	/**
	 * 新增message
	 */
	@Override
	public int addMsg(Msg msg) {
		String sql = "insert into msg(username,title,msgcontent,state,sendto,create_date) values(?,?,?,?,?,?)";
		
		SimpleDateFormat   formatter   =   new   SimpleDateFormat   ("yyyy-MM-dd HH:mm:ss");
		 Date   curDate   =   new   Date(System.currentTimeMillis());//获取当前时间     
		String   str   =   formatter.format(curDate); 
		return this.executeUpdate(sql,
									msg.getUsername(),
									msg.getTitle(),
									msg.getMsgcontent(),
									msg.getState(),
									msg.getSendto(),
									str);
	
	}

	/**
	 * 删除message
	 */
	@Override
	public int deleteMsg(int no) {
		String sql = "delete from msg where msgid=?";
		return this.executeUpdate(sql, no);
	}

	/**
	 * 更改状态
	 */
	@Override
	public int changeState(int msgid) {
		String sql = "update msg set state=0 where msgid=?";
		return this.executeUpdate(sql, msgid);
	}
	
}






