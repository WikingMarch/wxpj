package Service;

import entity.userEntity;

public interface userService {

	public void addNewUser(userEntity entity);
	public void deleteUser(userEntity entity);
	public void updateUser(userEntity entity);
	public boolean isExistByPhone(String phone);
	public userEntity loginbyPhone(String phone);
	public userEntity loginbyPW(String phone,String Password);
}
