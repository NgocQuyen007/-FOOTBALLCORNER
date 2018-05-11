package service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.TeamDao;
import dto.DistrictQuantityDto;
import dto.LevelQuantityDto;
import entities.Team;
import iplms.ITeam;

@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class TeamService implements ITeam{

	@Autowired
	TeamDao teamDao;
	
	@Override
	@Transactional
	public List<Team> getTeams() {
		if (teamDao.getTeams().size() > 0) {
			return teamDao.getTeams();
		}
		return Collections.emptyList();
	}
	
	@Override
	@Transactional
	public List<Team> getTeams(int offset, int rowcount) {
		List<Team> teams = teamDao.getTeams(offset, rowcount);
		if (teams.size() > 0) {
			return teams;
		}
		return Collections.emptyList();
	}
	
	@Override
	@Transactional
	public List<Team> getTeams(String keyword, String levels) {
		List<Team> teams = teamDao.getTeams(keyword, levels); 
		if (teams.size() > 0) {
			return teams;
		}
		return Collections.emptyList();
	}
	
	@Override
	@Transactional
	public List<Team> getTeams(String keyword, int offset, int rowcount) {
		List<Team> teams = teamDao.getTeams(keyword, offset, rowcount);
		if (teams.size() > 0) {
			return teams;
		}
		return Collections.emptyList();
	}
	
	@Override
	@Transactional
	public int countAllRows() {
		return teamDao.countAllRows();
	}
	
	@Override
	@Transactional
	public int countAllRows(String keyword) {
		return teamDao.countAllRows(keyword);
	}

	@Override
	@Transactional
	public List<DistrictQuantityDto> getTeamsQuantityofDistricts() {
		List<DistrictQuantityDto> dtos = teamDao.getTeamsQuantityofDistricts();
		if (dtos.size() > 0) {
			return dtos;
		}
		return Collections.emptyList();
	}
	
	@Override
	@Transactional
	public List<LevelQuantityDto> getTeamsQuantityofLevels() {
		List<LevelQuantityDto> dtos = teamDao.getTeamsQuantityofLevels();
		if (dtos.size() > 0) {
			return dtos;
		}
		return Collections.emptyList();
	}

	

}
