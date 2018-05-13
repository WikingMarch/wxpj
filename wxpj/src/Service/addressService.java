package Service;

import java.util.List;

import entity.addressEntity;
import entity.userEntity;

public interface addressService {

	public void addNewAddress(addressEntity entity);
	public void deleteAddress(addressEntity entity);
	//public void updateUser(userEntity entity);
	//public boolean isExistByPhone(String phone);
	public List<addressEntity> findAddressByUserId(String uid);
	public addressEntity findAddressById(String id);
}
