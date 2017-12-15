package firstshop.com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import firstshop.com.entity.Product;
import firstshop.com.serviceimpl.ProductServiceImpl;

@Controller
public class ProductController {
	@Resource
	private ProductServiceImpl productServiceImpl;
	
	@RequestMapping(value = "/addproduct",method = RequestMethod.POST)
	public String addProduct(@RequestParam("productname") String productname,@RequestParam("price") int price,Model model,HttpSession session) {
		
		Product product = new Product();
		product.setProductname(productname);
		product.setPrice(price);
		this.productServiceImpl.add(product);
		return "complete";
	}
	//查找全部
	@RequestMapping(value = "/findall")
	public String findAll(Model model,HttpSession session) {
		List<Product> list = this.productServiceImpl.findAll();
		session.setAttribute("products", list);
		return "findall";
	}
	//前台显示
	@RequestMapping(value = "/showall")
	public String showAll(Model model,HttpSession session) {
		List<Product> list = this.productServiceImpl.findAll();
		session.setAttribute("products", list);
		return "products";
	}
	//修改名称
	@RequestMapping(value = "/editname")
	public String editName(@RequestParam("id") int id,@RequestParam("productname") String productname,Model model,HttpSession session) {
		this.productServiceImpl.changeName(id, productname);
		
		return "complete";
	}
	//修改价格
	@RequestMapping(value = "/editprice")
	public String editPrice(@RequestParam("id") int id,@RequestParam("price") int price,Model model,HttpSession session) {
		this.productServiceImpl.changePrice(id, price);
		
		return "complete";
	}
	
	//删除商品
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam("id") int id,Model model,HttpSession session) {
		this.productServiceImpl.delete(id);
		return "complete";
	}
}
