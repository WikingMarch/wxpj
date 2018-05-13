package dao;

import java.util.List;

import entity.orderEntity;


public interface orderDao {
	
public void saveOrupdate(orderEntity entity);
public void deleteBy(orderEntity entity);
public List<orderEntity> findListByUid(String uid);
public List<orderEntity> findListByWid(String wid);

}
