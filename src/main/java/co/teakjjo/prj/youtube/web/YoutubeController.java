package co.teakjjo.prj.youtube.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class YoutubeController {

	@RequestMapping("/getYoutube.do")
	@ResponseBody
	public JSONObject getYoutube(@RequestParam("token") String token) {
		System.out.println(token);
		String apiurl = "https://www.googleapis.com/youtube/v3/search";
		apiurl += "?key=AIzaSyA2MQJB8EuzKBJsfO1AZHZ3I4BJcZtF3tM";
		apiurl += "&part=snippet&type=video&maxResults=20&videoEmbeddable=true";
		StringBuffer response = new StringBuffer();
		try {
			apiurl += "&q=" + URLEncoder.encode(token, "UTF-8");
			URL url = new URL(apiurl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");

			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String inputLine;

			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONParser json = new JSONParser();
		JSONObject jobj = new JSONObject();
		try {
			jobj = (JSONObject)json.parse(response.toString());
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return jobj;
	}

}
