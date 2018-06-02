package controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.DataStaticModel;
import dto.CostQuantityDto;
import dto.DistrictQuantityDto;
import dto.PitchInfoDto;
import dto.PitchTypeQuantityDto;
import entities.Cost;
import entities.District;
import entities.Handicap;
import entities.Level;
import entities.Notification;
import entities.PitchDetail;
import entities.StadiumDetailStatus;
import entities.User;
import service.CostService;
import service.DistrictService;
import service.HandicapService;
import service.LevelService;
import service.NotificationService;
import service.PitchDetailService;
import service.PitchService;
import service.StadiumDetailStatusService;

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
		/** Common left bar = Thông tin Số sân bóng theo Quận - Giá - Loại sân*/
		List<DistrictQuantityDto> districtdtos = districtService.getPitchesQuantityofDistricts();
		List<CostQuantityDto> costdtos = costService.getPitchesQuantityofCosts();
		List<PitchTypeQuantityDto> pitchtypedtos = pitchDetailService.getPitchesQuantityofPitchType();

		modelMap.addAttribute("districtdtos", districtdtos);
		modelMap.addAttribute("costdtos", costdtos);
		modelMap.addAttribute("pitchtypedtos", pitchtypedtos);
		
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
	
	@PostMapping("choose-the-booking-date")
	public String chooseTheBookingDate(@RequestParam int costId, @RequestParam String matchDay, ModelMap modelMap) {
		System.err.println("==================");
		Cost cost = costService.getCost(costId);
		PitchDetail pitchDetail = cost.getPitchDetail();
		/** Số lượng sân bóng mini ứng với loại sân - quantity */
		System.err.println(pitchDetailService + " = = = " + pitchDetail.getId());
		int quantityOfPitchDetail = pitchDetailService.getPitchDetail(pitchDetail.getId()).getQuantity();  
		
		modelMap.addAttribute("cost", cost);
		modelMap.addAttribute("matchDay", matchDay);
		modelMap.addAttribute("quantityOfPitchDetail", quantityOfPitchDetail);
		modelMap.addAttribute("stadiumDetailStatusService", stadiumDetailStatusService); 
		
		/*for (int matchTime = cost.getHourStart(); matchTime < cost.getHourEnd(); matchTime++) {
			StadiumDetailStatus stadiumDetailStatus = new StadiumDetailStatus(cost, matchDay, matchTime);
			// Nếu số lượng trong bảng stadium_detail_status < quantity trong pitch_details => khung giờ đó, ngày đó còn có sân trống
			int count = stadiumDetailStatusService.countNumberOfPitchAvailableByTime(stadiumDetailStatus);
			
			
			System.out.println("=> " + stadiumDetailStatus.getCost().getId()
					+ ", " + stadiumDetailStatus.getMatchDay() 
					+ ", " + stadiumDetailStatus.getMatchTime() + ": " + count + " -- " + quantityOfPitchDetail + " - " + (count < quantityOfPitchDetail ? "active" : "disable"));
		}*/
		return "pitchb.detail.ajax";
	}
	
	@PostMapping("customer-booking")
	public String customerBookStadium(@ModelAttribute StadiumDetailStatus stadiumDetailStatus,
			@RequestParam String matchDayAndTime, @RequestParam int userId,
			@RequestParam int costId, @RequestParam int pitchId) {
		createStadiumDetailStatus(stadiumDetailStatus, matchDayAndTime, costId, userId);
		if (stadiumDetailStatusService.saveStadiumDetailStatus(stadiumDetailStatus) > 0 ) {
			return "redirect:/san-bong/"+pitchId + "?msg=bookStas";
		}
		return "redirect:/san-bong/"+pitchId + "?msg=bookStaf";
		
	}

	@GetMapping("san-bong")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(required = false, value = "keyword") String keyword,
			@RequestParam(required = false, value= "type") String numberofplayersKey,
			@RequestParam(required = false, value= "price") String priceKey) {

		List<PitchInfoDto> pitchInfodtos = new ArrayList<>();
		int rowCount = DataStaticModel.STATE_ROWCOUNT;
		int offset = (page - 1) * rowCount;

		if(numberofplayersKey != null || priceKey != null) {
			
			pitchInfodtos = pitchService.getListPitchInfo(priceKey,numberofplayersKey, keyword);
			
			if(pitchInfodtos.size() > 0) {
				int totalRows = getPitches(pitchInfodtos).size();
				int totalPages = (int) Math.ceil((float) totalRows / rowCount);
				
				modelMap.addAttribute("pitchInfodtos", pitchInfodtos);
				
				List<PitchInfoDto> pitches = getPitches(pitchInfodtos, offset, rowCount);
				modelMap.addAttribute("pitches", pitches);

				List<PitchDetail> pitchDetails = pitchDetailService.getPitchDetails();
				modelMap.addAttribute("pitchDetails", pitchDetails);
				
				modelMap.addAttribute("page", page);
				modelMap.addAttribute("totalPages", totalPages);
				modelMap.addAttribute("keyword", keyword);
			} else {
				int totalPages = 0;
				modelMap.addAttribute("totalPages", totalPages);
				modelMap.addAttribute("keyword", keyword);
			}
			return "pitchb.index.ajax";
		}
		
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

			return "pitchb.index.ajax";
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

	@GetMapping("san-bong-tai{dnameurl}-{zipcode}")
	public String zipcode(ModelMap modelMap, @PathVariable String dnameurl, @PathVariable int zipcode,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(required = false, value = "keyword") String keyword,
			@RequestParam(required = false, value= "type") String numberofplayersKey,
			@RequestParam(required = false, value= "price") String priceKey) {
		
		List<PitchInfoDto> pitchInfodtos = new ArrayList<>();
		int rowCount = DataStaticModel.STATE_ROWCOUNT;
		int offset = (page - 1) * rowCount;
		
		if(numberofplayersKey != null || priceKey != null) {
			
			pitchInfodtos = pitchService.getListPitchInfo(zipcode, priceKey,numberofplayersKey, keyword);
			
			if(pitchInfodtos.size() > 0) {
				int totalRows = getPitches(pitchInfodtos).size();
				int totalPages = (int) Math.ceil((float) totalRows / rowCount);
				
				modelMap.addAttribute("pitchInfodtos", pitchInfodtos);
				
				List<PitchInfoDto> pitches = getPitches(pitchInfodtos, offset, rowCount);
				modelMap.addAttribute("pitches", pitches);

				List<PitchDetail> pitchDetails = pitchDetailService.getPitchDetails();
				modelMap.addAttribute("pitchDetails", pitchDetails);
				
				modelMap.addAttribute("page", page);
				modelMap.addAttribute("totalPages", totalPages);
				modelMap.addAttribute("keyword", keyword);
			} else {
				int totalPages = 0;
				modelMap.addAttribute("totalPages", totalPages);
				modelMap.addAttribute("keyword", keyword);
			}
			return "pitchb.district.ajax";
		}
		
		if (keyword != null) {
			pitchInfodtos = pitchService.getListPitchInfoByNameOrAdressAndZipcode(zipcode, keyword);
			modelMap.addAttribute("pitchInfodtos", pitchInfodtos);
			
			if(pitchInfodtos .size() > 0) {
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
			} else {
				int totalPages = 0;
				modelMap.addAttribute("totalPages", totalPages);
				modelMap.addAttribute("keyword", keyword);
			}
			
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
	
	private void createStadiumDetailStatus(StadiumDetailStatus stadiumDetailStatus, String matchDayAndTime, int costId, int userId) {
		Cost cost = new Cost(); User user = new User();
		cost.setId(costId); user.setId(userId);
		stadiumDetailStatus.setCost(cost);
		stadiumDetailStatus.setUser(user);
		
		int matchTime = DataStaticModel.PITCH_BEGIN_END_HOUR_MAP.get(matchDayAndTime.trim().substring(0, 5));
		String matchDay = matchDayAndTime.trim().substring(matchDayAndTime.lastIndexOf(" ")+1);
		
		stadiumDetailStatus.setMatchDay(matchDay);
		stadiumDetailStatus.setMatchTime(matchTime);
		stadiumDetailStatus.setMatchDateTime(matchDayAndTime);
		
		stadiumDetailStatus.setStatus(0);
		stadiumDetailStatus.setCreatedAt(DataStaticModel.getCurrentTimetoSecond());
		
		
	}
}
