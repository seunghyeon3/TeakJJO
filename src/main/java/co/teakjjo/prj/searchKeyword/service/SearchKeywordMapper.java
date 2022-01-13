package co.teakjjo.prj.searchKeyword.service;

import java.util.List;

public interface SearchKeywordMapper {
	// insert
	public void insertKeyword();
	// getkeyword
	public List<SearchKeywordVO> getKeyword(String id);
	
	public void updateHit();
	
	public boolean keywordCheck();
	

}
