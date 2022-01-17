package co.teakjjo.prj.urlmark.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.teakjjo.prj.member.service.MemberVO;
import co.teakjjo.prj.urlmark.service.UrlMarkService;
import co.teakjjo.prj.urlmark.service.UrlMarkVO;

@Controller
public class UrlMarkController {

	@Autowired
	private UrlMarkService urlmarkDao;
	
	@RequestMapping("/insertUrl.do")
	@ResponseBody
	public void insertUrl(@RequestParam("url") String url, @RequestParam("urlname")String urlname, HttpSession session) {
		
		UrlMarkVO vo = new UrlMarkVO();
		MemberVO mvo = (MemberVO)session.getAttribute("memberinfo");
		vo.setMember_Id(mvo.getMember_Id());
		vo.setUrlMark(urlname);
		vo.setUrlMarkName(url);
		System.out.println(urlmarkDao.checkKeyword(vo));
		if(!urlmarkDao.checkKeyword(vo)) {
			urlmarkDao.insertUrl(vo);
		}
	}
	@RequestMapping("/getUrl.do")
	@ResponseBody
	public List<UrlMarkVO> getUrl(HttpSession session){
		MemberVO mvo = (MemberVO)session.getAttribute("memberinfo");
		return urlmarkDao.getUrl(mvo.getMember_Id());
	}
}
