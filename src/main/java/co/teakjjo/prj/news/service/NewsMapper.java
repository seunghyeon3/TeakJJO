package co.teakjjo.prj.news.service;

import java.util.List;

public interface NewsMapper {
	List<NewsVO> newsList();
	//조회수 순서대로 리스트셀렉
	List<NewsVO> newsTopList();
	List<NewsVO> newsGenreList(String newsboard_genre);
	NewsVO newsGenreSearch(String newsboard_title);
	List<NewsVO> newsMyList(String member_id);
	int newsInsert(NewsVO news);
	int newsDelete(NewsVO news);
	int newsHitUpdate(String newsboard_title);
}
