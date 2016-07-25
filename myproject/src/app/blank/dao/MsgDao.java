package app.blank.dao;

import java.util.List;

import app.blank.entity.Msg;

public interface MsgDao {
	
	Msg getMsgById(int msgId);
	
	List<Msg> msgList(String sendTo);
	int addMsg(Msg msg);
	int deleteMsg(int no);
	int changeState(int msgid);
}






