package ServiceImp;


import java.util.List;
import dao.weixiurenDao;
import dao.addressDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




import entity.addressEntity;
import entity.weixiurenEntity;

import Service.weixiurenService;
@Service("weixiurenService")
public class weixiurenServiceImp implements weixiurenService {
@Autowired 
 private weixiurenDao weixiurenDao;
@Autowired 
private addressDao addressDao;
@Override
public void addNewWxr(weixiurenEntity entity) {
	// TODO Auto-generated method stub
	weixiurenDao.saveOrupdate(entity);
}

@Override
public void deleteWxr(weixiurenEntity entity) {
	// TODO Auto-generated method stub
	
}

@Override
public boolean isExistByPhone(String phone) {
	// TODO Auto-generated method stub
	return weixiurenDao.isExistByPhone(phone);
}

@Override
public weixiurenEntity loginbyPhone(String phone) {
	// TODO Auto-generated method stub
	return weixiurenDao.findByPhone(phone);
}

@Override
public weixiurenEntity loginbyPW(String phone, String Password) {
	// TODO Auto-generated method stub
	return weixiurenDao.findByTelandPassWord(phone, Password);
}

@Override
public List<weixiurenEntity> findListByA_id(String a_id) {
	// TODO Auto-generated method stub
	
	addressEntity entity=addressDao.findAddressById(a_id);
	System.out.println(entity.getA_xiaoqu()+"=============xuexiao"+entity.getA_xuexiao());
	return weixiurenDao.findListByAddress(entity.getA_xuexiao(), entity.getA_xiaoqu());
	
}

@Override
public weixiurenEntity findbyId(String wid) {
	// TODO Auto-generated method stub
	return weixiurenDao.findById(wid);
}


}
