package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import common.DataStaticModel;
import dto.DistrictQuantityDto;
import entities.District;
import entities.Handicap;
import entities.Level;
import service.DistrictService;
import service.HandicapService;
import service.LevelService;

@Controller
public class AuthController {
	@Autowired
	DistrictService districtService;
	
	@Autowired
	HandicapService handicapService;
	
	@Autowired
	LevelService levelService;
	
	@ModelAttribute
	public void common(ModelMap modelMap) {
		List<DistrictQuantityDto> districtdtos = districtService.getPitchesQuantityofDistricts();
		List<District> allofdistrict = districtService.getDistricts();
		List<Handicap> handicaps = handicapService.getHandicaps();
		List<Level> levels = levelService.getLevels();

		modelMap.addAttribute("districtdtos", districtdtos);
		modelMap.addAttribute("allofdistrict", allofdistrict);
		modelMap.addAttribute("handicaps", handicaps);
		modelMap.addAttribute("levels", levels);
		modelMap.addAttribute("PITCH_BOOKING_TIME_MAP", DataStaticModel.PITCH_BOOKING_TIME_MAP);
	}
	
	@RequestMapping(value="/403", method=RequestMethod.GET)
	public String er403(){
		return "public.auth.er403";
	}
	
	@RequestMapping(value="/404", method=RequestMethod.GET)
	public String er404(){
		return "public.auth.er404";
	}
}
