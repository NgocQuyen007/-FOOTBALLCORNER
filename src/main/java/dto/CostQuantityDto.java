package dto;

import java.io.Serializable;

public class CostQuantityDto implements Serializable {
	private static final long serialVersionUID = 6066208258932029305L;

	public static final String PROP_PRICE = "price";
	
	public static final String PROP_QUANTITY = "quantity"; 
	
	private int price;
	private int quantity;

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
