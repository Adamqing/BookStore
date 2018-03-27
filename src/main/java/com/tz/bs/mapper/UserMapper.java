package com.tz.bs.mapper;

import org.apache.ibatis.annotations.Param;

import com.tz.bs.entity.User;

public interface UserMapper {
	User selectUser(Long userID);
	User selectUserByUserName(@Param("name")String userName);
	Integer insertUser(User u);

	Integer updateUser(User u);
}
