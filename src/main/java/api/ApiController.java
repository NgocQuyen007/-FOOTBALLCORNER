package api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dto.CostQuantityDto;
import dto.DistrictQuantityDto;
import dto.PitchInfoDto;
import dto.PitchTypeQuantityDto;
import entities.PitchDetail;
import service.CostService;
import service.DistrictService;
import service.PitchDetailService;
import service.PitchService;

@Controller
@RequestMapping("api")
public class ApiController {

	@Autowired
	DistrictService districtService;

	@Autowired
	CostService costService;

	@Autowired
	PitchDetailService pitchDetailService;

	@Autowired
	PitchService pitchService;
	
	@ModelAttribute
	public void common(ModelMap modelMap) {
		List<DistrictQuantityDto> districtdtos = districtService.getPitchesQuantityofDistricts();
		List<CostQuantityDto> costdtos = costService.getPitchesQuantityofCosts();
		List<PitchTypeQuantityDto> pitchtypedtos = pitchDetailService.getPitchesQuantityofPitchType();
		
		modelMap.addAttribute("districts", districtdtos);
		modelMap.addAttribute("costdtos", costdtos);
		modelMap.addAttribute("pitchtypedtos", pitchtypedtos);
		
	}
	
	@GetMapping("search")
	public String index(ModelMap modelMap, @RequestParam("keyword") String keyword) {
		List<PitchInfoDto> pitchInfodtos = pitchService.getListPitchInfoByNameOrAdress(keyword);
		modelMap.addAttribute("pitchInfodtos", pitchInfodtos);
		
		// Danh sách sân bóng
		List<PitchInfoDto> pitches = getPitches(pitchInfodtos);
		modelMap.addAttribute("pitches", pitches);
		
		// Danh sách chi tiết sân bóng => get from database no overlap
		List<PitchDetail> pitchDetails = pitchDetailService.getPitchDetails();
		modelMap.addAttribute("pitchDetails", pitchDetails);
		
		return "pitchb.ajax";
	}
	
	public List<PitchInfoDto> getPitches(List<PitchInfoDto> pitchInfodtos) {
		List<PitchInfoDto> pitches = new ArrayList<>();
		List<Integer> pids = new ArrayList<>();

		for (PitchInfoDto pidto : pitchInfodtos) {
			if (!pids.contains(pidto.getId())) {
				pids.add(pidto.getId());
				pitches.add(pidto);
			}
		}
		return pitches;
	}
}
