package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MatchController {
	@GetMapping("match/inviting")
	public String index() {
		return "match.inviting";
	}
}
