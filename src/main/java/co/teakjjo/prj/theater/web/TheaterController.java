package co.teakjjo.prj.theater.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import co.teakjjo.prj.theater.service.TheaterVO;

@Controller
public class TheaterController {

	private static Logger logger = LoggerFactory.getLogger(TheaterController.class);

	@ResponseBody
	@RequestMapping(value = "timetable.do", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String getTable() {

		logger.info("크롤리잉잉시간표" + new Date());
		String url = "http://www.cgv.co.kr/common/showtimes/iframeMovie.aspx?midx=85549&mcode=&areacode=14&date=20220118";
		Document doc;
		String gson = "";
		try {
			doc = Jsoup.connect(url).get();

			Elements movieTables = doc.select(".col-theater");// 영화관이름
			Elements moviePlaces = doc.select(".info-hall");// 상영관정보,
			Elements movieTimes = doc.select(".info-timetable em");// 시간
			Elements movieSeats = doc.select(".txt-lightblue");// 남은좌석
			
			List<TheaterVO> list = new ArrayList<TheaterVO>();

			for (int i = 0; i < movieTables.size(); i++) {

				String movieTable = movieTables.get(i).text();
				String theater_no = moviePlaces.get(i).text();
				String theater_time = movieTimes.get(i).text();
				String theater_seat = movieSeats.get(i).text();

				TheaterVO theaterVO = new TheaterVO(movieTable, theater_no, theater_time, theater_seat);
				System.out.println(theaterVO.toString());
				list.add(theaterVO);
			}
			gson = new Gson().toJson(list);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return gson;
	}
}
