package common;

import java.text.Normalizer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Pattern;

import org.ocpsoft.prettytime.PrettyTime;

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
	
	/**
	 * @param input Tên của session user info
	 * @return result => Tên trong danh sách đội đang chờ
	 */
	public static String getFCNameFromFullName(String input) {
		String [] elements = input.split("[ ,;:+.]+");
		return "FC " + elements[elements.length-1] + " " + elements[0];
	}
	
	/**
	 * @param input Tên của session user info
	 * @return Tên tài khoản sau khi Login
	 */
	public static String getLastAndFirstOfFullName(String input) {
		String [] elements = input.split("[ ,;:+.]+");
		return convertVNMesetoEnglish(elements[elements.length-1]) + " " + convertVNMesetoEnglish(elements[0]);
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
	 * @return Đổi từ ngày tháng năm sau weekday kiểu integer 2-8
	 */
	public static int getDayOfWeekInteger(int year, int month, int date) {
		Calendar c = Calendar.getInstance();
		c.set(year, (month-1), date);
		int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
		System.out.println(dayOfWeek);
		return DataStaticModel.WEEKLY_DATE_INTEGER.get(dayOfWeek);
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
		return hour.equals("") ? hour : "" + " " + weekday + " ngày " + date + "/" + month + "/" + year;
	}
	
	public static Integer isDateBeforeNow(String stringDate1, String stringNow) {
		int result = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm");
		try {
			Date date1 = sdf.parse(stringDate1);
			Date now = sdf.parse(stringNow);
			result = date1.before(now) ? 1 : 0;
		} catch (ParseException e) {
			System.err.println("Happened Exception !");
			result = 0;
		}
		return result;
	}
	
	public static Date convertStringToDateUtils(String input) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		try {
			return sdf.parse(input);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String getTimesAge(String input) {
		PrettyTime p = new PrettyTime();
		Date date = convertStringToDateUtils(input);
		return p.format(date);
		
	}
	
}
