package firstshop.com.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import firstshop.com.entity.Cart;
import firstshop.com.entity.CartItem;

@Controller
public class BuyBuyBuyController {
	
	@RequestMapping(value = "/buybuybuy",method = RequestMethod.GET)
	public String buyBuyBuy(HttpServletRequest request) {
		int money = 0;
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		HashMap<Long, CartItem> container = cart.getContainer();
		Iterator iterator = container.entrySet().iterator();
		while(iterator.hasNext()) {
			Map.Entry entry = (Entry) iterator.next();
			CartItem cartItem = (CartItem) entry.getValue();
			int count = cartItem.getCount();
			int price = cartItem.getProduct().getPrice();
			money += count*price;
		}
		session.setAttribute("money", money);
		return "buybuybuy";
	}
}
