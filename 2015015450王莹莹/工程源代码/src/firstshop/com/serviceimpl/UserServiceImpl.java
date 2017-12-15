package firstshop.com.serviceimpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import firstshop.com.daoimpl.UserDaoImpl;
import firstshop.com.entity.User;
import firstshop.com.service.UserService;

@Component
@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserDaoImpl userDaoImpl;
	
	public void saveUser(User user) {
		this.userDaoImpl.saveUser(user);
		
	} 

	@Override
	public User login(String email, String password) {
		User user = this.userDaoImpl.findByEmail(email);
		if(user != null) {
			if(user.getPassword().equals(password)) {
				return user;
			}else {
				System.out.println("psdwrong");
				return null;
			}
		}else {
			System.out.println("notfound");
			return null;
		}
	}

	
	
}
