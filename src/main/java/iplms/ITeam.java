package iplms;

import java.util.List;

import dto.DistrictQuantityDto;
import dto.LevelQuantityDto;
import entities.Team;

public interface ITeam {
	/**
	 * list team in Da Nang
	 */
	public List<Team> getTeams();
	
	/**
	 * list team in Da Nang pagination
	 */
	public List<Team> getTeams(int offset, int rowcount);
	
	/**
	 * list team by keyword and levels in Da Nang pagination
	 */
	public List<Team> getTeams(String keyword, String levels);
	
	/**
	 * list team with keyword in Da Nang pagination
	 */
	public List<Team> getTeams(String keyword, int offset, int rowcount);
	
	/**
	 * total of rows in database
	 */
	public int countAllRows();
	
	/**
	 * total of rows with keyword in database
	 */
	public int countAllRows(String keyword);
	
	/**
	 * Left bar
	 */
	public List<DistrictQuantityDto> getTeamsQuantityofDistricts();
	
	/**
	 * Left bar
	 */
	public List<LevelQuantityDto> getTeamsQuantityofLevels();
}
