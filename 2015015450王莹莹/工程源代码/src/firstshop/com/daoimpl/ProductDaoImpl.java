package firstshop.com.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import firstshop.com.dao.ProductDao;
import firstshop.com.entity.Product;


@Component
@Repository
@Transactional
public class ProductDaoImpl implements ProductDao{

	@Autowired
	private SessionFactory sessionFactory;
	//查询全部
	@Override
	public List<Product> findAll() {
		List<Product> list = sessionFactory.openSession().createQuery("from Product").list();
		return list;
	}

	//增加商品
	@Override
	public void add(Product product) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		
		session.save(product);
		tx.commit();
		session.close();
		
	}

	//通过id查找
	@Override
	public Product findById(int id) {
		String hql = "from Product where id = ?";
		Product product =  (Product) sessionFactory.openSession().createQuery(hql).setParameter(0, id).uniqueResult();
		return product;
		
	}
	//更新商品名
	@Override
	public void changeName(Product product, String name) {
		String hql = "update Product set productname = ? where id = ?";
		int ret = sessionFactory.openSession().createQuery(hql).setParameter(0, name).setParameter(1, product.getId()).executeUpdate();
	}

	//更新商品价格
	@Override
	public void changePrice(Product product, int price) {
		String hql = "update Product set price = ? where id = ?";
		int ret = sessionFactory.openSession().createQuery(hql).setParameter(0, price).setParameter(1, product.getId()).executeUpdate();
		
	}
	//删除商品
	@Override
	public void delete(int id) {
		String hql = "delete from Product where id = ?";
		int ret = sessionFactory.openSession().createQuery(hql).setParameter(0, id).executeUpdate();
	}

}
