package co.teakjjo.prj.dictionary.service;

import java.util.List;

public interface DictionaryService {
	List<DictionaryVO> dictionarySelectList(String member_id);
	int dictionaryInsert(DictionaryVO dictionary);
	int dictionaryDelete(DictionaryVO dictionary);
}