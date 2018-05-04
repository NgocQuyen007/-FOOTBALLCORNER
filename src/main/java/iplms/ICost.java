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
	 * @return the mini pitches quantity of each specific cost
	 */
	public List<CostQuantityDto> getPitchesQuantityofCosts();
}
