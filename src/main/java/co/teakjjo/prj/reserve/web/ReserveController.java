package co.teakjjo.prj.reserve.web;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.teakjjo.prj.member.service.MemberVO;
import co.teakjjo.prj.reserve.service.ReserveService;
import co.teakjjo.prj.reserve.service.ReserveVO;

@Controller
public class ReserveController {

	@Autowired
	ReserveService reserveService;

	@RequestMapping("/reserve.do")
	public String reserve() {

		return "movie/reserve";
	}

	@RequestMapping("/seat.do")
	public String seat() {
		return "movie/seat";
	}

	private static Logger logger = LoggerFactory.getLogger(ReserveController.class);

	@RequestMapping(value = "reserve.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String moveReserve() {
		logger.info("moveReserve");
		return "movie/reserve";
	}

	@RequestMapping(value = "seat.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String moveSeat(Model model, ReserveVO reserve) {

		System.out.println(reserve.toString());
		logger.info("moveSeat");
		model.addAttribute("reserve", reserve);

		return "movie/seat";
	}

	@RequestMapping(value = "kakao.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Kakao(Model model, ReserveVO reserve, HttpSession session) {
		System.out.println(reserve.toString());
		logger.info("movieKakao");

		return "movie/kakao";
	}

	@RequestMapping(value = "movieList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Kakao() {
		logger.info("movieKakaooooo");

		return "movie/moviePage";
	}
}
