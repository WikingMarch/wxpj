package ServiceImp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.userDao;

import entity.userEntity;
import Service.userService;
@Service("userService")
public class userServiceImp implements userService {
@Autowired 
  userDao userDao;
	@Override
	public void addNewUser(userEntity entity) {
		// TODO Auto-generated method stub
		userDao.saveOrupdate(entity);
	}

	@Override
	public void deleteUser(userEntity entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUser(userEntity entity) {
		// TODO Auto-generated method stub
		userDao.saveOrupdate(entity);
	}

	@Override
	public boolean isExistByPhone(String phone) {
		// TODO Auto-generated method stub
		return userDao.isExistByPhone(phone);
	}

	@Override
	public userEntity loginbyPhone(String phone) {
		// TODO Auto-generated method stub
		return userDao.findByPhone(phone);
	}

	@Override
	public userEntity loginbyPW(String phone, String Password) {
		// TODO Auto-generated method stub
		return userDao.findByTelandPassWord(phone, Password);
	}

}
