package iplms;

import java.util.List;

import entities.User;

public interface IUser {
	
	public User login(User user);
	
	public int addUser(User user);
	
	public int updateUser(User user);
	
	public int delUser(int id);
	
	public List<User> getUsers();
	
	public User getUserById(int id);
}
