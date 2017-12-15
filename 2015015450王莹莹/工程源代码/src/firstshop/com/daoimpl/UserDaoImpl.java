package firstshop.com.daoimpl;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import firstshop.com.dao.UserDao;
import firstshop.com.entity.Product;
import firstshop.com.entity.User;


@Component
@Repository
@Transactional
public class UserDaoImpl implements UserDao{

	@Resource
	private SessionFactory sessionFactory;
	@Override
	public void saveUser(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		
		session.save(user);
		tx.commit();
		session.close();
		
	}
	
	@Override
	public User findByEmail(String email) {
		String hql = "from User where email = ?";
		User user =  (User) sessionFactory.openSession().createQuery(hql).setParameter(0, email).uniqueResult();
		return user;
		
	}

}
