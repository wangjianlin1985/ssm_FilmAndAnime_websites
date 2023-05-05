package com.sheep.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sheep.dao.UserMapper;
import com.sheep.pojo.User;
import com.sheep.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Transactional(readOnly = true)
	@Override
	public User userLogin(User user) {
		return this.userMapper.selectByUserNameAndPass(user);
	}

	@Transactional
	@Override
	public int userRegister(User user) {
		return this.userMapper.insertSelective(user);
	}

	@Override
	public boolean findUserByUserName(String userName) {
		boolean flag = false;
		int i = this.userMapper.findUserByUserName(userName);
		if (i > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public User updateUser(User user) {
		int i = this.userMapper.updateByPrimaryNameSelective(user);
		User userResult = null;
		if (i > 0) {
			userResult = this.userMapper.selectByUserName(user);
		}
		return userResult;
	}

	@Override
	public List<User> getUserList() {
		return this.userMapper.getUsers();
	}

}
