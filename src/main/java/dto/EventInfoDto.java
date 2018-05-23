package dto;

public class EventInfoDto {
	
	private int numberOfCompetiters;
	private String zipcode;
	private String districtName;
	
	public EventInfoDto() {}
	
	public EventInfoDto(int numberOfCompetiters, String zipcode, String dname) {
		super();
		this.numberOfCompetiters = numberOfCompetiters;
		this.zipcode = zipcode;
		this.districtName = dname;
	}
	
	public int getNumberOfCompetiters() {
		return numberOfCompetiters;
	}
	public void setNumberOfCompetiters(int numberOfCompetiters) {
		this.numberOfCompetiters = numberOfCompetiters;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	
}
