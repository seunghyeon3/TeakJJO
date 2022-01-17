package co.teakjjo.prj.realty.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RealtyController {
	
	@RequestMapping("/getRealty.do")
	@ResponseBody
	public String getRealty() {
		return null;
	}
}
