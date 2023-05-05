package com.sheep.service;

import java.util.List;

import com.sheep.pojo.User;

public interface UserService {
	/**
	 * ÓÃ»§µÇÂ¼
	 * @param user
	 * @return
	 */
	public User userLogin(User user);

	public int userRegister(User user);
	
	public boolean findUserByUserName(String userName);
	
	public User updateUser(User user);

	public List<User> getUserList();
}
