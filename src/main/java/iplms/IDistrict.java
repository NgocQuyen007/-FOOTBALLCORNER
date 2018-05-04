package iplms;

import java.util.List;

import dto.DistrictQuantityDto;
import entities.District;
/**
 * @author qphan
 * all of district in Da Nang
 */
public interface IDistrict {
	/**
	 * @return districts
	 * get list of districts 
	 */
	public List<District> getDistricts();
	
	/**
	 * 
	 * @return the pitches quantity of each district
	 */
	public List<DistrictQuantityDto> getPitchesQuantityofDistricts();
	
}
