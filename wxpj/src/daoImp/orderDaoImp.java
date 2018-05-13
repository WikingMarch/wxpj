package daoImp;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.orderDao;
import dao.userDao;
import entity.orderEntity;
import entity.userEntity;
@Repository("orderDao")
public class orderDaoImp implements orderDao{
@Autowired 
public SessionFactory sessionFactory;
	@Override
	public void saveOrupdate(orderEntity entity) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		session.saveOrUpdate(entity);
			tx.commit();
		
			
	}
	


	@Override
	public void deleteBy(orderEntity entity) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		session.delete(entity);
			tx.commit();
	}
	@Override
	public List<orderEntity> findListByUid(String uid) {
		// TODO Auto-generated method stub
		String hql = "FROM orderEntity WHERE D_Uid = ?";
		Session session=sessionFactory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		List<orderEntity> list=session.createQuery(hql).setString(0, uid).list();
			tx.commit();
			
		
			return list;
	}
	@Override
	public List<orderEntity> findListByWid(String wid) {
		// TODO Auto-generated method stub
		String hql = "FROM orderEntity WHERE D_Wid = ?";
		Session session=sessionFactory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		List<orderEntity> list=session.createQuery(hql).setString(0, wid).list();
			tx.commit();
		return list;
	}
	
}
