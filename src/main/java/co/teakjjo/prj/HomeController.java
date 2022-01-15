package co.teakjjo.prj;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	

	@RequestMapping("/home.do")
	public String home(Locale locale, Model model) {
		return "home";
	}

	@RequestMapping("/youtube.do")
	public String youtube() {
		return "youtube/youtube";
	}

	@RequestMapping("/login.do")
	public String login() {
		return "member/login";
	}


	@RequestMapping("/kakaopay.do")
	public String kakaopay() {
		return "member/kakaopay";
	}
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home.do";
	}
	@RequestMapping("/writeEmail.do")
	public String emailForm() {
		return "mail/writeEmail";
	}
	 
	 @RequestMapping("updateInfoForm.do")
	 public String updateInfo() {
		 return "member/updateInfo";
	 }
	 @RequestMapping("resertaionInfo.do")
	 public String resertaionInfo() {
		 return "member/resertaionInfo";
	 }

}
