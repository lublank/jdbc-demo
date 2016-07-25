
package app.blank.biz.impl;

import java.util.List;

import app.blank.biz.MsgBiz;
import app.blank.dao.MsgDao;
import app.blank.dao.impl.MsgDaoImpl;
import app.blank.entity.Msg;


public class MsgBizImpl implements MsgBiz {

	MsgDao dao = new MsgDaoImpl();
	/**
	 * message列表
	 */
	@Override
	public List<Msg> msgList(String sendto) {
		return dao.msgList(sendto);
	}

	/**
	 * 新增message
	 */
	@Override
	public String addMsg(Msg msg) {
		if (dao.addMsg(msg)>0) {
			return "发送成功";
		}else {
			return "发送失败";
		}
	}

	/**
	 * message详情
	 */
	@Override
	public Msg getMsgInfo(int msgid) {
		return dao.getMsgById(msgid);
	}

	/**
	 * 删除message
	 */
	@Override
	public int delete(int msgid) {
		return dao.deleteMsg(msgid);
	}

	/** 
	 * 修改状态
	 */
	@Override
	public int changeState(int msgid) {
		return dao.changeState(msgid);
	}
}
	
