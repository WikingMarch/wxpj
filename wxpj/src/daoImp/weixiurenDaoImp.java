package daoImp;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.userDao;
import dao.weixiurenDao;
import entity.addressEntity;
import entity.userEntity;
import entity.weixiurenEntity;
@Repository("weixiurenDao")
public class weixiurenDaoImp implements weixiurenDao{
@Autowired 
public SessionFactory sessionFactory;
	@Override
	public void saveOrupdate(weixiurenEntity entity) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		session.saveOrUpdate(entity);
			tx.commit();
		
			
	}
	@Override
	public boolean isExistByPhone(String phone) {
		// TODO Auto-generated method stub
		String hql = "FROM weixiurenEntity WHERE W_Tel = ?";
		Session session=sessionFactory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		List<weixiurenEntity> list=session.createQuery(hql).setString(0, phone).list();
			tx.commit();
			
		if(list.size()==0)
		return false;
		else 
			return true;
	}
	@Override
	public weixiurenEntity findByTelandPassWord(String tel, String password) {
		// TODO Auto-generated method stub
		String hql = "FROM weixiurenEntity WHERE W_Tel = ? and W_Password=?";
		Session session=sessionFactory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		List<weixiurenEntity> list=session.createQuery(hql).setString(0, tel).setString(1, password).list();
			tx.commit();
			
			
			if(list.size()==0)
				return null;
			else
				return 
						list.get(0);
		
	}
	@Override
	public weixiurenEntity findByPhone(String phone) {
		// TODO Auto-generated method stub
		String hql = "FROM weixiurenEntity WHERE W_Tel = ?";
		Session session=sessionFactory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		List<weixiurenEntity> list=session.createQuery(hql).setString(0, phone).list();
			tx.commit();
			
		if(list.size()==0)
		return null;
		else 
			return list.get(0);
	}
	@Override
	public List<weixiurenEntity> findListByAddress(String xuexiao, String xiaoqu) {
		// TODO Auto-generated method stub
		String hql = "FROM weixiurenEntity WHERE W_Xuexiao = ? and W_Xiaoqu=?";
		Session session=sessionFactory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		List<weixiurenEntity> list=session.createQuery(hql).setString(0, xuexiao).setString(1, xiaoqu).list();
			tx.commit();
				return list;
			
	}
	@Override
	public weixiurenEntity findById(String wid) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Transaction tx=session.beginTransaction();
		 weixiurenEntity entity=(weixiurenEntity) session.get(weixiurenEntity.class,Integer.parseInt(wid));
			tx.commit();
	return entity;
	}
	
	

}
