package firstshop.com.dao;

import firstshop.com.entity.User;

public interface UserDao {
	void saveUser(User user);
	User findByEmail(String email);
}
