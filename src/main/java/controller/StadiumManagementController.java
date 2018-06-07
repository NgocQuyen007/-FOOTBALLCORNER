package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.common.collect.Sets;

import common.DataStaticModel;
import common.LibraryString;
import common.TagLibFunctions;
import dto.BookingManagerDto;
import dto.DistrictQuantityDto;
import dto.PitchInfoDto;
import entities.Address;
import entities.Cost;
import entities.District;
import entities.Handicap;
import entities.Level;
import entities.Notification;
import entities.Pitch;
import entities.PitchDetail;
import entities.PitchType;
import entities.StadiumDetailStatus;
import entities.User;
import service.AddressService;
import service.CostService;
import service.DistrictService;
import service.HandicapService;
import service.LevelService;
import service.NotificationService;
import service.PitchDetailService;
import service.PitchService;
import service.StadiumDetailStatusService;

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
	
	@Autowired
	PitchService pitchService;
	
	@Autowired
	AddressService addressService;
	
	@Autowired
	PitchDetailService pitchDetailService;
	
	@Autowired
	CostService costService;
	
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
		
		modelMap.addAttribute("PITCH_BEGIN_END_HOUR_MAP", DataStaticModel.PITCH_BEGIN_END_HOUR_MAP);
		
		
		/** Thông báo bắt đối trận đấu*/
		if (httpSession.getAttribute("sessionUserInfo") != null) {
			User sessionUserInfo = (User) httpSession.getAttribute("sessionUserInfo");
			
			// Thông báo bắt đối, tìm đối thủ
			List<Notification> findingRecipientNotifications = notificationService.getNotificationsByUserId(sessionUserInfo.getId());
			modelMap.addAttribute("findingRecipientNotifications", findingRecipientNotifications);
			
			// Thông báo đặt sân, từ chối, chấp nhận => status in (1,2)
			List<StadiumDetailStatus> stadiumDetailStatusNoti = stadiumDetailStatusService.getNotifications(sessionUserInfo.getId());
			// System.err.println("SISiSISISISISSI: " + stadiumDetailStatusNoti.size());
			// System.err.println("Tên sân ========================> : " + stadiumDetailStatusNoti.get(0).getCost().getPitchDetail().getPitch().getName());
			modelMap.addAttribute("stadiumDetailStatusNoti", stadiumDetailStatusNoti);
			
		}
	}
	
	@GetMapping
	public String index(HttpSession httpSession, ModelMap modelMap) {
		if (httpSession.getAttribute("sessionUserInfo") == null) {
			return "redirect:/";
		}
		User sessionUserInfo = (User) httpSession.getAttribute("sessionUserInfo");
		List<Pitch> stadiums = pitchService.getListPitchesByUserId(sessionUserInfo.getId());
		if (stadiums.size() > 0 ) {
			modelMap.addAttribute("stadiums", stadiums);
			return "stadium.list";
		}
		
		/*
		for(Pitch stadium: stadiums) {
			Address address =  stadium.getAddresses().iterator().next();
			System.out.println(stadium.getName() + ", " + address.getDetail() +", " + address.getPhoneNumber() + ", " + address.getFacebook() + ","
					+ address.getPemail() + ", " + stadium.getCoverAvatar() + address.getDistrict().getName() + address.getWebsite());
		}
		*/
		
		/** TH chưa có sân nào cả*/
		return "redirect:/stadium/management/addNew";
		
	}
	
	@GetMapping("addNew")
	public String addNew(HttpSession httpSession, HttpServletRequest request) {
		if (httpSession.getAttribute("sessionUserInfo") == null) {
			return "redirect:/";
		}
		return "stadium.new";
	}
	
	@PostMapping("addNew")
	public String addNew(HttpSession httpSession, @ModelAttribute("pitch") Pitch pitch, @ModelAttribute("address") Address address, @RequestParam Integer dzipcode,
			@RequestParam("cover_avatar") CommonsMultipartFile commonsMultipartFile, HttpServletRequest request) {
		if (httpSession.getAttribute("sessionUserInfo") == null) {
			return "redirect:/";
		}
		
		String uploadFileDirPath = request.getServletContext().getRealPath(DataStaticModel.UPLOAD_FILE_DIRECTORY);
		File uploadFileDir = new File(uploadFileDirPath);
		if(!uploadFileDir.exists()) {
			uploadFileDir.mkdir();
		}
		
		String originalFileName = commonsMultipartFile.getOriginalFilename();
		if(!"".equals(originalFileName)) {
			pitch.setCoverAvatar(LibraryString.renameFile(originalFileName));
		}
		
		User sessionUserInfo = (User) httpSession.getAttribute("sessionUserInfo");
		
		int san5 = Integer.parseInt(request.getParameter("statidum_type_5"));;
		int soLuongSan5 = !request.getParameter("statidum_type_5_quanties").equals("") ? Integer.parseInt(request.getParameter("statidum_type_5_quanties")) : 0;
		String [] cost_hour_start_5 = request.getParameterValues("cost_hour_start_5");
		String [] cost_hour_end_5 = request.getParameterValues("cost_hour_end_5");
		String [] fromDaytoDay_5 = request.getParameterValues("fromDaytoDay_5");
		String [] price_5 = request.getParameterValues("price_5");
		int soBangGiaSan5 = price_5.length;
		
		int san7 = Integer.parseInt(request.getParameter("statidum_type_7"));
		int soLuongSan7 = !request.getParameter("statidum_type_7_quanties").equals("") ? Integer.parseInt(request.getParameter("statidum_type_7_quanties")) : 0;
		String [] cost_hour_start_7 = request.getParameterValues("cost_hour_start_7");
		String [] cost_hour_end_7 = request.getParameterValues("cost_hour_end_7");
		String [] fromDaytoDay_7 = request.getParameterValues("fromDaytoDay_7");
		String [] price_7 = request.getParameterValues("price_7");
		int soBangGiaSan7 = price_7.length;
		
		int	san11 = Integer.parseInt(request.getParameter("statidum_type_11"));
		int soLuongSan11 = !request.getParameter("statidum_type_11_quanties").equals("") ? Integer.parseInt(request.getParameter("statidum_type_11_quanties")) : 0;
		String [] cost_hour_start_11 = request.getParameterValues("cost_hour_start_11");
		String [] cost_hour_end_11 = request.getParameterValues("cost_hour_end_11");
		String [] fromDaytoDay_11 = request.getParameterValues("fromDaytoDay_11");
		String [] price_11 = request.getParameterValues("price_11");
		int soBangGiaSan11 = price_11.length ;
		
		/*
		System.out.println("So Luong Gia san 5: " + cost_hour_start_5.length);
		System.out.println("So Luong Gia san 7: " + cost_hour_start_7.length);
		System.out.println("So Luong Gia san 11: " + cost_hour_start_11.length);
		
		System.out.println("San " + san5 + " SoLuong: " + soLuongSan5);
		System.out.println("San " + san7 + " SoLuong: " + soLuongSan7);
		System.out.println("San " + san11 + " SoLuong: " + soLuongSan11);
		*/
		
		/**
		 * insert Pitch => pitch_id => OK
		 * insert Address => OK
		 * 
		 * Xu ly pitch detail
		 * Kiem tra list pitch type => pitch_type_id
		 * 
		 * => insert pitches_detail => id
		 * => insert costs
		 * 
		 * 
		 * => insert mini pitches
		 */
		
		
		initialPitch(pitch, sessionUserInfo);
		int newestPId = pitchService.insertPitch(pitch);
		
		initialAddress(pitch, dzipcode, address, newestPId);
		addressService.insertAddress(address);
		
		List<PitchDetail> pitchDetails = new ArrayList<>();
		if (soLuongSan5 > 0 && soBangGiaSan5 > 2) {
			pitchDetails.add(getPitchDetail(san5, newestPId, soLuongSan5));
		}
		
		if (soLuongSan7 > 0 && soBangGiaSan7 > 2) {
			pitchDetails.add(getPitchDetail(san7, newestPId, soLuongSan7));
		}
		
		if (soLuongSan11 > 0 && soBangGiaSan11 > 2) {
			pitchDetails.add(getPitchDetail(san11, newestPId, soLuongSan11));
		}
		
		for (PitchDetail pitchDetail: pitchDetails) {
			Map<Integer, Integer> pdId_pitchTypeId = pitchDetailService.insertPitchDetail(pitchDetail);
			Map.Entry<Integer, Integer> entry = pdId_pitchTypeId.entrySet().iterator().next();
			// Kiểm tra pitch detail id mới thêm vào là sân 5 7 11 để lấy danh sách cost phù hợp insert
			switch (entry.getValue()) {
				case 5:
					insertCostControl(entry.getKey(), soBangGiaSan5, cost_hour_start_5, cost_hour_end_5, fromDaytoDay_5, price_5);
					break;
				case 7:
					insertCostControl(entry.getKey(), soBangGiaSan7, cost_hour_start_7, cost_hour_end_7, fromDaytoDay_7, price_7);
					break;
				case 11:
					insertCostControl(entry.getKey(), soBangGiaSan11, cost_hour_start_11, cost_hour_end_11, fromDaytoDay_11, price_11);
					break;
			}
		}
		
		if (newestPId > 0) {
			if(!pitch.getCoverAvatar().equals("")){
				try {
					// Upload file
					commonsMultipartFile.transferTo(new File(uploadFileDir + File.separator + pitch.getCoverAvatar()));
				} catch (IllegalStateException | IOException e) {}
			}
			return "redirect:/stadium/management?msg=adds";
		}
		
		return "redirect:/stadium/management/addNew?msg=addf";
	}
	
	
	@GetMapping("stadium-info/{id}")
	public String updateInfo(@PathVariable int id, ModelMap modelMap) {
		List<PitchInfoDto> pitchInfodtos = pitchService.getListPitchInfo();
		List<PitchInfoDto> pitches = getPitches(pitchInfodtos);

		// Thông tin sân bóng theo pid
		PitchInfoDto stadium = getPitchByPId(pitches, id);
		
		modelMap.addAttribute("stadium", stadium);
		return "stadium.update.info";
	}
	
	@PostMapping("update-info")
	public String updateInfo(@ModelAttribute("pitch") Pitch pitch, @ModelAttribute("address") Address address) {
		// System.err.println("Pitch Id: " + pitch.getId());
		pitch.setAddresses(Sets.newHashSet(address));
		if (pitchService.updatePitch(pitch) > 0 ) {
			return "redirect:/stadium/management?msg=updates";
		}
		return "redirect:/stadium/management?msg=updatef";
	}
	
	/** Update thông tin người thuê sân */
	@PostMapping("saveBooking")
	@ResponseBody
	public String saveBooking(@RequestParam int id, @RequestParam String phoneNumber, @RequestParam String customerName, @RequestParam String note) {
		System.out.println("===========================================");
		StadiumDetailStatus detailStatus = new StadiumDetailStatus();
		detailStatus.setId(id); detailStatus.setCustomerName(customerName); detailStatus.setPhoneNumber(phoneNumber); detailStatus.setNote(note);
		
		if (stadiumDetailStatusService.saveBooking(detailStatus) > 0) {
			return "success";
		}
		return "";
	}
	
	/** Admin - đặt sân */
	@PostMapping("saveBookingNew")
	@ResponseBody
	public String saveBookingNew(@ModelAttribute StadiumDetailStatus stadiumDS, @RequestParam int pitchId, @RequestParam int pitchTypeId, HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("sessionUserInfo");
		
		if (user == null) {
			return "redirect:/";
		}
		
		stadiumDS.setUser(user);
		stadiumDS.setCreatedAt(DataStaticModel.getCurrentTimetoSecond());
		stadiumDS.setStatus(1);
		stadiumDS.setMatchDateTime(calMatchDateTime(stadiumDS.getMatchDay(), stadiumDS.getMatchTime()));
		
		
		PitchDetail pitchDetail = pitchDetailService.getPitchByPTypeAndPId(pitchTypeId, pitchId);
		
		int wdayf = getMatchDayInteger(stadiumDS.getMatchDay());
		int hourf = stadiumDS.getMatchTime();
		
		// matchTime [hourStart:hourEnd] - matchDay [wdayStart: wdayEnd]
		List<Cost> costs = costService.getCost(pitchDetail.getId(), hourf, wdayf);
		if (costs.size() > 0) {
			stadiumDS.setCost(costs.get(0));
		} else {
			// Thực hiện thất bại => Ko tìm thấy cost => Do nhập liệu k hợp lệ
			return "fail";
		}
		/*
		System.out.println(stadiumDS.toString() + "\npitch_detail_id" +
				pitchDetail.getId() + "\nNgày đá: " + 
				wdayf + "\nGiờ đá: " + 
				hourf + "\nCost=> " + 
				costs.size() + ":" + costs.get(0).getId());
		*/
		
		if (stadiumDetailStatusService.saveStadiumDetailStatus(stadiumDS) > 0) {
			return "success";
		}
		return "fail";
	}
	
	private int getMatchDayInteger(String matchDay) {
		String [] arrs = matchDay.split("/");
		return TagLibFunctions.getDayOfWeekInteger(parseInt(arrs[2]), parseInt(arrs[1]), parseInt(arrs[0]));
	}
	
	private String calMatchDateTime(String matchDay, int matchTime) {
		return DataStaticModel.HOUR_LESS_THAN_10.get(matchTime) + " - " + DataStaticModel.HOUR_LESS_THAN_10.get(matchTime+1) + " ngày " + matchDay;
	}
	
	@GetMapping("del/{id}")
	public String delete(@PathVariable("id") int stadiumId, HttpServletRequest request) {
		String coverAvatar = pitchService.getPitchByID(stadiumId).getCoverAvatar();
		if(pitchService.delById(stadiumId) > 0) {
			if (!"".equals(coverAvatar)) {
				File file = new File(request.getServletContext().getRealPath(DataStaticModel.UPLOAD_FILE_DIRECTORY) + File.separator + coverAvatar);
				if(file.exists()) {
					file.delete();
				}
			}
			return "redirect:/stadium/management?msg=dels";
		}
		return "redirect:/stadium/management?msg=delf";
	}
	@GetMapping("updateStatus")
	@ResponseBody
	public String updateStadiumStatus(@RequestParam int stadiumId, @RequestParam int status) {
		if (pitchService.updateStatus(stadiumId, status) > 0 ) {
			return "true";
		}
		return "false";
	}
	
	@GetMapping("bookingManager/{id}")
	public String booking(@PathVariable("id") int stadiumId, HttpSession httpSession, ModelMap modelMap) {
		/** Trang đặt sân => tab thứ 3*/
		if (httpSession.getAttribute("sessionUserInfo") == null ){
			return "redirect:/";
		}
		List<BookingManagerDto> bookingManagerDtos = stadiumDetailStatusService.getStadiumBookingManagers(stadiumId);
		Map<Integer, Integer> loaiSanVsSoLuongMap = new HashMap<>();
		for (BookingManagerDto dto: bookingManagerDtos) {
			loaiSanVsSoLuongMap.put(dto.getPitchType(), dto.getQuantity());
		}
		
		/*
		for (Entry<Integer, Integer> map: loaiSanVsSoLuongMap.entrySet()) {
			System.out.println("map: " + map.getKey() + ", " + map.getValue());
			for (int i = 1 ; i <= map.getValue() ; i++) {
				System.out.println("Sân " + map.getKey() + " So  " + i);
			}
		}
		*/
		
		// Get pid, hourStart, hourEnd
		if (bookingManagerDtos.size() > 0) {
			modelMap.addAttribute("bookingManagerDto", bookingManagerDtos.get(0));
		}
		
		modelMap.addAttribute("stadiumId", stadiumId);
		
		modelMap.addAttribute("loaiSanVsSoLuongMap", loaiSanVsSoLuongMap);
		
		
		// GET CÁC stadium_detail_status với status = 1 và bởi pitchId
		List<StadiumDetailStatus> stadiumDetailStatusList = stadiumDetailStatusService.getListStadiumDetailStatusByMatchDayAndPitchId("04/06/2018",stadiumId);
		
		modelMap.addAttribute("stadiumDetailStatusList", stadiumDetailStatusList);
		// Có hết trong này nè : Hihi
		
		// System.out.println("SZZZ: " + stadiumDetailStatusList.get(0).toString());
		
		/*
		for (int hourStep = bookingManagerDtos.get(0).getHourStart() ; hourStep < bookingManagerDtos.get(0).getHourEnd() ; hourStep++ ) {
			for (Entry<Integer, Integer> map: loaiSanVsSoLuongMap.entrySet()) {
				for (int i = 1 ; i <= map.getValue() ; i++) {
					System.out.println("minipitch-" + hourStep + "-" + map.getKey() + "-" +i);
					StadiumDetailStatus ooop = isBooking(stadiumDetailStatusList, hourStep, map.getKey(), i);
					if (ooop != null) {
						System.out.println(ooop.getPhoneNumber() +", " + ooop.getCustomerName() + ", " + ooop.getNote());
					} else {
						System.out.println("Còn trống");
					}
				}
			}
		}
		*/
		return "stadium.booking";
	}
	
	// Tìm kiếm theo ngày
	@GetMapping("bookingManager/{pitchid}/{matchday}")
	public String chooseTheMatchDay(@PathVariable int pitchid, @PathVariable String matchday, HttpSession httpSession, ModelMap modelMap) {
		System.out.println("VAO DAY: " + pitchid + ", " + matchday);
		/** Trang đặt sân => tab thứ 3*/
		if (httpSession.getAttribute("sessionUserInfo") == null ){
			return "redirect:/";
		}
		List<BookingManagerDto> bookingManagerDtos = stadiumDetailStatusService.getStadiumBookingManagers(pitchid);
		Map<Integer, Integer> loaiSanVsSoLuongMap = new HashMap<>();
		for (BookingManagerDto dto: bookingManagerDtos) {
			loaiSanVsSoLuongMap.put(dto.getPitchType(), dto.getQuantity());
		}
		
		// Get pid, hourStart, hourEnd
		modelMap.addAttribute("bookingManagerDto", bookingManagerDtos.get(0));
		modelMap.addAttribute("loaiSanVsSoLuongMap", loaiSanVsSoLuongMap);
		
		
		
		matchday = matchday.replaceAll("_", "/");
		modelMap.addAttribute("matchDayUrl", matchday);
		
		// Thứ Hai ngày 4/06/2017
		System.out.println("match day: " + matchday);
		String matchDayThuNgay = getMatchDayThuNgay(matchday) + " ngày " + matchday;
		modelMap.addAttribute("matchDayThuNgay", matchDayThuNgay);
		 
		// GET CÁC stadium_detail_status với status = 1 và bởi pitchId
		List<StadiumDetailStatus> stadiumDetailStatusList = stadiumDetailStatusService.getListStadiumDetailStatusByMatchDayAndPitchId(matchday,pitchid);
		modelMap.addAttribute("stadiumDetailStatusList", stadiumDetailStatusList);
		
		return "stadium.booking";
	}
	
	private String getMatchDayThuNgay(String matchDay) {
		String [] arrs = matchDay.split("/");
		return TagLibFunctions.getDayOfWeek(parseInt(arrs[2]), parseInt(arrs[1]), parseInt(arrs[0]));
	}
	
	
	@GetMapping("booking")
	public String bookingRequest(HttpSession httpSession, ModelMap modelMap) {
		/** Xử lý yêu cầu đặt sân => tab thứ 1*/
		if (httpSession.getAttribute("sessionUserInfo") == null ){
			return "redirect:/";
		}
		User sessionUserInfo = (User)httpSession.getAttribute("sessionUserInfo");
		List<StadiumDetailStatus> stadiumDetailStatusList = stadiumDetailStatusService.getListStadiumDetailStatusByUserIdAndStatus(sessionUserInfo.getId());
		for (StadiumDetailStatus status: stadiumDetailStatusList) {
			System.err.println(status.getCost().getPitchDetail().getPitch().getName() + " - " + status.getCost().getPitchDetail().getPitchType().getId()
					+ ", " + status.getCustomerName() + "-" + status.getPhoneNumber()
					+ ", " + status.getMatchDateTime()
					+ ", " + status.getNote() + ", " + status.getId() + ", " + status.getCreatedAt()
					);
		}
		modelMap.addAttribute("stadiumDetailStatusList", stadiumDetailStatusList);
		return "stadium.booking.request";
	}
	
	@GetMapping("booking/approve/{id}")
	@ResponseBody
	public String approve(@PathVariable int id) {
		if (stadiumDetailStatusService.approveBoookingRequest(id) > 0){
			return "success";
		}
		return "";
	}
	
	@GetMapping("booking/reject/{id}")
	@ResponseBody
	public String reject(@PathVariable int id) {
		if (stadiumDetailStatusService.rejectBoookingRequest(id) > 0){
			return "success";
		}
		return "";
	}
	
	/** Nếu giờ này, loại sân này, sân thứ pos này tồn tại trong table stadiumDetailStatusList => Bận => Đã được đặt*/
	public StadiumDetailStatus isBooking(List<StadiumDetailStatus> stadiumDetailStatusList, int hourStep, int pitchType, int position ) {
		for (StadiumDetailStatus detailStatus: stadiumDetailStatusList) {
			if (hourStep == detailStatus.getMatchTime() 
					&& pitchType == detailStatus.getCost().getPitchDetail().getPitchType().getId()
					&& position == detailStatus.getPosition()) {
				return detailStatus;
			}
		}
		return null;
	}
	
	public void insertCostControl(int pdtailId, int soBangGiaItem, String[] cost_hour_start_item, String[] cost_hour_end_item, String[] fromDaytoDay_item, String[] price_item) {
		for(int i = 0 ; i < (soBangGiaItem-2) ; i++) {
			Cost cost = new Cost(0, parseInt(cost_hour_start_item[i]), parseInt(cost_hour_end_item[i]), parseInt(String.valueOf(fromDaytoDay_item[i].charAt(0))), parseInt(String.valueOf(fromDaytoDay_item[i].charAt(2))), parseInt(price_item[i]));
			
			PitchDetail detail = new PitchDetail();
			detail.setId(pdtailId);
			cost.setPitchDetail(detail);
			
			costService.insertCost(cost);
			
		}
	}
	
	public void initialPitch(Pitch pitch, User sessionUserInfo) {
		pitch.setStatus(1);
		pitch.setHourStart(5);
		pitch.setHourEnd(22);
		pitch.setAverageRating(4f);
		pitch.setTimeAutoReject(null);
		pitch.setCreatedAt(DataStaticModel.getCurrentTimetoSecond());
		pitch.setUpdatedAt(DataStaticModel.getCurrentTimetoSecond());
		pitch.setUser(sessionUserInfo);
		
	}
	
	public void initialAddress(Pitch pitch, Integer dzipcode, Address address, int pid) {
		address.setCreatedAt(DataStaticModel.getCurrentTimetoSecond());
		address.setUpdatedAt(DataStaticModel.getCurrentTimetoSecond());
		
		District district = new District();
		district.setZipcode(dzipcode);
		
		address.setDistrict(district);
		
		pitch.setId(pid);
		address.setPitch(pitch);
		
		System.out.println(address.toString());
		
	}
	
	public PitchDetail getPitchDetail(int pitchTypeId, int pitchId, int quantity) {
		Pitch pitch = new Pitch();
		pitch.setId(pitchId);
		
		PitchType type = new PitchType();
		type.setId(pitchTypeId);
		
		return new PitchDetail(0, type, pitch, quantity);
	}
	
	public int parseInt(String input) {
		return Integer.parseInt(input);
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
}
