package Service;

import java.util.List;

import entity.orderEntity;


public interface orderService {
	
public void saveOrupdate(orderEntity entity);
public void deleteBy(orderEntity entity);
public List<orderEntity> findListByUid(String uid);
public List<orderEntity> findListByWid(String wid);

}
