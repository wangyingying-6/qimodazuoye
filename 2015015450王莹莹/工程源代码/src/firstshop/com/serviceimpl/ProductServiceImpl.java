package firstshop.com.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import firstshop.com.daoimpl.ProductDaoImpl;
import firstshop.com.entity.Product;
import firstshop.com.service.ProductService;

@Component
@Service
@Transactional
public class ProductServiceImpl implements ProductService{

	@Resource
	private ProductDaoImpl productDaoImpl;
	
	@Override
	public void add(Product product) {
		this.productDaoImpl.add(product);
		
	}

	@Override
	public List<Product> findAll() {
		return this.productDaoImpl.findAll();
	}

	@Override
	public void changeName(int id,String name) {
		Product product = this.productDaoImpl.findById(id);
		this.productDaoImpl.changeName(product, name);
		
	}

	@Override
	public void changePrice(int id, int price) {
		Product product = this.productDaoImpl.findById(id);
		this.productDaoImpl.changePrice(product, price);
		
	}

	@Override
	public void delete(int id) {
		this.productDaoImpl.delete(id);
		
	}

	

}
