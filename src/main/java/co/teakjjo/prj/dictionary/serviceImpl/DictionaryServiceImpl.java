package co.teakjjo.prj.dictionary.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.teakjjo.prj.dictionary.service.DictionaryMapper;
import co.teakjjo.prj.dictionary.service.DictionaryService;
import co.teakjjo.prj.dictionary.service.DictionaryVO;

@Repository("dictionaryDao")
public class DictionaryServiceImpl implements DictionaryService{

	@Autowired
	private DictionaryMapper map;

	@Override
	public List<DictionaryVO> dictionarySelectList(String member_id) {
		return map.dictionarySelectList(member_id);
	}
	

	@Override
	public int dictionaryInsert(DictionaryVO dictionary) {
		return map.dictionaryInsert(dictionary);
	}

	@Override
	public int dictionaryDelete(DictionaryVO dictionary) {
		return map.dictionaryDelete(dictionary);
	}


	@Override
	public List<DictionaryVO> getdictionaryList() {
		return map.getdictionaryList();
	}
	
	
}