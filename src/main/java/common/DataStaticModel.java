package common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.TreeMap;

public class DataStaticModel {
	
	public static final int STATE_ROWCOUNT = 5;
	
	public static final String SUCCESS_LOGIN_STATUS_CONST = "success";
	
	public static final String FAIL_LOGIN_STATUS_CONST = "fail";
	
	public static final String URL_PAGE_CONSTATNT = "http://localhost:8080/datkeonhanh/";
	
	public static final String EMPTY_SPACE = "";
	
	public static final String UPLOAD_FILE_DIRECTORY = "resources/files";
	
	
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
		put("12:00", "12:00"); put("12:30", "12:30");
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
	public static final TreeMap<String, Integer> PITCH_BEGIN_END_HOUR_MAP = new TreeMap<String, Integer>()
	{{
		
		put("05:00", 5); put("06:00", 6); put("07:00", 7); put("08:00", 8); 
		put("09:00", 9); put("10:00", 10); put("11:00", 11); put("12:00", 12); 
		put("13:00", 13); put("14:00", 14); put("15:00", 15); put("16:00", 16); 
		put("17:00", 17); put("18:00", 18); put("19:00", 19); put("20:00", 20); 
		put("21:00", 21); put("22:00", 22); 
		 
	}};
	
	@SuppressWarnings("serial")
	public static final TreeMap<Integer, String> HOUR_LESS_THAN_10 = new TreeMap<Integer, String>()
	{{
		put(0, "00:00"); put(13, "13:00");
		put(1, "01:00"); put(14, "14:00"); 
		put(2, "02:00"); put(15, "15:00"); 
		put(3, "03:00"); put(16, "16:00"); 
		put(4, "04:00"); put(17, "17:00");
		put(5, "05:00"); put(18, "18:00");
		put(6, "06:00"); put(19, "19:00");
		put(7, "07:00"); put(20, "20:00");
		put(8, "08:00"); put(21, "21:00");
		put(9, "09:00"); put(22, "22:00");
		put(10, "10:00"); put(23, "23:00");
		put(11, "11:00"); put(24, "24:00");
		put(12, "12:00");
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
	
	public static String getCurrentTimetoSecond() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		return sdf.format(date);
	}
	
}
