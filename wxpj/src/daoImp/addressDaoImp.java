package daoImp;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.addressDao;
import dao.userDao;
import entity.addressEntity;
import entity.userEntity;
@Repository("addressDao")
public class addressDaoImp implements addressDao{
@Autowired 
public SessionFactory sessionFactory;

@Override
public void saveOrupdate(addressEntity entity) {
	// TODO Auto-generated method stub
	Session session=sessionFactory.getCurrentSession();
	Transaction tx=session.beginTransaction();
	session.saveOrUpdate(entity);
		tx.commit();
}

@Override
public void deleteAddress(addressEntity entity) {
	// TODO Auto-generated method stub
	Session session=sessionFactory.getCurrentSession();
	Transaction tx=session.beginTransaction();
	session.delete(entity);
		tx.commit();
	
}

@Override
public List<addressEntity> findAddressByUserId(String uid) {
	// TODO Auto-generated method stub
	String hql = "FROM addressEntity WHERE U_Id = ? ";
	Session session=sessionFactory.getCurrentSession();
	Transaction tx=session.beginTransaction();
	List<addressEntity> list=session.createQuery(hql).setString(0, uid).list();
		tx.commit();
		
		
	
			return  list;
}

@Override
public addressEntity findAddressById(String id) {
	// TODO Auto-generated method stub
	Session session=sessionFactory.getCurrentSession();
	Transaction tx=session.beginTransaction();
	 addressEntity entity=(addressEntity) session.get(addressEntity.class,Integer.parseInt(id));
		tx.commit();
return entity;
}
	

}
