package co.teakjjo.prj.searchKeyword.web;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.teakjjo.prj.member.service.MemberVO;
import co.teakjjo.prj.searchKeyword.service.SearchKeywordService;
import co.teakjjo.prj.searchKeyword.service.SearchKeywordVO;

@Controller
public class SearchKeywordController {
	
	@Autowired
	private SearchKeywordService SearchKeywordDao;


	@RequestMapping("searchKeyword.do")
	public String searchKeyword(@RequestParam("keywords") String keywords, Model model,HttpSession session) {
		try {
			
			MemberVO vo =  (MemberVO) session.getAttribute("memberinfo");

			if(vo != null) {
				SearchKeywordVO kvo = new SearchKeywordVO();
				kvo.setMember_Id(vo.getMember_Id());
				kvo.setSearchKeyword(keywords);
				boolean check = SearchKeywordDao.keywordCheck(kvo);
				if(!check) { //하나라도 있을때
				SearchKeywordDao.updateHit(kvo);
				}
				else{ //하나라도 없을떄
				SearchKeywordDao.insertKeyword(kvo);
				}
			}	
			
			//InputStream is = new URL("https://www.googleapis.com/customsearch/v1?key=AIzaSyA2MQJB8EuzKBJsfO1AZHZ3I4BJcZtF3tM&cx=8e2ffa22a72c27063&q="+keywords).openStream();
			InputStream is = new URL("https://www.googleapis.com/customsearch/v1?key=AIzaSyCy9PohIVlqaqecB5SAp49lyzpNpDalcFE&cx=d9174c979d3361eac&q="+keywords).openStream();
			
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
	 @ResponseBody
	 public List<SearchKeywordVO> acckeyword(HttpSession session ) {
		 MemberVO vo = (MemberVO)session.getAttribute("memberinfo");
		 List<SearchKeywordVO> list = SearchKeywordDao.getKeyword(vo.getMember_Id()); 
		 return list;
	 }
	 
	 @RequestMapping("deleteKeyword.do")
	 @ResponseBody
	 public void deleteKeyword(@RequestParam("delKeyword") String delKeyword) {
		 SearchKeywordDao.deleteKeyword(delKeyword);
	 }
	
	
}
