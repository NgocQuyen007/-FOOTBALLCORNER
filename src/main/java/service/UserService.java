package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.UserDao;
import entities.User;
import iplms.IUser;

@Service
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
public class UserService implements IUser{

	@Autowired
	UserDao userDao;
	
	@Override
	@Transactional
	public User login(User user) {
		return userDao.login(user);
	}

	@Override
	@Transactional
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public int delUser(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
