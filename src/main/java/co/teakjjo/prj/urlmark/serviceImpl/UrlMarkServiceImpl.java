package co.teakjjo.prj.urlmark.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.teakjjo.prj.urlmark.service.UrlMarkMapper;
import co.teakjjo.prj.urlmark.service.UrlMarkService;
import co.teakjjo.prj.urlmark.service.UrlMarkVO;

@Repository("urlmarkDao")
public class UrlMarkServiceImpl implements UrlMarkService{

	@Autowired
	private UrlMarkMapper map;

	@Override
	public void insertUrl(UrlMarkVO vo) {
		map.insertUrl(vo);
	}

	@Override
	public void deleteUrl(UrlMarkVO vo) {
		map.deleteUrl(vo);
	}

	@Override
	public List<UrlMarkVO> getUrl(String id) {
		return map.getUrl(id);
	}

	@Override
	public boolean checkKeyword(UrlMarkVO vo) {
		return false;
	}
	
}
