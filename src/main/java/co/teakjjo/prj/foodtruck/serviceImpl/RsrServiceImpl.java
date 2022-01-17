package co.teakjjo.prj.foodtruck.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.teakjjo.prj.foodtruck.service.RsrMapper;
import co.teakjjo.prj.foodtruck.service.RsrService;
import co.teakjjo.prj.foodtruck.service.RsrVO;

@Repository("rsrDao")
public class RsrServiceImpl implements RsrService {
	
	@Autowired
	private RsrMapper map;
	
	@Override
	public List<RsrVO> rsrSelectList(RsrVO rsr) {
		return map.rsrSelectList(rsr);
	}

	@Override
	public int rsrInsert(RsrVO rsr) {
		return map.rsrInsert(rsr);
	}

	@Override
	public int rsrDelete(RsrVO rsr) {
		return map.rsrDelete(rsr);
	}

}
