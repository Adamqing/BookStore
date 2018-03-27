package com.tz.bs.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tz.bs.entity.Address;
import com.tz.bs.entity.User;
import com.tz.bs.exception.UserLoginException;
import com.tz.bs.mapper.AddressMapper;
import com.tz.bs.mapper.UserMapper;
import com.tz.bs.service.UserService;
import com.tz.bs.util.MyBatiesUtil;

public class UserServiceImpl implements UserService {
	SqlSession session = MyBatiesUtil.sqlSession();
	UserMapper userMapper = session.getMapper(UserMapper.class);
	AddressMapper addressMapper = session.getMapper(AddressMapper.class);

	@Override
	public User login(String name, String pwd) throws UserLoginException {
		User u = userMapper.selectUserByUserName(name);
		if (u == null || !pwd.equals(u.getPassword())) {
			throw new UserLoginException("用户名或密码错误");
		}

		return u;
	}

	@Override
	public void register(User user) {
		userMapper.insertUser(user);
		session.commit();
	}

	@Override
	public boolean validate(String name) {
		User u=userMapper.selectUserByUserName(name);
		if(u==null){
			return true;
		}
		return false;
	}

	@Override
	public void addAddress(Address a) {
		if(a.getIsDefault()=='1'){
			addressMapper.cleanDefaultAddress(a.getUser().getUserid());
		}
		addressMapper.insertAddr(a);
		session.commit();
	}

	@Override
	public void removeAddress(Address a) {
		addressMapper.deleteAddr(a.getAddressid());
		session.commit();
	}

	@Override
	public void updateAddress(Address a) {
		addressMapper.updateAddr(a);
		session.commit();
	}

	@Override
	public List<Address> getAddressByUser(User u) {
		
		return addressMapper.selectAddrsByUserID(u.getUserid());
	}

	@Override
	public Address getAddressById(Long id) {
		return addressMapper.selectAddrByID(id);
	}

}
