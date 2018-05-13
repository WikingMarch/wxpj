package dao;

import java.util.List;

import entity.addressEntity;


public interface addressDao {
	
public void saveOrupdate(addressEntity entity);
public void deleteAddress(addressEntity entity);
public List<addressEntity> findAddressByUserId(String uid);
public addressEntity findAddressById(String id);
}
