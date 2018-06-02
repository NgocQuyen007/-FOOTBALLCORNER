package iplms;

import java.util.List;

import dto.BookingManagerDto;
import entities.StadiumDetailStatus;

public interface IStadiumDetailStatus {
	/** Đếm số sân còn trống của khung giờ, ngày đó, sân đó */
	public int countNumberOfPitchAvailableByTime(StadiumDetailStatus stadiumDetailStatus);
	
	public int saveStadiumDetailStatus(StadiumDetailStatus stadiumDetailStatus);
	
	public List<StadiumDetailStatus> getListStadiumDetailStatusByUserIdAndStatus(int userId);
	
	/** Xóa yêu cầu đặt sân <=> update status = 2*/
	public int rejectBoookingRequest(int id);
	
	/** Thông báo đến khách hàng là chủ sân đã accept hay reject*/
	public List<StadiumDetailStatus> getNotifications(int id);
	
	/** Bảng thống kê tình trạng các sân bóng theo giờ: NGÀY ??? */
	public List<BookingManagerDto> getStadiumBookingManagers(int stadiumId);
	
	public List<StadiumDetailStatus> getListStadiumDetailStatusByMatchDayAndPitchId(String matchDay, int stadiumId);
}
