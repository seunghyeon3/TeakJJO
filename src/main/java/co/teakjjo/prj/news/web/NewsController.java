package co.teakjjo.prj.news.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.teakjjo.prj.boardComment.service.BoardCommentService;
import co.teakjjo.prj.member.service.MemberVO;
import co.teakjjo.prj.news.service.NewsService;
import co.teakjjo.prj.news.service.NewsVO;

@Controller
public class NewsController {

	@Autowired
	private NewsService newsDao;

	@Autowired
	private BoardCommentService boardCommentDao;

	@Autowired
	private String saveDir; // 파일저장 경로를 자동 주입

	@RequestMapping("/newsMain.do")
	public String newsMain(Model model) {
		StringBuffer result = new StringBuffer();
		try {
			String apiURL = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?serviceKey=9wZz70EsbL6Tch6hyEl8F%2Ff0FbN7MTprqP%2ByKEYVwB18Rqr%2F7XDpPz6hl3Vr1PCGszMdeO8IFAILBMif9OCnqg%3D%3D&stdt=2022";
			URL url = new URL(apiURL);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");

			BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));

			String returnLine;

			while ((returnLine = br.readLine()) != null) {
				result.append(returnLine); //
			}
			// System.out.println("리턴라인"+returnLine);
			urlconnection.disconnect();

		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("=================================");
		// System.out.println("최종 뿌리기 " + result.toString());
		model.addAttribute("covid", result.toString());
		model.addAttribute("newsList", newsDao.newsTopList());
		return "news/newsMain";
	}

	@RequestMapping(value = "/newsGenre.do")
	public String newsAll(@RequestParam(value = "genre") String genre, NewsVO news, Model model) {

		if (genre.equals("전체")) {
			model.addAttribute("newsList", newsDao.newsList());
			return "news/newsAll";
		} else {
			model.addAttribute("newsList", newsDao.newsGenreList(genre));
			model.addAttribute("genre", genre);

			return "news/newsGenre";
		}

	}

	@RequestMapping("/newsInsertForm.do")
	public String newsInsertForm() {
		return "news/newsInsertForm";
	}

	@RequestMapping("/newsInsert.do")
	public String newsInsert(@RequestParam("file") MultipartFile file, NewsVO news, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("memberinfo");
		String member_id = member.getMember_Id();
		String member_name = member.getMember_Name();
		String member_company = member.getMember_Company();
		// String newsboard_id = member_company+news.getNewsboard_title();
		news.setNewsboard_content(news.getNewsboard_content().replace("\r\n", "<br>"));
		// System.out.println(news.getNewsboard_genre());
		news.setMember_id(member_id);
		news.setMember_name(member_name);
		news.setMember_company(member_company);
		// news.setNewsboard_id(newsboard_id);

		String originalFileName = file.getOriginalFilename(); // 원본 파일명 찾기
		if (!originalFileName.isEmpty()) {
			String uid = UUID.randomUUID().toString(); // 유니크한 파일명 생성
			// uuil에 파일확장자 추가하여 물리적 파일명을 만듬
			String saveFileName = uid + originalFileName.substring(originalFileName.lastIndexOf("."));
			try {
				file.transferTo(new File(saveDir, saveFileName));
				news.setNewsboard_picture(originalFileName);
				news.setNewsboard_pfile(saveFileName);
				//news.setNewsboard_id(member_company + news.getNewsboard_pfile());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		newsDao.newsInsert(news);
		return "redirect:newsMain.do";
	}

	// 뉴스 제목누르고 상세조회로 들어가는 친구
	@RequestMapping("/newsDetail.do")
	public String newsDetail(@RequestParam(value = "newsboard_id") int newsboard_id, Model model) {
		// 상세조회로 넘어갈때 조회수를 업데이트.
		// System.out.println("1"+newsboard_title);
		// System.out.println("2"+newsDao.newsGenreSearch(newsboard_title));
		// System.out.println(boardCommentDao.boardCommentList(newsboard_id));
		// System.out.println(newsDao.newsGenreSearch(newsboard_id));
		model.addAttribute("comment", boardCommentDao.boardCommentList(newsboard_id));
		model.addAttribute("detail", newsDao.newsGenreSearch(newsboard_id));
		return "news/newsDetail";
	}

	// 뉴스 제목 온클릭시 function으로 조회수 업데이트 실행
	@RequestMapping("/newsHitUpdate.do")
	public void newsHitUpdate(@RequestParam(value = "newsboard_id") int newsboard_id, NewsVO news) {

		newsDao.newsHitUpdate(newsboard_id);
	}

	@RequestMapping("/newsUpdateForm.do")
	public String newsUpdateForm(@RequestParam(value = "newsboard_id") int newsboard_id, Model model) {
		model.addAttribute("detail", newsDao.newsGenreSearch(newsboard_id));
		System.out.println(newsDao.newsGenreSearch(newsboard_id));
		return "news/newsUpdateForm";
	}

	@RequestMapping("/newsUpdate.do")
	public String newsUpdate(@RequestParam("file") MultipartFile file, NewsVO news, HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("memberinfo");
		String member_id = member.getMember_Id();
		String member_name = member.getMember_Name();
		String member_company = member.getMember_Company();
		news.setNewsboard_content(news.getNewsboard_content().replace("\r\n", "<br>"));
		news.setMember_id(member_id);
		news.setMember_name(member_name);
		news.setMember_company(member_company);
		
		String originalFileName = file.getOriginalFilename(); // 원본 파일명 찾기
		if (!originalFileName.isEmpty()) {
			String uid = UUID.randomUUID().toString(); // 유니크한 파일명 생성
			// uuil에 파일확장자 추가하여 물리적 파일명을 만듬
			String saveFileName = uid + originalFileName.substring(originalFileName.lastIndexOf("."));
			try {
				file.transferTo(new File(saveDir, saveFileName));
				news.setNewsboard_picture(originalFileName);
				news.setNewsboard_pfile(saveFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("변경할 데이터 "+news);
		int r = newsDao.newsUpdate(news);
		System.out.println(r + "건이 변경되었습니다.");
		return "redirect:newsMain.do";
	}

	@RequestMapping("/newsDelete.do")
	public String newsDelete(@RequestParam(value = "newsboard_id") int newsboard_id, NewsVO news) {
		newsDao.newsDelete(newsboard_id);
		return "redirect:newsMain.do";
	}

}