package common;

import java.text.Normalizer;
import java.util.Calendar;
import java.util.regex.Pattern;

public class TagLibFunctions {

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
	
	public static String convertVNMesetoEnglish(String vnmeseword) {
		String temp = Normalizer.normalize(vnmeseword, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		return pattern.matcher(temp).replaceAll("").toLowerCase().replaceAll(" ", "-").replaceAll("đ", "d");
	}
	
	public static String getFCNameFromFullName(String input) {
		String [] elements = input.split("[ ,;:+.]+");
		return "FC " + elements[elements.length-1] + " " + elements[0];
	}
	
	/**
	 * Xác định tuổi của đội bóng
	 * @param from
	 * @param to
	 * @return
	 */
	public static String getAgeUtils(Integer from, Integer to) {
		
		if (from == null && to == null) {
			return "Chưa xác định";
		}
		
		if (from == null) {
			return "Dưới " + to;
		}
		
		if (to == null) {
			return "Trên " + from;
		}
		
		return "Từ " + from + " đến " + to;
	}
	
	/**
	 * @return Đổi từ ngày tháng năm sau weekday
	 */
	public static String getDayOfWeek(int year, int month, int date) {
		Calendar c = Calendar.getInstance();
		c.set(year, (month-1), date);
		int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
		System.out.println(dayOfWeek);
		return DataStaticModel.WEEKLY_DATE.get(dayOfWeek);
	}
	
	/**
	 * @return Thời gian trận đấu diễn ra
	 */
	public static String getMatchTime(String time) {
		String month = time.substring(0, time.indexOf("/"));
		String date = time.substring(time.indexOf("/")+1, time.lastIndexOf("/"));
		String year = time.substring(time.lastIndexOf("/")+1, time.indexOf(" "));
		String hour = time.substring(time.indexOf(" ")+1);
		String weekday = getDayOfWeek(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(date));
		return hour + " " + weekday + " ngày " + date + "/" + month + "/" + year;
	}
	
}
