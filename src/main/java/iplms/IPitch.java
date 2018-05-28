package iplms;

import java.util.List;

import dto.PitchInfoDto;
import entities.Pitch;
import entities.PitchDetail;

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
	 * get list of pitch by zipcode and (|| pricesKey || numberofplayersKey) = != null 
	 */
	public List<PitchInfoDto> getListPitchInfo(int zipcode, String pricesKey, String numberofplayersKey, String keyword);
	
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
	 * get pitch info by Name or Adrress at each zipcode
	 */
	public List<PitchInfoDto> getListPitchInfoByNameOrAdressAndZipcode(int zipcode, String keyword);
	
	/**
	 * count rows
	 * @return
	 */
	public int countAllRows();

	List<PitchInfoDto> getListPitchInfo(String pricesKey, String numberofplayersKey, String keyword);
	
	/**
	 * insert pitch
	 * @param pitch item
	 * @return
	 */
	public int insertPitch(Pitch pitch);
	
	public List<Pitch> getListPitchesByUserId(int userId);
	
	public int delById(int stadiumId);
	
	public int updateStatus(int stadiumId, int status);
	
	public int updatePitch(Pitch pitch);
	
}
