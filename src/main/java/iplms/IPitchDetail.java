package iplms;

import java.util.List;

import dto.PitchTypeQuantityDto;
import entities.PitchDetail;

public interface IPitchDetail {
	
	public List<PitchDetail> getPitchDetails();
	
	/**
	 * @return the pitches quantity with the respective pitch type
	 */
	public List<PitchTypeQuantityDto> getPitchesQuantityofPitchType();
}
