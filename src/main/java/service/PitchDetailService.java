package service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.PitchDetailDao;
import dto.PitchTypeQuantityDto;
import entities.PitchDetail;
import iplms.IPitchDetail;

@Service
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
public class PitchDetailService implements IPitchDetail{

	@Autowired
	PitchDetailDao pitchDetailDao;
	
	@Override
	@Transactional
	public List<PitchTypeQuantityDto> getPitchesQuantityofPitchType() {
		return pitchDetailDao.getPitchesQuantityofPitchType();
	}

	@Override
	@Transactional
	public List<PitchDetail> getPitchDetails() {
		return pitchDetailDao.getPitchDetails();
	}
	
	@Override
	@Transactional
	public PitchDetail getPitchDetail(int id) {
		return pitchDetailDao.getPitchDetail(id);
	}

	@Override
	@Transactional
	public Map<Integer, Integer> insertPitchDetail(PitchDetail pitchDetail) {
		return pitchDetailDao.insertPitchDetail(pitchDetail);
	}
	
}
