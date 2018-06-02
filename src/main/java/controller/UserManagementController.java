package controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

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
import service.UserService;

@Controller
@SessionAttributes("sessionUserInfo")
public class UserManagementController {

	@Autowired
	DistrictService districtService;

	@Autowired
	HandicapService handicapService;

	@Autowired
	LevelService levelService;

	@Autowired
	UserService userService;
	
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

	@PostMapping("ModalLogin")
	@ResponseBody
	public String login(@Valid @ModelAttribute(value = "user") User user, BindingResult result, ModelMap modelMap,
			HttpServletResponse response) {
		if (result.hasErrors()) {
			return DataStaticModel.FAIL_LOGIN_STATUS_CONST;
		}

		User sessionUserInfo = userService.login(user);
		if (sessionUserInfo != null) {
			
			Cookie cookie = new Cookie("emailck", user.getEmail());
			cookie.setPath("/datkeonhanh");
			cookie.setHttpOnly(true);
			cookie.setMaxAge(3600);
			response.addCookie(cookie);
			
			modelMap.addAttribute("sessionUserInfo", sessionUserInfo);

			return DataStaticModel.SUCCESS_LOGIN_STATUS_CONST;
		}

		return DataStaticModel.FAIL_LOGIN_STATUS_CONST;
	}

	@GetMapping("logout")
	public String logout(ModelMap modelMap,
			HttpSession httpSession, HttpServletResponse response) {
		// we ensure sessionUserInfo existed
		if (httpSession.getAttribute("sessionUserInfo") != null) {
			
			Cookie cookie = new Cookie("emailck", null); // Not necessary, but saves bandwidth.
			cookie.setPath("/datkeonhanh");
			cookie.setHttpOnly(true);
			cookie.setMaxAge(0); // Don't set to -1 or it will become a session cookie!
			response.addCookie(cookie);
			
			modelMap.remove("sessionUserInfo");
			httpSession.removeAttribute("sessionUserInfo");
			return "redirect:/";
		}

		return "redirect:/";
	}

	@GetMapping("user/profile")
	public String profile() {
		return "account.profile";
	}

}
