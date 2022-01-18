package co.teakjjo.prj.urlmark.service;

import java.util.List;

public interface UrlMarkMapper {
	// insert
	public void insertUrl(UrlMarkVO vo);

	// delete conditin twice
	public void deleteUrl(UrlMarkVO vo);

	// geturl
	public List<UrlMarkVO> getUrl(String id);
	public boolean checkKeyword(UrlMarkVO vo);
	
}
