package dto;

import java.io.Serializable;

/**
 * Thong tin chi tiet san bong
 * 
 * @author qphan
 */
public class PitchInfoDto implements Serializable {
	private static final long serialVersionUID = -6567317993566197531L;

	public static final String PROP_PITCH_ID = "id";

	public static final String PROP_PITCH_NAME = "name";
	
	public static final String PROP_PITCH_AVATAR = "avatar";
	
	public static final String PROP_PITCH_DESCRIPTION = "description";

	/**
	 * addresses table
	 */
	public static final String PROP_ADDRESS = "detail";

	public static final String PROP_PHONE_NUMBER = "phoneNumber";
	
	public static final String PROP_FACEBOOK = "facebook";
	
	public static final String PROP_WEBSITE = "website";

	/**
	 * name of pitch's district
	 */
	public static final String PROP_DESTRICT_NAME = "desName";
	
	public static final String PROP_DESTRICT_ZIPCODE = "zipCode";
	
	public static final String PROP_OWNER_FULLNAME = "fullName";
	
	public static final String PROP_OWNER_EMAIL = "email";

	/**
	 * id của sân bóng => vd sân chuyên việt 
	 */
	private Integer id;
	private String name;
	private String avatar;
	private String description;
	
	private String detail;
	private String phoneNumber;
	private String facebook;
	private String website;
	
	/**
	 * Tên quận / huyện
	 */
	private Integer zipCode;
	private String desName;
	
	/**
	 * User - owner
	 */
	private String fullName;
	private String email;
	
	
	public PitchInfoDto() {}
	
	public PitchInfoDto(Integer id, String name, String avatar, String detail, String phoneNumber, String desName,
			String fullName) {
		super();
		this.id = id;
		this.name = name;
		this.avatar = avatar;
		this.detail = detail;
		this.phoneNumber = phoneNumber;
		this.desName = desName;
		this.fullName = fullName;
	}

	public static final String PROP_PITCH_DETAIL_ID = "pitchDetailId";
	
	public static final String PROP_PITCH_TYPE_ID = "pitchTypeId";
	/**
	 * apply with table pitch detail
	 */
	private Integer pitchDetailId;
	private Integer pitchTypeId;
	
	public static final String PROP_COST_ID = "costId";
	
	public static final String PROP_HOUR_START = "hourStart";
	
	public static final String PROP_HOUR_END = "hourEnd";
	
	public static final String PROP_WDAY_START = "wdayStart";
	
	public static final String PROP_WDAY_END = "wdayEnd";
	
	public static final String PROP_COST_PRICE = "price";
	
	/**
	 * apply with table cost
	 */
	private Integer costId;
	private Integer hourStart;
	private Integer hourEnd;
	private Integer wdayStart;
	private Integer wdayEnd;
	private Integer price;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getDesName() {
		return desName;
	}

	public void setDesName(String desName) {
		this.desName = desName;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Integer getPitchDetailId() {
		return pitchDetailId;
	}

	public void setPitchDetailId(Integer pitchDetailId) {
		this.pitchDetailId = pitchDetailId;
	}

	public Integer getPitchTypeId() {
		return pitchTypeId;
	}

	public void setPitchTypeId(Integer pitchTypeId) {
		this.pitchTypeId = pitchTypeId;
	}

	public Integer getCostId() {
		return costId;
	}

	public void setCostId(Integer costId) {
		this.costId = costId;
	}

	public Integer getHourStart() {
		return hourStart;
	}

	public void setHourStart(Integer hourStart) {
		this.hourStart = hourStart;
	}

	public Integer getHourEnd() {
		return hourEnd;
	}

	public void setHourEnd(Integer hourEnd) {
		this.hourEnd = hourEnd;
	}

	public Integer getWdayStart() {
		return wdayStart;
	}

	public void setWdayStart(Integer wdayStart) {
		this.wdayStart = wdayStart;
	}

	public Integer getWdayEnd() {
		return wdayEnd;
	}

	public void setWdayEnd(Integer wdayEnd) {
		this.wdayEnd = wdayEnd;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getZipCode() {
		return zipCode;
	}

	public void setZipCode(Integer zipCode) {
		this.zipCode = zipCode;
	}
	
	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "[" + id + ", " + name + ", " + avatar + ", " + detail
				+ ", " + phoneNumber + ", " + desName + ", " + fullName
				+ ", " + pitchDetailId + ", " + pitchTypeId + ", " + costId
				+ ", " + hourStart + ", " + hourEnd + ", " + wdayStart + ", "
				+ wdayEnd + ", " + price + "]";
	}
	
}
