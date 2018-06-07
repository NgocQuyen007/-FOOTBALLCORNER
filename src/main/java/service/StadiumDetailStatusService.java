package service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.StadiumDetailStatusDao;
import dto.BookingManagerDto;
import entities.StadiumDetailStatus;
import iplms.IStadiumDetailStatus;

@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class StadiumDetailStatusService implements IStadiumDetailStatus {

	@Autowired
	StadiumDetailStatusDao stadiumDetailStatusDao;
	
	@Override
	@Transactional
	public int countNumberOfPitchAvailableByTime(StadiumDetailStatus stadiumDetailStatus) {
		if (stadiumDetailStatus == null) {
			return 0;
		}
		return stadiumDetailStatusDao.countNumberOfPitchAvailableByTime(stadiumDetailStatus);
	}

	@Override
	@Transactional
	public int saveStadiumDetailStatus(StadiumDetailStatus stadiumDetailStatus) {
		return stadiumDetailStatusDao.saveStadiumDetailStatus(stadiumDetailStatus);
	}

	@Override
	@Transactional
	public List<StadiumDetailStatus> getListStadiumDetailStatusByUserIdAndStatus(int userId) {
		return stadiumDetailStatusDao.getListStadiumDetailStatusByUserIdAndStatus(userId);
	}

	@Override
	@Transactional
	public int approveBoookingRequest(int id) {
		return stadiumDetailStatusDao.approveBoookingRequest(id);
	}
	
	@Override
	@Transactional
	public int rejectBoookingRequest(int id) {
		return stadiumDetailStatusDao.rejectBoookingRequest(id);
	}

	@Override
	@Transactional
	public List<StadiumDetailStatus> getNotifications(int id) {
		return stadiumDetailStatusDao.getNotifications(id);
	}

	@Override
	@Transactional
	public List<BookingManagerDto> getStadiumBookingManagers(int stadiumId) {
		return stadiumDetailStatusDao.getStadiumBookingManagers(stadiumId);
	}

	@Override
	@Transactional
	public List<StadiumDetailStatus> getListStadiumDetailStatusByMatchDayAndPitchId(String matchDay, int stadiumId) {
		return stadiumDetailStatusDao.getListStadiumDetailStatusByMatchDayAndPitchId(matchDay, stadiumId);
	}

	@Override
	@Transactional
	public int getMaxPositionOfStadiimDetail(StadiumDetailStatus stadiumDetailStatus) {
		return stadiumDetailStatusDao.getMaxPositionOfStadiimDetail(stadiumDetailStatus);
	}

	@Override
	@Transactional
	public int saveBooking(StadiumDetailStatus status) {
		return stadiumDetailStatusDao.saveBooking(status);
	}

	@Override
	@Transactional
	public int updateNotificationsToBeSeen(int id) {
		return stadiumDetailStatusDao.updateNotificationsToBeSeen(id);
	}

}
