
package app.blank.biz;

import java.util.List;

import app.blank.entity.Msg;

public interface MsgBiz {
	
	List<Msg> msgList(String sendto);
	String addMsg(Msg msg);
	Msg getMsgInfo(int msgid);
	int delete(int msgid);
	int changeState(int msgid);
}