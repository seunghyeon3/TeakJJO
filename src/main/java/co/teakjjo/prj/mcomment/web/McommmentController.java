package co.teakjjo.prj.mcomment.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.teakjjo.prj.mcomment.service.MCommentService;
import co.teakjjo.prj.mcomment.service.MCommentVO;
import co.teakjjo.prj.member.service.MemberVO;

@Controller
public class McommmentController {
	
	@Autowired
	private MCommentService mcommentDao;
	
	@ResponseBody
	@RequestMapping("/insertComment.do")
	public List<MCommentVO> insertComment(@RequestParam("comment") String mc_content, @RequestParam("movieName") String movid_id , HttpSession session){
		System.out.println("요기요");
		System.out.println(mc_content);
		System.out.println(movid_id);
		
		String responsbody=null;
		MCommentVO comment = new MCommentVO();
		MemberVO member = (MemberVO) session.getAttribute("memberinfo");
		comment.setMember_id(member.getMember_Id());
		comment.setMovie_id(movid_id);
		comment.setMc_content(mc_content);
		comment.setMc_id(0);
	
		mcommentDao.mCommentInsert(comment);
		//return mcommentDao.select~~~~
		return mcommentDao.mCommentList(movid_id);
	}
	
	@ResponseBody
	@RequestMapping("/deleteComment.do")
	public List<MCommentVO> deleteComment(@RequestParam("movieNm") int mc_id, @RequestParam("movieName") String movid_id, MCommentVO comment) {
		
		comment.setMc_id(mc_id);
		comment.setMovie_id(movid_id);
		mcommentDao.mCommentDelete(comment);
		return mcommentDao.mCommentList(movid_id);
	}
	
	@ResponseBody
	@RequestMapping("/listComment.do")
	public List<MCommentVO> listComment(@RequestParam("movieName") String movid_id){
		
		return mcommentDao.mCommentList(movid_id);
	}
	
}
