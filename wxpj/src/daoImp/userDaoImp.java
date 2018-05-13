package daoImp;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.userDao;
import entity.userEntity;
@Repository("userDao")
public class userDaoImp implements userDao{
@Autowired 
public SessionFactory sessionFactory;
	@Override
	public void saveOrupdate(userEntity entity) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		session.saveOrUpdate(entity);
			tx.commit();
		
			
	}
	@Override
	public boolean isExistByPhone(String phone) {
		// TODO Auto-generated method stub
		String hql = "FROM userEntity WHERE U_Tel = ?";
		Session session=sessionFactory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		List<userEntity> list=session.createQuery(hql).setString(0, phone).list();
			tx.commit();
			
		if(list.size()==0)
		return false;
		else 
			return true;
	}
	@Override
	public userEntity findByTelandPassWord(String tel, String password) {
		// TODO Auto-generated method stub
		String hql = "FROM userEntity WHERE U_Tel = ? and U_Password=?";
		Session session=sessionFactory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		List<userEntity> list=session.createQuery(hql).setString(0, tel).setString(1, password).list();
			tx.commit();
			
			
			if(list.size()==0)
				return null;
			else
				return 
						list.get(0);
		
	}
	@Override
	public userEntity findByPhone(String phone) {
		// TODO Auto-generated method stub
		String hql = "FROM userEntity WHERE U_Tel = ?";
		Session session=sessionFactory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		List<userEntity> list=session.createQuery(hql).setString(0, phone).list();
			tx.commit();
			
		if(list.size()==0)
		return null;
		else 
			return list.get(0);
	}
	
	

}
