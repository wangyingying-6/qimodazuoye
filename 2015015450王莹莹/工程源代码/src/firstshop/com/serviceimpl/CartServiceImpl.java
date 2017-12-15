 package firstshop.com.serviceimpl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import firstshop.com.daoimpl.CartDaoImpl;
import firstshop.com.daoimpl.ProductDaoImpl;
import firstshop.com.entity.Cart;
import firstshop.com.entity.CartItem;
import firstshop.com.entity.Product;
import firstshop.com.service.CartService;

@Service
public class CartServiceImpl implements CartService{

	@Resource
	private ProductDaoImpl productDaoImpl;
	private CartDaoImpl cartDaoImpl;
	
	@Override
	public void addCart(int id, HttpServletRequest request) {
		Product product = this.productDaoImpl.findById(id);
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
		}
		cart.addCart(product);
		session.setAttribute("cart", cart);
	}

	@Override
	public void showCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
	}

	@Override
	public void deleteCart(long key,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		CartItem cartItem = cart.getContainer().get(key);
		if(cartItem.getCount() == 1) {
			cart.getContainer().remove(key);
		}else {
			cartItem.setCount(cartItem.getCount()-1);
		}
	}

}
