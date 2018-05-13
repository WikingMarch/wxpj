package daoImp;




import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;


import dao.baoxianguiDao;
import entity.baoxianguiEntity;
@Repository("baoxianDao")
public class baoxianguiDaoImp implements baoxianguiDao {



@Autowired
SessionFactory sessionFactory;
 

	@Override
	public void saveOrupdate(baoxianguiEntity entity) {
	Session session=sessionFactory.getCurrentSession();
	Transaction tx=session.beginTransaction();
	session.saveOrUpdate(entity);
		tx.commit();

		
	}

}
