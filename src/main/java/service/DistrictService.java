package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.DistrictDao;
import dto.DistrictQuantityDto;
import entities.District;
import iplms.IDistrict;

@Service
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
public class DistrictService implements IDistrict{

	@Autowired
	DistrictDao districtDao;
	
	@Override
	@Transactional
	public List<District> getDistricts() {
		return districtDao.getDistricts();
	}

	@Override
	@Transactional
	public List<DistrictQuantityDto> getPitchesQuantityofDistricts() {
		return districtDao.getPitchesQuantityofDistricts();
	}

}
