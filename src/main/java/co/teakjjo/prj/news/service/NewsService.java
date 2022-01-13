package co.teakjjo.prj.news.service;

import java.util.List;


public interface NewsService {
	
	List<NewsVO> newsList();
	List<NewsVO> newsMyList(String member_id);
	int newsInsert(NewsVO news);
	int newsDelete(NewsVO news);
}
