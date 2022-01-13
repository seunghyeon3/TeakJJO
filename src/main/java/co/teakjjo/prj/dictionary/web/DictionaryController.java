package co.teakjjo.prj.dictionary.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.teakjjo.prj.dictionary.service.DictionaryService;
import co.teakjjo.prj.dictionary.service.DictionaryVO;

@Controller
public class DictionaryController {

	@Autowired
	private DictionaryService dictionaryDao;

	@RequestMapping("/dictionaryMain.do")
	public String papagoMain() {
		return "dictionary/dictionaryMain";
	}

	// 최근검색단어 눌렀을때 db에 select후 model로 뿌려주기

	@RequestMapping("/dictionaryRecord.do")
	@ResponseBody
	public List<DictionaryVO> dictionaryRecord(DictionaryVO dictionary, Model model) {
		String member_id = "hong";
		if (dictionary != null) {
			model.addAttribute("message", "성성공");
			return dictionaryDao.dictionarySelectList(member_id);
		} else {
			model.addAttribute("message", "로그인이 필요한 서비스 입니다.");
			System.out.println("실패");
			return null;
		}

	}

	@RequestMapping(value = "/dictionarySearch.do", produces = "application/text;charset=utf8")
	@ResponseBody
	public String dictionarySearch(@RequestParam(value = "word") String word, DictionaryVO dictionary, Model model) {

		 String member_id = "hong"; 
		 dictionary.setMember_id(member_id);
		 dictionary.setDictionary_data(word);
		
		  if (dictionary.getMember_id() != null) {
		  dictionaryDao.dictionaryInsert(dictionary); } else { 
			  // 비회원검색할시 }
		  }
		 

		StringBuffer result = new StringBuffer();
		try {
			String apiURL = "https://stdict.korean.go.kr/api/search.do?"
					+ "key=B6252C758432CC0BB0BD658DD0713EB6&type_search=search&req_type=json&q=" + word;
			URL url = new URL(apiURL);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");

			BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));

			String returnLine;

			while ((returnLine = br.readLine()) != null) {
				result.append(returnLine);
				// System.out.println("리턴라인"+returnLine);
			}
			urlconnection.disconnect();

		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("=================================");
		// System.out.println("최종 뿌리기 "+result.toString());

		return result.toString();

	}

	@RequestMapping(value = "/dictionaryDelete.do")
	@ResponseBody
	public void dictionaryDelete(@RequestParam(value= "dictionary_no") int dictionary_no, DictionaryVO dictionary) {
		String member_id = "hong";
		dictionary.setMember_id(member_id);
		 dictionary.setDictionary_no(dictionary_no);
		dictionaryDao.dictionaryDelete(dictionary);
}
}