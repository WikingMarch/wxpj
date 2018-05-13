package ServiceImp;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.addressDao;
import dao.userDao;

import entity.addressEntity;
import entity.userEntity;
import Service.addressService;
import Service.userService;
@Service("addressService")
public class addressServiceImp implements addressService {
@Autowired 
  addressDao addressDao;

@Override
public void addNewAddress(addressEntity entity) {
	// TODO Auto-generated method stub
	addressDao.saveOrupdate(entity);
}

@Override
public void deleteAddress(addressEntity entity) {
	// TODO Auto-generated method stub
	addressDao.deleteAddress(entity);

}

@Override
public List<addressEntity> findAddressByUserId(String uid) {
	// TODO Auto-generated method stub
	return addressDao.findAddressByUserId(uid);
}

@Override
public addressEntity findAddressById(String id) {
	// TODO Auto-generated method stub
	return addressDao.findAddressById(id);
}


	

}
