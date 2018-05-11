package dto;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * return the quantity of pitch in each district
 * 
 * @author qphan
 *
 */
public class LevelQuantityDto implements Serializable{
	private static final long serialVersionUID = 6980962176961054779L;

	public static final String PROP_LEVEL_ID = "id";
	
	public static final String PROP_NAME = "name";
	
	/**
	 * It can be the number of pitches or number of teams of each district
	 */
	public static final String PROP_QUANTITY = "quantity";
	
	private int id;
	private String name;
	private int quantity;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public LevelQuantityDto() {}

	public LevelQuantityDto(int id, String name, int quantity) {
		super();
		this.id = id;
		this.name = name;
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return new ToStringBuilder(this)
				.append(PROP_NAME, getName())
				.append(PROP_LEVEL_ID, getId())
				.append(PROP_QUANTITY, getQuantity()).toString();
	}

}
