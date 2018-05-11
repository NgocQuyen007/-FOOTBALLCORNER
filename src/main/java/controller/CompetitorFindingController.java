package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.DataStaticModel;
import dto.DistrictQuantityDto;
import dto.LevelQuantityDto;
import entities.District;
import entities.Event;
import entities.Handicap;
import entities.Level;
import entities.Team;
import entities.User;
import service.DistrictService;
import service.EventService;
import service.HandicapService;
import service.LevelService;
import service.TeamService;

@Controller
@RequestMapping("")
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

	@ModelAttribute
	public void common(ModelMap modelMap) {
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
	}
	
	
	@GetMapping("tim-doi-da-bong-tai-da-nang")
	public String index(ModelMap modelMap) {
		List<Event> events= eventService.getEvents();
		modelMap.addAttribute("events", events);
		return "compf.index";
	}

	
	@GetMapping("tim-doi-bong-tai-quan-xxx")
	public String waiting() {
		return "compf.waiting";
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
			System.err.println("totalRows: " + totalRows);
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
			@RequestParam String created_at_date, HttpServletRequest request) {
		
		initialEvent(event, dzipcode, created_at_date, created_at_hour, handicap_id, level_id, request);
		if (eventService.insertEvent(event) > 0) {
			return "redirect:/tim-doi-da-bong-tai-da-nang";
		}
		return "redirect:/";
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
		
		User user = new User();
		user.setId(69);
		event.setUser(user);
		
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

