package co.teakjjo.prj.searchKeyword.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.teakjjo.prj.searchKeyword.service.SearchKeywordService;
import co.teakjjo.prj.searchKeyword.service.SearchKeywordVO;

@Repository("SearchKeywordDao")
public class SearchKeywordImpl implements SearchKeywordService {

	@Override
	public void insertKeyword() {
		// TODO Auto-generated method stub

	}

	@Override
	public List<SearchKeywordVO> getKeyword(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHit() {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean keywordCheck() {
		// TODO Auto-generated method stub
		return false;
	}

}
