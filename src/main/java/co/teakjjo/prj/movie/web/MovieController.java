package co.teakjjo.prj.movie.web;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import co.teakjjo.prj.movie.service.MovieVO;
@Controller
public class MovieController {
	
	@RequestMapping("/movieMain.do")
	public String movie() {
		
		return "movie/movieMain";
	}
	
    @RequestMapping("/searchMovie.do")
	public String movieSearch(@RequestParam("movie") String movie ,Model model) {

		String clientID = "06iFvN0ulG7bHk44C2Xy";
		String clientSecret = "r74Eb9uahq";
		String text = movie;
		String page = "display=10&start=1";
		try {
			text = URLEncoder.encode(text, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}
		String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=" + text;
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientID);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);
		
		System.out.println(responseBody);
		String json = responseBody;
		JSONParser parser = new JSONParser();
		JSONObject obj = new JSONObject();
	    try {
			 obj = (JSONObject)parser.parse(json);
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		model.addAttribute("movie",	responseBody);
	
		return "movie/searchMovie";
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	 private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
   
	private static Logger logger = LoggerFactory.getLogger(MovieController.class);
	@ResponseBody
	@RequestMapping(value = "crawling.do", method = {RequestMethod.GET, RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String getCrawling() {
		logger.info("크롤리잉" + new Date());
		Document doc;
		String gson = "";
		
		try {
		
			 doc = Jsoup.connect("http://www.cgv.co.kr/movies/").get();
			/* Elements */
			 Elements ranks = doc.select(".rank");
	
			 Elements movieAges = doc.select(".ico-grade");
			/* logger.info("ico-grade" + movieAges); */
			 
			 Elements movieTitles = doc.select("div.box-contents strong.title");
			/* logger.info("titles" + movieTitles); */
			 
			 Elements movieOpenDates = doc.select(".txt-info strong");
			/* logger.info("percents" + movieOpenDates); */
			
			 List<MovieVO> list = new ArrayList<MovieVO>();
			 
			 for(int i = 0; i < ranks.size(); i++) {
				
				 String rank = ranks.get(i).text();
				 String movieAge = movieAges.get(i).text();
				 String movieTitle = movieTitles.get(i).text();
				 String movieOpenDate = movieOpenDates.get(i).text();
	
				 int seq = i;
				 MovieVO movieVO = new MovieVO(rank, movieAge, movieTitle, movieOpenDate, seq);
				 
				 list.add(movieVO);
			 }
			 	gson = new Gson().toJson(list);
			 
		} catch (IOException e) {
		
			e.printStackTrace();
		}

		return gson;
	}
}







