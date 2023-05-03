package com.ssafy.enjoytrip.user.model.service;

import com.ssafy.enjoytrip.user.model.User;

public interface UserService {
	User login(String id, String pw) throws Exception;
	void register(User user) throws Exception;
	String duplicateCheck(String id) throws Exception;
	User idFind(String name, String email) throws Exception;
	User pwFind(String id, String email) throws Exception;
	int pwUpdate(String id, String passwd) throws Exception;
	void withdrawal(User user) throws Exception;
	void modify(String id, String name, String email) throws Exception;
}
