package common;

import java.util.ArrayList;
import java.util.List;

import entities.PitchDetail;

public class TagLibFunctions {
	public static String getList(String x) {
		return "Xin chao " + x + ".";
	}

	public static List<PitchDetail> getPitchDetailsByPitchId(int pitchId, List<PitchDetail> pitchDetails) {
		List<PitchDetail> pitchDetailByPitchIds = new ArrayList<>();
		for (PitchDetail item : pitchDetails) {
			if (item.getPitch().getId() == pitchId) {
				pitchDetailByPitchIds.add(item);
			}
		}
		return pitchDetailByPitchIds;
	}

	public static List<String> getListString(String x, String y) {
		List<String> list = new ArrayList<>();
		list.add(x);
		list.add(y);
		return list;
	}
	
	/**
	 * Check thứ ngày để đặt sân
	 */
	
	public static String getWday(Integer from, Integer to) {
		if (from == to) {
			return isSunday(from);
		}
		return "Từ thứ " + from + ", " + isSunday(to);
	}
	
	public static String isSunday(int input) {
		return input == 8 ? "Chủ nhật" : " thứ " + input;
	}
	
}
