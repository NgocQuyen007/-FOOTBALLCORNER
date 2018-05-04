package dto;

import java.io.Serializable;

/**
 * get the pitch quantity of the respective pitch type
 * @author qphan
 *
 */
public class PitchTypeQuantityDto implements Serializable {
	private static final long serialVersionUID = -8359440423720441866L;

	public static final String PROP_PITCH_TYPE_ID = "pitchTypeId";

	public static final String PROP_QUANTITY = "quantity";

	private int pitchTypeId;
	private int quantity;

	public int getPitchTypeId() {
		return pitchTypeId;
	}

	public void setPitchTypeId(int pitchTypeId) {
		this.pitchTypeId = pitchTypeId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
