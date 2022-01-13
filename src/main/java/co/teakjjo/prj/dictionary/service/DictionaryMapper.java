package co.teakjjo.prj.dictionary.service;

import java.util.List;


public interface DictionaryMapper {
	List<DictionaryVO> dictionarySelectList();
	DictionaryVO dictionarySearch(String id);
	List<DictionaryVO> dictionarySelectList(String member_id);
	int dictionaryInsert(DictionaryVO dictionary);
	int dictionaryDelete(DictionaryVO dictionary);
}
