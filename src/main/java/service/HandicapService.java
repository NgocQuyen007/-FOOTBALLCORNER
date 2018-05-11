package service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.HandicapDao;
import entities.Handicap;
import iplms.IHandicap;

@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class HandicapService implements IHandicap {

	@Autowired
	HandicapDao handicapDao;
	
	@Override
	@Transactional
	public List<Handicap> getHandicaps() {
		List<Handicap> handicaps = handicapDao.getHandicaps();
		return handicaps.size() > 0 ? handicaps : Collections.emptyList();
	}

}
