package dto;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * return the quantity of pitch in each district
 * 
 * @author qphan
 *
 */
public class DistrictQuantityDto implements Serializable{
	private static final long serialVersionUID = -9073027582327439125L;

	public static final String PROP_ZIPCODE = "zipcode";
	
	public static final String PROP_NAME = "name";
	
	/**
	 * It can be the number of pitches or number of teams of each district
	 */
	public static final String PROP_QUANTITY = "quantity";
	
	private int zipcode;
	private String name;
	private int quantity;

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public DistrictQuantityDto() {}

	public DistrictQuantityDto(int zipcode, String name, int quantity) {
		super();
		this.zipcode = zipcode;
		this.name = name;
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return new ToStringBuilder(this)
				.append(PROP_NAME, getName())
				.append(PROP_ZIPCODE, getZipcode())
				.append(PROP_QUANTITY, getQuantity()).toString();
	}
}
