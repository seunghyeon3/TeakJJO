package co.teakjjo.prj.searchKeyword.service;

import java.util.List;

public interface SearchKeywordService {
	
	//insert
	public void insertKeyword(SearchKeywordVO vo);
	//getkeyword
	public List<SearchKeywordVO> getKeyword(String id);

	public void updateHit(SearchKeywordVO vo);
	
	
	public boolean keywordCheck(SearchKeywordVO vo);
	
	public void deleteKeyword(String id);
	
	public List<SearchKeywordVO> getKeywords();
	
}
