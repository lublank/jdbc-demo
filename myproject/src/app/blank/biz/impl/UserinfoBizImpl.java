
package app.blank.biz.impl;

import java.util.List;

import app.blank.biz.UserinfoBiz;
import app.blank.dao.UserinfoDao;
import app.blank.dao.impl.UserinfoDaoImpl;
import app.blank.entity.Userinfo;


public class UserinfoBizImpl implements UserinfoBiz {

	UserinfoDao dao = new UserinfoDaoImpl();

	@Override
	public Userinfo login(String username, String password) {
		Userinfo info = dao.getInfoByName(username);
		if (info==null) {
			return null;
		}
		if(info.getPassword().equals(password)){
			return info;
		}
		return null;
	}


	@Override
	public String register(Userinfo userinfo) {
		Userinfo info = dao.getInfoByName(userinfo.getUsername());
		if (info!=null) {
			return "该用户已存在";
		}
		if(dao.add(userinfo)>0){
			return "添加成功";
		}else{
			return "添加失败";
		}
	}


	@Override
	public List<Userinfo> getAll() {
		return dao.list();
	}
	
}
	
