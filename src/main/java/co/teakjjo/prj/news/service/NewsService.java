package co.teakjjo.prj.news.service;

import java.util.List;


public interface NewsService {
	
	List<NewsVO> newsList();
	//조회수 순서대로 리스트셀렉
	List<NewsVO> newsTopList();
	List<NewsVO> newsGenreList(String newsboard_genre);
	NewsVO newsGenreSearch(int newsboard_id);
	List<NewsVO> newsMyList(String member_id);
	int newsInsert(NewsVO news);
	int newsUpdate(NewsVO news);
	int newsDelete(int newsboard_id);
	int newsHitUpdate(int newsboard_id);
	
}
