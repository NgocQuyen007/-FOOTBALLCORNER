package service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.LevelDao;
import entities.Level;
import iplms.ILevel;

@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class LevelService implements ILevel {
	
	@Autowired
	LevelDao levelDao;
	
	@Override
	@Transactional
	public List<Level> getLevels() {
		List<Level> levels = levelDao.getLevels();
		return levels.size() > 0 ? levels : Collections.emptyList();
	}

}
