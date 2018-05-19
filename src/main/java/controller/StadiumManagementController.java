package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.DataStaticModel;
import dto.DistrictQuantityDto;
import entities.Address;
import entities.District;
import entities.Handicap;
import entities.Level;
import entities.Notification;
import entities.Pitch;
import entities.User;
import service.DistrictService;
import service.HandicapService;
import service.LevelService;
import service.NotificationService;

@Controller
@RequestMapping("stadium/management")
public class StadiumManagementController {

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
		List<District> allofdistrict = districtService.getDistricts();
		List<Handicap> handicaps = handicapService.getHandicaps();
		List<Level> levels = levelService.getLevels();

		modelMap.addAttribute("districtdtos", districtdtos);
		modelMap.addAttribute("allofdistrict", allofdistrict);
		modelMap.addAttribute("handicaps", handicaps);
		modelMap.addAttribute("levels", levels);
		modelMap.addAttribute("PITCH_BOOKING_TIME_MAP", DataStaticModel.PITCH_BOOKING_TIME_MAP);
		
		modelMap.addAttribute("PITCH_BEGIN_END_HOUR_MAP", DataStaticModel.PITCH_BEGIN_END_HOUR_MAP);
		
		
		/** Thông báo bắt đối trận đấu*/
		if (httpSession.getAttribute("sessionUserInfo") != null) {
			User sessionUserInfo = (User) httpSession.getAttribute("sessionUserInfo");
			List<Notification> findingRecipientNotifications = notificationService.getNotificationsByUserId(sessionUserInfo.getId());
			modelMap.addAttribute("findingRecipientNotifications", findingRecipientNotifications);
		}
	}
	
	@GetMapping
	public String index(HttpSession httpSession) {
		if (httpSession.getAttribute("sessionUserInfo") == null) {
			return "redirect:/";
		}
		return "stadium.list";
	}
	
	@GetMapping("bookingManager/{id}")
	public String booking() {
		return "stadium.booking";
	}
	
	@GetMapping("addNew")
	public String addNew(HttpSession httpSession) {
		if (httpSession.getAttribute("sessionUserInfo") == null) {
			return "redirect:/";
		}
		return "stadium.new";
	}
	
	@PostMapping("addNew")
	public String addNew(HttpSession httpSession, @ModelAttribute("pitch") Pitch pitch, 
			@ModelAttribute("address") Address address,
			@RequestParam String dzipcode,
			HttpServletRequest request) {
		if (httpSession.getAttribute("sessionUserInfo") == null) {
			return "redirect:/";
		}
		
		User sessionUserInfo = (User) httpSession.getAttribute("sessionUserInfo");
		
		System.out.println("====================================");
		System.out.println(pitch.toString());
		System.out.println(address.toString() + ", " + dzipcode + ", " + sessionUserInfo.getId());
		System.out.println(request.getParameter("statidum_type_5") + " = = > " + request.getParameter("statidum_type_5_quanties"));
		
		// System.out.println(request.getParameter("statidum_type_7") + " = = > " + request.getParameter("statidum_type_7_quanties"));
		
		// System.out.println(request.getParameter("statidum_type_11") + " = = > " + request.getParameter("statidum_type_11_quanties"));
		
		String [] cost_hour_start_5 = request.getParameterValues("cost_hour_start_5");
		String [] cost_hour_end_5 = request.getParameterValues("cost_hour_end_5");
		String [] fromDaytoDay_5 = request.getParameterValues("fromDaytoDay_5");
		String [] price_5 = request.getParameterValues("price_5");
		
		System.out.println("Size: " + cost_hour_start_5.length + ", " + cost_hour_end_5.length + ", " + fromDaytoDay_5.length + ", " + price_5.length);
		
		System.out.println("=======");
		for(int i = 0 ; i < price_5.length ; i++) {
			System.out.println(cost_hour_start_5[i] + ", " + cost_hour_end_5[i] + ", " + fromDaytoDay_5[i] + ", " + price_5[i]  );
		}
		
		
		System.out.println("====================================");
		
		
		
		/**
		 * insert Pitch => pitch_id
		 * insert Address
		 * 
		 * Xu ly pitch detail
		 * Kiem tra list pitch type => pitch_type_id
		 * 
		 * => insert pitches_detail => id
		 * => insert costs
		 * => insert mini pitches
		 */
		
		return "stadium.new";
	}
	
	@GetMapping("stadium-info/{id}")
	public String updateInfo() {
		return "stadium.update.info";
	}
	
}
