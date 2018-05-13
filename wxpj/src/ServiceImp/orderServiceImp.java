package ServiceImp;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.orderDao;
import dao.userDao;

import entity.orderEntity;
import entity.userEntity;
import Service.orderService;
import Service.userService;
@Service("orderService")
public class orderServiceImp implements orderService {
@Autowired 
  orderDao orderDao;

@Override
public void saveOrupdate(orderEntity entity) {
	// TODO Auto-generated method stub
	orderDao.saveOrupdate(entity);
}

@Override
public void deleteBy(orderEntity entity) {
	// TODO Auto-generated method stub
	orderDao.deleteBy(entity);
}

@Override
public List<orderEntity> findListByUid(String uid) {
	// TODO Auto-generated method stub
	return orderDao.findListByUid(uid);
}

@Override
public List<orderEntity> findListByWid(String wid) {
	// TODO Auto-generated method stub
	return orderDao.findListByWid(wid);
}
	
}
