package firstshop.com.dao;

import java.util.List;

import firstshop.com.entity.Product;

public interface ProductDao {
	List<Product> findAll();
	Product findById(int id);
	void add(Product product);
	void changeName(Product product,String name);
	void changePrice(Product product,int price);
	void delete(int id);
}
