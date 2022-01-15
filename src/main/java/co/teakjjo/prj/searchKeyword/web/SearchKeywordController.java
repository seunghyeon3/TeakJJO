package co.teakjjo.prj.searchKeyword.web;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.teakjjo.prj.member.service.MemberVO;
import co.teakjjo.prj.searchKeyword.service.SearchKeywordService;

@Controller
public class SearchKeywordController {
	
	@Autowired
	private SearchKeywordService SearchKeywordDao;


	@RequestMapping("searchKeyword.do")
	public String searchKeyword(@RequestParam("keywords") String keywords, Model model) {
		try {
			
			//SearchKeywordDao.insertKeyword();
			InputStream is = new URL("https://www.googleapis.com/customsearch/v1?key=AIzaSyA2MQJB8EuzKBJsfO1AZHZ3I4BJcZtF3tM&cx=8e2ffa22a72c27063&q="+keywords).openStream();
			BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
			String jsonText = readAll(rd);
			JSONParser jsonParser = new JSONParser();
			Object obj = jsonParser.parse(jsonText);
			JSONObject jsonobj = (JSONObject) obj;
			model.addAttribute("results", jsonobj);
			model.addAttribute("keyword", keywords);
			return "member/result";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return null;
	}
	
	 private static String readAll(Reader rd)  {
		 StringBuilder sb = new StringBuilder();
		 try {
			    int cp;
			    while ((cp = rd.read()) != -1) {
			      sb.append((char) cp);
			    }
		 }catch (Exception e) {
			 e.printStackTrace();
			 
		 }
		    return sb.toString();
		}
	 

	 @RequestMapping("acckeyword.do")
	 public String acckeyword(@Param("url") String url, HttpSession session,Model model ) {
		 MemberVO vo = (MemberVO)session.getAttribute("memberinfo");
		 model.addAttribute("keywordInfo", SearchKeywordDao.getKeyword(vo.getMember_Id()));

		 int urlLocation = url.indexOf("/prj/");
		 return "redirect:"+ url.substring(urlLocation+5);
	 }
	
	
}
