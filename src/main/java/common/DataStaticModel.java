package common;

import java.util.Calendar;
import java.util.HashMap;
import java.util.TreeMap;

public class DataStaticModel {
	
	public static final int STATE_ROWCOUNT = 5;
	
	@SuppressWarnings("serial")
	public static final TreeMap<String, String> PITCH_BOOKING_TIME_MAP = new TreeMap<String, String>()
	{{
		put("00:00", "00:00"); put("00:30", "00:30");
		put("01:00", "01:00"); put("01:30", "01:30");
		put("02:00", "02:00"); put("02:30", "02:30");
		put("03:00", "03:00"); put("03:30", "03:30");
		put("04:00", "04:00"); put("04:30", "04:30");
		put("05:00", "05:00"); put("05:30", "05:30");
		put("06:00", "06:00"); put("06:30", "06:30");
		put("07:00", "07:00"); put("07:30", "07:30");
		put("08:00", "08:00"); put("08:30", "08:30");
		put("09:00", "09:00"); put("09:30", "09:30");
		put("10:00", "10:00"); put("10:30", "10:30");
		put("11:00", "11:00"); put("11:30", "11:30");
		put("12:00", "11:00"); put("12:30", "12:30");
		put("13:00", "13:00"); put("13:30", "13:30");
		put("14:00", "14:00"); put("14:30", "14:30");
		put("15:00", "15:00"); put("15:30", "15:30");
		put("16:00", "16:00"); put("16:30", "16:30");
		put("17:00", "17:00"); put("17:30", "17:30");
		put("18:00", "18:00"); put("18:30", "18:30");
		put("19:00", "19:00"); put("19:30", "19:30");
		put("20:00", "20:00"); put("20:30", "20:30");
		put("21:00", "21:00"); put("21:30", "21:30");
		put("22:00", "22:00"); put("22:30", "22:30");
		put("23:00", "23:00"); put("23:30", "23:30");
	}};
	
	@SuppressWarnings("serial")
	public static final HashMap<Integer, String> WEEKLY_DATE = new HashMap<Integer, String>()
	{{
		put(Calendar.SUNDAY, "Chủ nhật");
		put(Calendar.MONDAY, "Thứ hai");
		put(Calendar.TUESDAY, "Thứ ba");
		put(Calendar.WEDNESDAY, "Thứ tư");
		put(Calendar.THURSDAY, "Thứ năm");
		put(Calendar.FRIDAY, "Thứ sáu");
		put(Calendar.SATURDAY, "Thứ bảy");
	}};
	
}
