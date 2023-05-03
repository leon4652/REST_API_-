package com.ssafy.enjoytrip.user.model.mapper;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.user.model.User;

@Mapper
public interface UserMapper {
	User login(Map<String, String>map) throws SQLException;
	void register(User user) throws SQLException;
	String duplicateCheck(String id) throws SQLException;
	User selectId(Map<String, String>map) throws SQLException;
	User selectUser(Map<String, String>map) throws SQLException;
	int updatePw(Map<String, String>map) throws SQLException;
	void deleteUser(User user) throws SQLException;
	void updateUser(Map<String, String>map) throws SQLException;
}


