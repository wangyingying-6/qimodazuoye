package firstshop.com.daoimpl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;

import firstshop.com.dao.CartDao;
import firstshop.com.entity.Cart;
import firstshop.com.entity.CartItem;
import firstshop.com.entity.Product;

public class CartDaoImpl implements CartDao{
	@Resource
	private SessionFactory sessionFactory;

	@Override
	public Product findById(int id) {
		String hql = "from Product where id = ?";
		Product product =  (Product) sessionFactory.openSession().createQuery(hql).setParameter(0, id).uniqueResult();
		return product;
	}

	@Override
	public void updateCart(Product product) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(product);
		
	}

	@Override
	public CartItem findbyKey(long key, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		CartItem cartItem = cart.getContainer().get(key);
		return cartItem;
	}

	@Override
	public void deleteCart(CartItem cartItem) {
		cartItem.setCount(cartItem.getCount()-1);
	}
	
	
}
