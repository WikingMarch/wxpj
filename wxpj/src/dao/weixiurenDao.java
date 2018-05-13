package dao;

import java.util.List;

import entity.userEntity;
import entity.weixiurenEntity;

public interface weixiurenDao {
	
public void saveOrupdate(weixiurenEntity entity);
public boolean isExistByPhone(String phone);
public weixiurenEntity findByPhone(String phone);
public weixiurenEntity findByTelandPassWord(String tel,String password );
public List<weixiurenEntity> findListByAddress(String xuexiao,String xiaoqu);
public weixiurenEntity findById(String wid);

}
