
package app.blank.biz;

import java.util.List;

import app.blank.entity.Userinfo;

public interface UserinfoBiz {
	
	Userinfo login(String username, String password);
	
	String register(Userinfo info);
	
	List<Userinfo> getAll();
}