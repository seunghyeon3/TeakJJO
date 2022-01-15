package co.teakjjo.prj.news.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.teakjjo.prj.news.service.NewsMapper;
import co.teakjjo.prj.news.service.NewsService;
import co.teakjjo.prj.news.service.NewsVO;

@Repository("newsDao")
public class NewsServiceImpl implements NewsService {

	@Autowired
	private NewsMapper map;
	
	@Override
	public List<NewsVO> newsList() {
		return map.newsList();
	}

	@Override
	public List<NewsVO> newsMyList(String member_id) {
		return map.newsMyList(member_id);
	}

	@Override
	public int newsInsert(NewsVO news) {
		return map.newsInsert(news);
	}

	@Override
	public int newsDelete(NewsVO news) {
		return map.newsDelete(news);
	}

	@Override
	public List<NewsVO> newsGenreList(String newsboard_genre) {
		return map.newsGenreList(newsboard_genre);
	}

	@Override
	public NewsVO newsGenreSearch(String newsboard_title) {
		return map.newsGenreSearch(newsboard_title);
	}

	@Override
	public int newsHitUpdate(String newsboard_title) {
		return map.newsHitUpdate(newsboard_title);
	}

	@Override
	public List<NewsVO> newsTopList() {
		return map.newsTopList();
	}

}
