package firstshop.com.service;

import javax.servlet.http.HttpServletRequest;

public interface CartService {
	void addCart(int id,HttpServletRequest request);
	void showCart(HttpServletRequest request);
	void deleteCart(long key,HttpServletRequest request);
}
