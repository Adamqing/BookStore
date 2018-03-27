package com.tz.bs.service;

import java.util.List;

import org.junit.Test;

import com.tz.bs.entity.Address;
import com.tz.bs.entity.User;
import com.tz.bs.exception.UserLoginException;
import com.tz.bs.util.BeanFactory;

public class TestUserServiceImpl {
private UserService userService = (UserService) BeanFactory.getBean("userService");

@Test
public void testregister(){
	User u = new User();
	u.setUserName("lanlan");
	u.setPassword("23232");
	u.setEmail("185454545");
	u.setPhone("12323233232");
	u.setCompany("南京");
	userService.register(u);
}
@Test
public void testvalidate(){
	System.out.println(userService.validate("lala"));
}
@Test
public void testremoveAddress(){
	Address a = new Address();
	a.setAddressid(5L);
	userService.removeAddress(a);
}
@Test
public void testupdateAddress(){
	Address a = new Address();
	a.setAddressid(6L);
	a.setArea("南京");
	userService.updateAddress(a);
}
@Test
public void testgetAddressByUser(){
	User user = new User();
	user.setUserid(7L);
	List<Address> address = userService.getAddressByUser(user);
	System.out.println(address);
}
@Test
public void testgetAddressById(){
	System.out.println(userService.getAddressById(6L));
}
@Test
public void testaddAddress(){
	Address address = new Address();
	address.setIsDefault('y');
	User user = new User();
	user.setUserid(7L);
	address.setUser(user);
	address.setAddressid(8L);
	address.setArea("中国");
	address.setDetailaddress("南京");
	address.setEmailcode("233");
	address.setReciver("李白");
	address.setTel("11112222");	
	userService.addAddress(address);
}
@Test
public void testlogin() throws UserLoginException{
	System.out.println(userService.login("lala", "789"));
}
}
