package app.blank.dao;

import java.util.List;

import app.blank.entity.Userinfo;

public interface UserinfoDao {
	
	Userinfo getInfoByName(String username);
	List<Userinfo> list();
	int add(Userinfo student);
	int update(Userinfo student);
	int delete(int username);
}






