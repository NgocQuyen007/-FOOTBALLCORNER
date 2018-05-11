package service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.PitchDao;
import dto.PitchInfoDto;
import entities.Pitch;
import iplms.IPitch;

@Service
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
public class PitchService implements IPitch {

	@Autowired
	PitchDao pitchDao;
	
	@Override
	@Transactional
	public List<PitchInfoDto> getListPitchInfo(int offset, int rowCount) {
		List<PitchInfoDto> dtos = pitchDao.getListPitchInfo(offset, rowCount);
		if (dtos.size() > 0) {
			return dtos;
		}
		return Collections.emptyList();
	}
	
	@Override
	@Transactional
	public List<PitchInfoDto> getListPitchInfo(int zipcode, String pricesKey, String numberofplayersKey, String keyword) {
		List<PitchInfoDto> dtos = pitchDao.getListPitchInfo(zipcode, pricesKey,numberofplayersKey,keyword);
		if (dtos.size() > 0) {
			return dtos;
		}
		return Collections.emptyList();
	}

	@Override
	@Transactional
	public Pitch getPitchByID(int pid) {
		return pitchDao.getPitchByID(pid);
	}

	@Override
	@Transactional
	public int countAllRows() {
		return pitchDao.countAllRows();
	}

	@Override
	@Transactional
	public List<PitchInfoDto> getListPitchInfo() {
		List<PitchInfoDto> dtos = pitchDao.getListPitchInfo();
		if (dtos.size() > 0) {
			return dtos;
		}
		return Collections.emptyList();
		
	}
	
	@Override
	@Transactional
	public List<PitchInfoDto> getListPitchInfoByNameOrAdress(String key) {
		List<PitchInfoDto> dtos = pitchDao.getListPitchInfoByNameOrAdress(key);
		if (dtos.size() > 0) {
			return dtos;
		}
		return Collections.emptyList();
	}
	
	@Override
	@Transactional
	public List<PitchInfoDto> getListPitchInfoByZipCode(int zipcode) {
		List<PitchInfoDto> dtos = pitchDao.getListPitchInfoByZipCode(zipcode);
		if (dtos.size() > 0) {
			return dtos;
		}
		return Collections.emptyList();
	}
	
	@Override
	@Transactional
	public List<PitchInfoDto> getListPitchInfoByNameOrAdressAndZipcode(int zipcode, String keyword) {
		List<PitchInfoDto> dtos = pitchDao.getListPitchInfoByNameOrAdressAndZipcode(zipcode, keyword);
		if (dtos.size() > 0) {
			return dtos;
		}
		return Collections.emptyList();
	}

	@Override
	@Transactional
	public List<PitchInfoDto> getListPitchInfo(String pricesKey, String numberofplayersKey, String keyword) {
		List<PitchInfoDto> dtos = pitchDao.getListPitchInfo(pricesKey,numberofplayersKey,keyword);
		if (dtos.size() > 0) {
			return dtos;
		}
		return Collections.emptyList();
	}
	
	
}
