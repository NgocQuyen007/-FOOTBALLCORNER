package iplms;

import java.util.List;
import java.util.Map;

import dto.PitchTypeQuantityDto;
import entities.PitchDetail;

public interface IPitchDetail {
	
	public List<PitchDetail> getPitchDetails();
	
	public PitchDetail getPitchDetail(int id);
	
	/**
	 * @return the pitches quantity with the respective pitch type
	 */
	public List<PitchTypeQuantityDto> getPitchesQuantityofPitchType();
	
	/**
	 * insert pitchDetail
	 */
	public Map<Integer, Integer> insertPitchDetail(PitchDetail pitchDetail);
	
	public PitchDetail getPitchByPTypeAndPId(int pitchTypeId, int pitchId);
}
