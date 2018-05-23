package service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.AddressDao;
import entities.Address;
import iplms.IAddress;

@Service
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
public class AddressService implements IAddress{

	@Autowired
	AddressDao addressDao;

	@Override
	@Transactional
	public int insertAddress(Address address) {
		return addressDao.insertAddress(address);
	}
}
