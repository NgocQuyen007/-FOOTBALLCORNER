package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import common.DataStaticModel;
import dto.DistrictQuantityDto;
import dto.EventInfoDto;
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

@Controller
@RequestMapping("")
public class HomepageController {

	@Autowired
	DistrictService districtService;
	
	@Autowired
	HandicapService handicapService;
	
	@Autowired
	LevelService levelService;
	
	@Autowired
	NotificationService notificationService;
	
	@Autowired
	EventService eventService;
	
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
			List<Notification> findingRecipientNotifications = notificationService.getNotificationsByUserId(sessionUserInfo.getId());
			modelMap.addAttribute("findingRecipientNotifications", findingRecipientNotifications);
		}
		
	}
	
	@GetMapping
	public String index(ModelMap modelMap, HttpSession httpSession) {
		if (httpSession.getAttribute("sessionUserInfo") != null) {
			return "redirect:/tim-doi-da-bong-tai-da-nang";
		}
		List<EventInfoDto> soDoiTaiMoiQuan = eventService.thongKeSoLuongDoiTaiMoiQuan();
		System.out.println(soDoiTaiMoiQuan.size() + " ihuhhih ");
		modelMap.addAttribute("soDoiTaiMoiQuan", soDoiTaiMoiQuan);
		return "homepage.index";
	}
	
}
