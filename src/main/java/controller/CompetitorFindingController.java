package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import common.DataStaticModel;
import dto.DistrictQuantityDto;
import dto.LevelQuantityDto;
import entities.District;
import entities.Event;
import entities.Handicap;
import entities.Level;
import entities.Notification;
import entities.StadiumDetailStatus;
import entities.Team;
import entities.User;
import service.DistrictService;
import service.EventService;
import service.HandicapService;
import service.LevelService;
import service.NotificationService;
import service.StadiumDetailStatusService;
import service.TeamService;

@Controller
public class CompetitorFindingController {
	
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
	
	@Autowired
	StadiumDetailStatusService stadiumDetailStatusService;
	
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
			
			// Thông báo bắt đối, tìm đối thủ
			List<Notification> findingRecipientNotifications = notificationService.getNotificationsByUserId(sessionUserInfo.getId());
			modelMap.addAttribute("findingRecipientNotifications", findingRecipientNotifications);
			
			// Thông báo đặt sân, từ chối, chấp nhận => status in (1,2)
			List<StadiumDetailStatus> stadiumDetailStatusNoti = stadiumDetailStatusService.getNotifications(sessionUserInfo.getId());
			modelMap.addAttribute("stadiumDetailStatusNoti", stadiumDetailStatusNoti);
		}
		
	}
	
	
	@GetMapping("tim-doi-da-bong-tai-da-nang")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page,
						@RequestParam(required = false, value = "keyword") String keyword,
						@RequestParam(required = false, value = "created_at") String created_at) {
		int rowcount = DataStaticModel.STATE_ROWCOUNT;
		int offset = (page - 1) * rowcount;
		
		int totalRows = 0;
		if (!StringUtils.isEmpty(keyword) || !StringUtils.isEmpty(created_at)) {
			totalRows = eventService.countAllRows(keyword, created_at);
		} else {
			totalRows = eventService.countAllRows();
		}
		int totalPages = (int) Math.ceil((float)totalRows/rowcount);
		
		
		List<Event> events= eventService.getEvents(offset,rowcount, keyword, created_at);
		
		modelMap.addAttribute("totalPages", totalPages);
		modelMap.addAttribute("events", events);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("keyword", keyword);
		modelMap.addAttribute("created_at", created_at);
		
		return "compf.index";
	}
	
	@GetMapping("doi-bong-tai-da-nang")
	public String teams(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page,
					    @RequestParam(value = "keyword", required=false) String keyword,
					    @RequestParam(value = "level", required=false) String levels) {
		
		List<Team> teams = new ArrayList<>();
		
		int rowcount = DataStaticModel.STATE_ROWCOUNT;
		int offset = (page-1) * rowcount;
		
		if (!StringUtils.isEmpty(levels)) {
			teams = teamService.getTeams(keyword, levels);
			modelMap.addAttribute("keyword", keyword);
			modelMap.addAttribute("teams", teams);
			return "compf.teams.ajax";
		} 
		
		if (keyword != null) {
			teams = teamService.getTeams(keyword, offset, rowcount);
			int totalRows = teamService.countAllRows(keyword);
			int totalPages = (int) Math.ceil((float)totalRows/rowcount);
			
			modelMap.addAttribute("page", page);
			modelMap.addAttribute("totalPages", totalPages);
			modelMap.addAttribute("keyword", keyword);
			modelMap.addAttribute("teams", teams);
			
			return "compf.teams";	
		}
		
		int totalRows = teamService.countAllRows();
		int totalPages = (int) Math.ceil((float)totalRows/rowcount);
		teams = teamService.getTeams(offset, rowcount);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("totalPages", totalPages);
		modelMap.addAttribute("teams", teams);
		
		return "compf.teams";
	}
	
	@PostMapping("moi-doi-giao-luu")
	public String inviteTeams(@ModelAttribute("event") Event event, @RequestParam int level_id, 
			@RequestParam int handicap_id, @RequestParam int dzipcode, @RequestParam String created_at_hour,
			@RequestParam String created_at_date, HttpServletRequest request, HttpSession httpSession) {
		
		User sessionUserInfo = (User)httpSession.getAttribute("sessionUserInfo");
		if(sessionUserInfo == null) {
			return "redirect:/";
		}
		
		initialEvent(event, dzipcode, created_at_date, created_at_hour, handicap_id, level_id, request);
		event.setUser(sessionUserInfo);
		
		if (eventService.insertEvent(event) > 0) {
			return "redirect:/tim-doi-da-bong-tai-da-nang";
		}
		
		return "redirect:/tim-doi-da-bong-tai-da-nang";
	}
	
	/**
	 * Tìm đội bóng tại đà nẵng - bắt đối 
	 */
	@PostMapping("match-frecipient")
	public String findingRecipient(@RequestParam(name="event_id") int eventId
		, @RequestParam(name="curl") String currentUrl
		, @ModelAttribute("notification") Notification notification, @SessionAttribute("sessionUserInfo") User sessionUserInfo) {
		
		int sent_user_id = sessionUserInfo.getId();
		initialNotification(notification, eventId, sent_user_id);
		
		notificationService.insertNotification(notification);
		eventService.updateStatusToBe2(eventId);
		
		return "redirect:/"+currentUrl.replace(DataStaticModel.URL_PAGE_CONSTATNT, DataStaticModel.EMPTY_SPACE);
	}
	
	private void initialNotification(Notification notification, int eventId, int sent_user_id) {
		
		Event event = new Event();
		event.setId(eventId);
		
		User user = new User();
		user.setId(sent_user_id);
		
		notification.setEvent(event);
		notification.setUser(user);
		notification.setStatus(0);
		notification.setCreatedAt(DataStaticModel.getCurrentTimetoSecond());
		notification.setUpdatedAt(DataStaticModel.getCurrentTimetoSecond());
	}
	
	private void initialEvent(Event event,int dzipcode,String created_at_date,String created_at_hour,int handicap_id,int level_id, HttpServletRequest request) {
		District district = new District();
		district.setZipcode(dzipcode);
		event.setDistrict(district);
		
		Handicap handicap = new Handicap();
		handicap.setId(handicap_id);
		event.setHandicap(handicap);
		
		Level level = new Level();
		level.setId(level_id);
		event.setLevel(level);
		
		String hasStadium = request.getParameter("CbxHasStadium");
		if (hasStadium.equals("true")){
			event.setPname(request.getParameter("pname"));
		} else {
			event.setPname("Cần đi khách");
		}
		
		event.setCreatedAt(created_at_date + " " + created_at_hour);
		/** status: waiting */
		event.setStatus(0);
		
	}
	
}

