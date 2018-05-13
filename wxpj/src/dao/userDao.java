package dao;

import entity.userEntity;

public interface userDao {
	
public void saveOrupdate(userEntity entity);
public boolean isExistByPhone(String phone);
public userEntity findByPhone(String phone);
public userEntity findByTelandPassWord(String tel,String password );

}
