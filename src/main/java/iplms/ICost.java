package iplms;

import java.util.List;

import dto.CostQuantityDto;
import entities.Cost;

public interface ICost {
	/**
	 * Get list costs in the system
	 * @return costs
	 */
	public List<Cost> getCosts();
	
	/**
	 * Get cost in the system by cost Id
	 * @return cost
	 */
	public Cost getCost(int id);
	
	/**
	 * @return the mini pitches quantity of each specific cost
	 */
	public List<CostQuantityDto> getPitchesQuantityofCosts();
	
	public int insertCost(Cost cost);
	
	public List<Cost> getCost(int pdtailId, int hourf, int wdayf);
}
