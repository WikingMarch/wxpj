package Service;

import java.util.List;

import entity.userEntity;
import entity.weixiurenEntity;

public interface weixiurenService {

	public void addNewWxr(weixiurenEntity entity);
	public void deleteWxr(weixiurenEntity entity);
	
	public boolean isExistByPhone(String phone);
	public weixiurenEntity loginbyPhone(String phone);
	public weixiurenEntity loginbyPW(String phone,String Password);
	public List<weixiurenEntity> findListByA_id(String a_id);
	public weixiurenEntity findbyId(String wid);
}
