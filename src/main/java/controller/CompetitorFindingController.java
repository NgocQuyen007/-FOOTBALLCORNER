package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class CompetitorFindingController {

	/**
	 *  Tìm đội đá bóng sân 5, 7 người - "Tìm đội - index"
	 */
	@GetMapping("tim-doi-da-bong")
	public String index() {
		return "compf.index";
	}

	/**
	 * Tìm đội bóng tại quận của mình "Tìm đội - đội đang chờ"
	 */
	@GetMapping("tim-doi-bong-tai-quan-x")
	public String teams() {
		return "compf.waiting";
	}

	/**
	 * Danh sách các teams ở đà nẵng "Tìm đội - danh sách đội bóng"
	 */
	@GetMapping("doi-bong-tai-da-nang")
	public String waiting() {
		return "compf.teams";
	}

}
