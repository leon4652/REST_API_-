package com.ssafy.enjoytrip.user.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.user.model.User;
import com.ssafy.enjoytrip.user.model.mapper.UserMapper;
import com.ssafy.enjoytrip.user.model.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	private UserMapper userMapper;
	
	private UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	@Override
	public User login(String id, String pw) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		return userMapper.login(map);
	}

	@Override
	public void register(User user) throws Exception {
		userMapper.register(user);
	}

	@Override
	public String duplicateCheck(String id) throws Exception {
		return userMapper.duplicateCheck(id);
	}
	
	@Override
	public User idFind(String name, String email) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		return userMapper.selectId(map);
	}

	@Override
	public User pwFind(String id, String email) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		return userMapper.selectUser(map);
	}

	@Override
	public int pwUpdate(String id, String passwd) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("passwd", passwd);
		return userMapper.updatePw(map);
	}

	@Override
	public void withdrawal(User user) throws Exception {
		userMapper.deleteUser(user);
	}

	@Override
	public void modify(String id, String name, String email) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		userMapper.updateUser(map);
	}
}
