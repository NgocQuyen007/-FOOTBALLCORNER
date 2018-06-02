package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.DataStaticModel;
import dto.DistrictQuantityDto;
import entities.District;
import entities.Handicap;
import entities.Level;
import entities.Notification;
import entities.StadiumDetailStatus;
import entities.User;
import service.DistrictService;
import service.HandicapService;
import service.LevelService;
import service.NotificationService;
import service.StadiumDetailStatusService;

@Controller
@RequestMapping("team/management")
public class TeamManagementController {

	@Autowired
	DistrictService districtService;
	
	@Autowired
	HandicapService handicapService;
	
	@Autowired
	LevelService levelService;
	
	@Autowired
	NotificationService notificationService;
	
	@Autowired
	StadiumDetailStatusService stadiumDetailStatusService;
	
	@ModelAttribute
	public void common(ModelMap modelMap, HttpSession httpSession) {
		List<DistrictQuantityDto> districtdtos = districtService.getPitchesQuantityofDistricts();
		List<District> allofdistrict = districtService.getDistricts();
		List<Handicap> handicaps = handicapService.getHandicaps();
		List<Level> levels = levelService.getLevels();

		modelMap.addAttribute("districtdtos", districtdtos);
		modelMap.addAttribute("allofdistrict", allofdistrict);
		modelMap.addAttribute("handicaps", handicaps);
		modelMap.addAttribute("levels", levels);
		modelMap.addAttribute("PITCH_BOOKING_TIME_MAP", DataStaticModel.PITCH_BOOKING_TIME_MAP);
		
		/** Thông báo bắt đối trận đấu*/
		if (httpSession.getAttribute("sessionUserInfo") != null) {
			User sessionUserInfo = (User) httpSession.getAttribute("sessionUserInfo");
			
			// Thông báo bắt đối, tìm đối thủ
			List<Notification> findingRecipientNotifications = notificationService.getNotificationsByUserId(sessionUserInfo.getId());
			modelMap.addAttribute("findingRecipientNotifications", findingRecipientNotifications);
			
			// Thông báo đặt sân, từ chối, chấp nhận => status in (1,2)
			List<StadiumDetailStatus> stadiumDetailStatusNoti = stadiumDetailStatusService.getNotifications(sessionUserInfo.getId());
			modelMap.addAttribute("stadiumDetailStatusNoti", stadiumDetailStatusNoti);
			
		}
	}
	
	@GetMapping("newteam")
	public String newteam(ModelMap modelMap) {
		return "team.newteam";
	}
	
	@GetMapping
	public String index(@RequestParam String tab) {
		switch (tab) {
			case "timdoi":
				return "team.timdoi.tab";
			case "thanhvien":
				return "team.thanhvien.tab";
			case "gioithieu":
				return "team.gioithieu.tab";
			case "quybong":
				return "team.quybong.tab";
		}
		// error by anyway
		return "redirect:/team/management/newteam";
	}
	
	@GetMapping("{id}/setting")
	public String setting() {
		return "update.info.thongtindoi";
	}
	
	@GetMapping("{id}/users")
	public String users() {
		return "update.info.thanhvien";
	}
	
	@GetMapping("{id}/fundmanagement")
	public String fundmanagement() {
		return "update.info.quanlyquy";
	}
	
}
