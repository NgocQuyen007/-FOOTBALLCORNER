package iplms;

import java.util.List;

import entities.PitchType;

/**
 * @author qphan
 * all of pitch type of pro
 */
public interface IPitchType {
	/**
	 * @return districts
	 * get list of pitch type 
	 */
	public List<PitchType> getPitchTypes();
	
}
