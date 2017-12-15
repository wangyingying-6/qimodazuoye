package firstshop.com.dao;

import javax.servlet.http.HttpServletRequest;

import firstshop.com.entity.CartItem;
import firstshop.com.entity.Product;

public interface CartDao {
	Product findById(int id);
	void updateCart(Product product);
	CartItem findbyKey(long key,HttpServletRequest request);
	void deleteCart(CartItem cartItem);
}
