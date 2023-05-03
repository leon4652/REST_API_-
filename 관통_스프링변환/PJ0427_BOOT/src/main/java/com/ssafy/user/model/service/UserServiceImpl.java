package com.ssafy.user.model.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssafy.user.model.User;
import com.ssafy.user.model.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	private UserMapper userMapper;	
	public UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	@Override
	public User loginUser(User user) throws Exception {
		System.out.println("서비스");
		return userMapper.loginUser(user);
	}

}
