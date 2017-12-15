package firstshop.com.entity;

import java.util.HashMap;
import org.springframework.stereotype.Component;

@Component
public class Cart {
	//货物的id值,货物的信息
	private HashMap<Long,CartItem> container=new HashMap<Long,CartItem>();
	
	public HashMap<Long, CartItem> getContainer() {
		return container;
	}

	public void setContainer(HashMap<Long, CartItem> continer) {
		this.container = continer;
	}

	public void addCart(Product pro) {
		//如果购物车里物品已经存在
		
		 if(container.containsKey((long)pro.getId())) {
			 //根据键值取,shaping的数目加一
			 CartItem ct=container.get((long)pro.getId());
			 ct.setCount(ct.getCount()+1);
		 }else {//如果购物车里的物品不存在
			 CartItem ct=new CartItem();
			 ct.setProduct(pro);
			 ct.setCount(1);
			 container.put((long)pro.getId(),ct);
		 }
	}
	
	
}