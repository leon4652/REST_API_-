package com.ssafy.user.model.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssafy.user.model.User;



public interface UserService {
	User loginUser(User user) throws Exception;
}
