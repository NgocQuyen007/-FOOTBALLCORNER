package iplms;

import java.util.List;

import dto.PitchInfoDto;
import entities.Pitch;

public interface IPitch {
	
	/**
	 * get list of pitch detail info
	 * @return
	 */
	public List<PitchInfoDto> getListPitchInfo();
	
	/**
	 * get list of pitch detail info pagination
	 * @return
	 */
	public List<PitchInfoDto> getListPitchInfo(int offset, int rowCount);
	

	
	/**
	 * get pitch info by pid
	 * @return
	 */
	public Pitch getPitchByID(int pid);
	
	/**
	 * get pitch info by Name or Address
	 * @return
	 */
	public List<PitchInfoDto> getListPitchInfoByNameOrAdress(String key);
	
	/**
	 * get pitch info by Name or Address
	 * @return
	 */
	public List<PitchInfoDto> getListPitchInfoByZipCode(int zipcode);
	
	/**
	 * count rows
	 * @return
	 */
	public int countAllRows();
}
