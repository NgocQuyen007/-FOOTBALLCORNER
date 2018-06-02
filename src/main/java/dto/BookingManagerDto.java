package dto;

import java.util.List;
import java.util.Map;

public class BookingManagerDto {
	/** Giờ bắt đầu của sân bóng */
	private Integer pitchId;
	private Integer hourStart;
	private Integer hourEnd;
	
	private int pitchType;
	private int quantity;
	
	/** Biết pitchId => MAP: Loại sân: Số lượng */
	private List<Map<Integer, Integer>> pitchTypeQuantityMaps;
	
	private int pitchDetailId;
	
	public BookingManagerDto() {
	}

	public BookingManagerDto(Integer pitchId, Integer hourStart, Integer hourEnd, int pitchType, int quantity,
			List<Map<Integer, Integer>> pitchTypeQuantityMaps, int pitchDetailId) {
		super();
		this.pitchId = pitchId;
		this.hourStart = hourStart;
		this.hourEnd = hourEnd;
		this.pitchType = pitchType;
		this.quantity = quantity;
		this.pitchTypeQuantityMaps = pitchTypeQuantityMaps;
		this.pitchDetailId = pitchDetailId;
	}
	
	@Override
	public String toString() {
		return "BookingManagerDto [pitchId=" + pitchId + ", hourStart=" + hourStart + ", hourEnd=" + hourEnd
				+ ", pitchType=" + pitchType + ", quantity=" + quantity + ", pitchTypeQuantityMaps="
				+ pitchTypeQuantityMaps + ", pitchDetailId=" + pitchDetailId + "]";
	}

	public Integer getPitchId() {
		return pitchId;
	}

	public void setPitchId(Integer pitchId) {
		this.pitchId = pitchId;
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

	public int getPitchType() {
		return pitchType;
	}

	public void setPitchType(int pitchType) {
		this.pitchType = pitchType;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public List<Map<Integer, Integer>> getPitchTypeQuantityMap() {
		return pitchTypeQuantityMaps;
	}

	public void setPitchTypeQuantityMap(List<Map<Integer, Integer>> pitchTypeQuantityMaps) {
		this.pitchTypeQuantityMaps = pitchTypeQuantityMaps;
	}

	public int getPitchDetailId() {
		return pitchDetailId;
	}

	public void setPitchDetailId(int pitchDetailId) {
		this.pitchDetailId = pitchDetailId;
	}
	
	
	
}
