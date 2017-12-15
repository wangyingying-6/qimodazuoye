package firstshop.com.service;

import firstshop.com.entity.User;

public interface UserService {
	void saveUser(User user);
	User login(String email,String password);
}
