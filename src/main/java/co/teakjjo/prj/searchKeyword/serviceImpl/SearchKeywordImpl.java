package co.teakjjo.prj.searchKeyword.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.teakjjo.prj.searchKeyword.service.SearchKeywordMapper;
import co.teakjjo.prj.searchKeyword.service.SearchKeywordService;
import co.teakjjo.prj.searchKeyword.service.SearchKeywordVO;

@Repository("SearchKeywordDao")
public class SearchKeywordImpl implements SearchKeywordService {

	@Autowired
	private SearchKeywordMapper map;
	
	@Override
	public void insertKeyword(SearchKeywordVO vo) {
		map.insertKeyword(vo);

	}

	@Override
	public List<SearchKeywordVO> getKeyword(String id) {
		return map.getKeyword(id);
	}

	@Override
	public void updateHit(SearchKeywordVO vo) {
		map.updateHit(vo);

	}

	@Override
	public boolean keywordCheck(SearchKeywordVO vo) {
		return map.keywordCheck(vo);
	}

	@Override
	public void deleteKeyword(String id) {
		map.deleteKeyword(id);
	}

}
