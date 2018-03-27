package com.tz.bs.mapper;

import java.util.List;

import com.tz.bs.entity.Address;

public interface AddressMapper {
	Address selectAddrByID(Long ID);

	Integer deleteAddr(Long ID);

	List<Address> selectAddrsByUserID(Long uid);

	Integer insertAddr(Address a);

	Integer updateAddr(Address a);
	Integer cleanDefaultAddress(Long uid);
}
