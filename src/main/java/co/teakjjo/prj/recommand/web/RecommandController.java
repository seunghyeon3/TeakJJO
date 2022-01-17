package co.teakjjo.prj.recommand.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.teakjjo.prj.member.service.MemberVO;
import co.teakjjo.prj.recommand.service.RecommandService;
import co.teakjjo.prj.recommand.service.RecommandVO;

@Controller
public class RecommandController {

	@Autowired
	private RecommandService recommandDao;

	  @RequestMapping("/recommand.do") 
	  public String recommand(@RequestParam(value = "newsboard_id") int newsboard_id,HttpSession session, RecommandVO recommand, HttpServletRequest request) {
		  MemberVO member = (MemberVO) session.getAttribute("memberinfo");
		  String member_id = member.getMember_Id();
		  recommand.setMember_id(member_id);
		  recommand.setNewsboard_id(newsboard_id);
		  String referer = request.getHeader("Referer");
		  if(recommandDao.recommandCheck(recommand) == null) {
			  int recommand_no = 1;
			  recommand.setRecommand_no(recommand_no);
			  recommandDao.recommandInsert(recommand);
				return "redirect:"+ referer;
		  }else {
			  recommandDao.recommandDelete(recommand);
			  return "redirect:"+ referer;
		  }
	  }
}
