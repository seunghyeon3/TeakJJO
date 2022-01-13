package co.teakjjo.prj.news.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.teakjjo.prj.news.service.NewsService;
import co.teakjjo.prj.news.service.NewsVO;

@Controller
public class NewsController {

	@Autowired
	private NewsService newsDao;
	
	@Autowired
	private String saveDir;	//파일저장 경로를 자동 주입
	
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
		//System.out.println("=================================");
		//System.out.println("최종 뿌리기 " + result.toString());
		model.addAttribute("covid", result.toString());

		return "news/newsMain";
	}
	
	@RequestMapping("/newsInsertForm.do")
	public String newsInsertForm(){
		
		return "news/newsInsertForm";
	}
	
	@RequestMapping("/newsInsert.do")
	@ResponseBody
	public String newsInsert(@RequestParam("file") MultipartFile file, NewsVO news){
		String member_id = "hong";
		String member_name = "홍길동";
		String member_company = "택조일보";
		String newsboard_id = member_company+news.getNewsboard_title();
		news.setMember_id(member_id);
		news.setMember_name(member_name);
		news.setMember_company(member_company);
		news.setNewsboard_id(newsboard_id);
		
		String originalFileName = file.getOriginalFilename();	//원본 파일명 찾기
		if(!originalFileName.isEmpty()) {
			String uid = UUID.randomUUID().toString();	//유니크한 파일명 생성
			//uuil에 파일확장자 추가하여 물리적 파일명을 만듬
			String saveFileName = uid + originalFileName.substring(originalFileName.lastIndexOf("."));
			try {
				file.transferTo(new File(saveDir, saveFileName));
				news.setNewsboard_picture(originalFileName);
				news.setNewsboard_pfile(saveFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		newsDao.newsInsert(news);
		return null;
	}
	
}