package com.tz.bs.service;

import java.util.List;

import com.tz.bs.entity.Address;
import com.tz.bs.entity.User;
import com.tz.bs.exception.UserLoginException;

public interface UserService {
	User login(String name, String pwd) throws UserLoginException;

	void register(User user);

	boolean validate(String name);

	void addAddress(Address a);
	
	void removeAddress(Address a);
	
	void updateAddress(Address a);
	
	List<Address> getAddressByUser(User u);
	
	Address getAddressById(Long id);
	
}
