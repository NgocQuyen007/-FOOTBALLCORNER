package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import common.DataStaticModel;
import dto.DistrictQuantityDto;
import dto.LevelQuantityDto;
import entities.District;
import entities.Handicap;
import entities.Level;
import entities.Notification;
import entities.User;
import service.DistrictService;
import service.EventService;
import service.HandicapService;
import service.LevelService;
import service.NotificationService;
import service.TeamService;

@Controller
public class NotificationController {
	
	@Autowired
	TeamService teamService;
	
	@Autowired
	EventService eventService;
	
	@Autowired
	DistrictService districtService;
	
	@Autowired
	HandicapService handicapService;
	
	@Autowired
	LevelService levelService;
	
	@Autowired
	NotificationService notificationService;
	
	@ModelAttribute
	public void common(ModelMap modelMap, HttpSession httpSession) {
		List<DistrictQuantityDto> districtdtos = districtService.getPitchesQuantityofDistricts();
		List<DistrictQuantityDto> teamsofeachdistrict = teamService.getTeamsQuantityofDistricts();
		List<LevelQuantityDto> teamsofeachlevel = teamService.getTeamsQuantityofLevels();
		
		modelMap.addAttribute("districtdtos", districtdtos);
		modelMap.addAttribute("teamsofeachdistrict", teamsofeachdistrict);
		modelMap.addAttribute("teamsofeachlevel", teamsofeachlevel);
		
		/** Mời đối giao lưu => Quận kèo trình độ */
		List<District> allofdistrict = districtService.getDistricts();
		List<Handicap> handicaps = handicapService.getHandicaps();
		List<Level> levels = levelService.getLevels();

		modelMap.addAttribute("allofdistrict", allofdistrict);
		modelMap.addAttribute("handicaps", handicaps);
		modelMap.addAttribute("levels", levels);
		
		modelMap.addAttribute("PITCH_BOOKING_TIME_MAP", DataStaticModel.PITCH_BOOKING_TIME_MAP);
		
		/** Thông báo bắt đối trận đấu*/
		if (httpSession.getAttribute("sessionUserInfo") != null) {
			User sessionUserInfo = (User) httpSession.getAttribute("sessionUserInfo");
			List<Notification> findingRecipientNotifications = notificationService.getNotificationsByUserId(sessionUserInfo.getId());
			modelMap.addAttribute("findingRecipientNotifications", findingRecipientNotifications);
		}
		
	}
	
	/**
	 * Update notification status khi user click vao noti-icon
	 * update status = 1 where (user_id [event] = sessionUserInfo.getId())
	 * */
	@GetMapping("seen-notifications")
	@ResponseBody
	public String seen(@SessionAttribute("sessionUserInfo") User sessionUserInfo) {
		System.err.println("====================== Noti seen hahaha ======================");
		notificationService.updateNotificationStatusToBeSeenByEventUserId(sessionUserInfo.getId());
		return "seen";
	}
}
