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
		return pitchDao.getListPitchInfo(offset, rowCount);
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
		return pitchDao.getListPitchInfo();
	}
	
	@Override
	@Transactional
	public List<PitchInfoDto> getListPitchInfoByNameOrAdress(String key) {
		if (pitchDao.getListPitchInfoByNameOrAdress(key).size() > 0) {
			return pitchDao.getListPitchInfoByNameOrAdress(key);
		}
		return Collections.emptyList();
	}
	
	@Override
	@Transactional
	public List<PitchInfoDto> getListPitchInfoByZipCode(int zipcode) {
		if (pitchDao.getListPitchInfoByZipCode(zipcode).size() > 0) {
			return pitchDao.getListPitchInfoByZipCode(zipcode);
		}
		return Collections.emptyList();
	}
	
	
	
	
}
