package controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.DataStaticModel;
import dto.CostQuantityDto;
import dto.DistrictQuantityDto;
import dto.PitchInfoDto;
import dto.PitchTypeQuantityDto;
import entities.Cost;
import entities.PitchDetail;
import service.CostService;
import service.DistrictService;
import service.PitchDetailService;
import service.PitchService;

@Controller
@RequestMapping("")
public class PitchBookingController {

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

	@GetMapping("san-bong")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(required = false, value = "keyword") String keyword) {

		List<PitchInfoDto> pitchInfodtos = new ArrayList<>();
		int rowCount = DataStaticModel.STATE_ROWCOUNT;
		int offset = (page - 1) * rowCount;

		if (keyword != null) {
			pitchInfodtos = pitchService.getListPitchInfoByNameOrAdress(keyword);
			modelMap.addAttribute("pitchInfodtos", pitchInfodtos);

			int totalRows = getPitches(pitchInfodtos).size();
			int totalPages = (int) Math.ceil((float) totalRows / rowCount);

			// Danh sách sân bóng
			List<PitchInfoDto> pitches = getPitches(pitchInfodtos, offset, rowCount);
			modelMap.addAttribute("pitches", pitches);

			// Danh sách chi tiết sân bóng => get from database no overlap
			List<PitchDetail> pitchDetails = pitchDetailService.getPitchDetails();
			modelMap.addAttribute("pitchDetails", pitchDetails);

			modelMap.addAttribute("page", page);
			modelMap.addAttribute("totalPages", totalPages);
			modelMap.addAttribute("keyword", keyword);

			return "pitchb.ajax";
		} else {
			pitchInfodtos = pitchService.getListPitchInfo();
			modelMap.addAttribute("pitchInfodtos", pitchInfodtos);

			int totalRows = getPitches(pitchInfodtos).size();
			int totalPages = (int) Math.ceil((float) totalRows / rowCount);

			// Danh sách sân bóng
			List<PitchInfoDto> pitches = getPitches(pitchInfodtos, offset, rowCount);
			modelMap.addAttribute("pitches", pitches);

			// Danh sách chi tiết sân bóng => get from database no overlap
			List<PitchDetail> pitchDetails = pitchDetailService.getPitchDetails();
			modelMap.addAttribute("pitchDetails", pitchDetails);

			modelMap.addAttribute("page", page);
			modelMap.addAttribute("totalPages", totalPages);

			return "pitchb.index";
		}
	}

	@GetMapping("san-bong/{pid}")
	public String detail(ModelMap modelMap, @PathVariable int pid) {

		List<PitchInfoDto> pitchInfodtos = pitchService.getListPitchInfo();
		modelMap.addAttribute("pitchInfodtos", pitchInfodtos);

		/** INPUT **/
		// Danh sách sân bóng
		List<PitchInfoDto> pitches = getPitches(pitchInfodtos);

		// Thông tin sân bóng theo pid
		PitchInfoDto pitch = getPitchByPId(pitches, pid);
		modelMap.addAttribute("pitch", pitch);

		// Danh sách sân bóng cùng địa bàn <=> zipcode !pid
		List<PitchInfoDto> connectionPitches = getConnectionPitches(pitchInfodtos, pid, pitch.getZipCode());
		modelMap.addAttribute("connectionPitches", connectionPitches);

		// Danh sách chi tiết sân bóng => get from database no overlap
		List<PitchDetail> pitchDetails = pitchDetailService.getPitchDetails();
		modelMap.addAttribute("pitchDetails", pitchDetails);

		/** INPUT **/

		return "pitchb.detail";
	}

	@GetMapping("/san-bong-tai{dnameurl}-{zipcode}")
	public String zipcode(ModelMap modelMap, @PathVariable String dnameurl, @PathVariable int zipcode,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(required = false, value = "keyword") String keyword,
			@RequestParam(required = false, value = "foxx") String foxx) {

		System.err.println("========== Vao day choi ===========> " + zipcode + " === " + dnameurl);
		
		System.err.println("fox x: " + foxx);

		List<PitchInfoDto> pitchInfodtos = new ArrayList<>();
		int rowCount = DataStaticModel.STATE_ROWCOUNT;
		int offset = (page - 1) * rowCount;

		if (keyword != null) {
			pitchInfodtos = pitchService.getListPitchInfoByNameOrAdress(keyword);
			modelMap.addAttribute("pitchInfodtos", pitchInfodtos);

			int totalRows = getPitches(pitchInfodtos).size();
			int totalPages = (int) Math.ceil((float) totalRows / rowCount);

			// Danh sách sân bóng
			List<PitchInfoDto> pitches = getPitches(pitchInfodtos, offset, rowCount);
			modelMap.addAttribute("pitches", pitches);

			// Danh sách chi tiết sân bóng => get from database no overlap
			List<PitchDetail> pitchDetails = pitchDetailService.getPitchDetails();
			modelMap.addAttribute("pitchDetails", pitchDetails);

			modelMap.addAttribute("page", page);
			modelMap.addAttribute("totalPages", totalPages);
			modelMap.addAttribute("keyword", keyword);

			return "pitchb.district";
		}

		pitchInfodtos = pitchService.getListPitchInfoByZipCode(zipcode);

		modelMap.addAttribute("pitchInfodtos", pitchInfodtos);

		int totalRows = getPitches(pitchInfodtos).size();
		int totalPages = (int) Math.ceil((float) totalRows / rowCount);

		// Danh sách sân bóng
		List<PitchInfoDto> pitches = getPitches(pitchInfodtos, offset, rowCount);
		modelMap.addAttribute("pitches", pitches);

		// Danh sách chi tiết sân bóng => get from database no overlap
		List<PitchDetail> pitchDetails = pitchDetailService.getPitchDetails();
		modelMap.addAttribute("pitchDetails", pitchDetails);

		modelMap.addAttribute("page", page);
		modelMap.addAttribute("totalPages", totalPages);

		return "pitchb.district";
	}

	public List<PitchDetail> getPitchDetailsByPitchId(int pitchId, List<PitchDetail> pitchDetails) {
		List<PitchDetail> pitchDetailByPitchIds = new ArrayList<>();
		for (PitchDetail item : pitchDetails) {
			if (item.getPitch().getId() == pitchId) {
				pitchDetailByPitchIds.add(item);
			}
		}
		return pitchDetailByPitchIds.size() > 0 ? pitchDetailByPitchIds : Collections.emptyList();
	}

	public PitchInfoDto getPitchByPId(List<PitchInfoDto> pitches, int pid) {
		for (PitchInfoDto pitch : pitches) {
			if (pid == pitch.getId()) {
				return pitch;
			}
		}
		return null;
	}

	public List<PitchInfoDto> getPitches(List<PitchInfoDto> pitchInfodtos) {
		List<PitchInfoDto> pitches = new ArrayList<>();
		List<Integer> pids = new ArrayList<>();
		// List id-s of pitches

		for (PitchInfoDto pidto : pitchInfodtos) {
			if (!pids.contains(pidto.getId())) {
				pids.add(pidto.getId());
				pitches.add(pidto);
			}
		}
		return pitches.size() > 0 ? pitches : Collections.emptyList();
	}

	public List<PitchInfoDto> getPitches(List<PitchInfoDto> pitchInfodtos, int offset, int rowCount) {
		List<PitchInfoDto> pitches = new ArrayList<>();
		List<Integer> pids = new ArrayList<>();
		// List id-s of pitches

		for (PitchInfoDto pidto : pitchInfodtos) {
			if (!pids.contains(pidto.getId())) {
				pids.add(pidto.getId());
				pitches.add(pidto);
			}
		}
		List<PitchInfoDto> result = new ArrayList<>();
		for (int i = 0; i < pitches.size(); i++) {
			if (i >= offset && i < (offset + rowCount)) {
				result.add(pitches.get(i));
			}
		}
		return result;
	}

	public List<PitchInfoDto> getConnectionPitches(List<PitchInfoDto> pitchInfodtos, int pid, int zipcode) {
		List<PitchInfoDto> pitches = new ArrayList<>();
		List<Integer> pids = new ArrayList<>();
		// List id-s of pitches

		for (PitchInfoDto pidto : pitchInfodtos) {
			if (pidto.getId() != pid) {
				if (!pids.contains(pidto.getId()) && pidto.getZipCode() == zipcode) {
					pids.add(pidto.getId());
					pitches.add(pidto);
				}
			}
		}
		return pitches;
	}

	public List<Cost> getListCostByPDetailId(int pitchDetailId, List<PitchInfoDto> pitchInfodtos) {
		List<Cost> costs = new ArrayList<>();
		for (PitchInfoDto dto : pitchInfodtos) {
			if (dto.getPitchDetailId() != null) {
				if (dto.getPitchDetailId() == pitchDetailId) {
					Cost cost = new Cost(dto.getCostId(), dto.getHourStart(), dto.getHourEnd(), dto.getWdayStart(),
							dto.getWdayEnd(), dto.getPrice());
					System.out.println(cost.toString());
					costs.add(cost);
				}
			}
		}
		return costs;
	}
}
