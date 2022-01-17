package co.teakjjo.prj.boardComment.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.teakjjo.prj.boardComment.service.BoardCommentService;
import co.teakjjo.prj.boardComment.service.BoardCommentVO;
import co.teakjjo.prj.member.service.MemberVO;

@Controller
public class BoardCommentController {
	@Autowired
	private BoardCommentService boardCommentDao;
	
	@RequestMapping("/boardCommentInsert.do")
	public String boardCommentInsert(@RequestParam(value = "comment")String comment,@RequestParam(value = "newsboard_id")int newsboard_id, Model model, BoardCommentVO boardcomment,HttpSession session, HttpServletRequest request) {
		
		MemberVO member = (MemberVO) session.getAttribute("memberinfo");
		String member_name = member.getMember_Name();
		boardcomment.setNewsboard_id(newsboard_id);
		boardcomment.setMember_id(member.getMember_Id());
		boardcomment.setMember_name(member_name);
		//boardcomment.setBoardcomment_id(comment+member_name);
		boardcomment.setBoardcomment_content(comment);
		//System.out.println(boardcomment);
		boardCommentDao.boardCommentInsert(boardcomment);
		//System.out.println(newsboard_title);
		//System.out.println(newsboard_id);
		//String url = "newsDetail.do?no="+newsboard_title+"&newsboard_id="+newsboard_id;
		//return url;
		
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		return "redirect:"+ referer; // 이전 페이지로 리다이렉트
		
	}
	
	@RequestMapping("/boardCommentDelete.do")
	public String boardCommentDelete(@RequestParam(value = "boardComment_id")int boardComment_id, HttpServletRequest request) {
		
		int r = boardCommentDao.boardCommentDelete(boardComment_id);
		System.out.println(r+"건이 삭제 되었습니다");
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer; 
	}
	
	@RequestMapping("/boardCommentUpdate.do")
	public String boardCommentUpdate(BoardCommentVO boardComment, HttpServletRequest request) {
		
		int r = boardCommentDao.boardCommentUpdate(boardComment);
		System.out.println(r+"건이 변경 되었습니다.");
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer; 
	}
}
