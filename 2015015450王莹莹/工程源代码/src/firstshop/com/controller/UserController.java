package firstshop.com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import firstshop.com.entity.User;
import firstshop.com.serviceimpl.UserServiceImpl;

@Controller

public class UserController {
	@Resource
	private UserServiceImpl userServiceImpl;
	
	@RequestMapping(value = "/signup",method = RequestMethod.POST)
	public String signUp(@RequestParam("username") String username,
					     @RequestParam("email") String email,
					     @RequestParam("password") String password,
					     @RequestParam("repassword") String repassword,Model model,HttpSession session){
					    	 if(password.equals(repassword)) {
					    		 User user = new User();
					    		 user.setUsername(username);
					    		 user.setEmail(email);
					    		 user.setPassword(repassword);
					    		 this.userServiceImpl.saveUser(user);
					    		 return "index";
					    	 }else {
					    		 return "account";
					    	 }
					     }

	@RequestMapping(value = "/login",method = RequestMethod.POST)
		public String login(@RequestParam("email") String email,@RequestParam("password") String password,Model model,HttpSession session) {
			User user = this.userServiceImpl.login(email, password);
			if(user != null) {
				session.setAttribute("username", user.getUsername());
				return "index";
			}else {
				System.out.println("notfound");
				return "account";
			}
	}
	
}
