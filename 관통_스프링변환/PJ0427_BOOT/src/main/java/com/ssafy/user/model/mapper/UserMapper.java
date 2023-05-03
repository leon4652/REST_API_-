package com.ssafy.user.model.mapper;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.user.model.User;

@Mapper
public interface UserMapper {
	User loginUser(User user) throws SQLException;
}
