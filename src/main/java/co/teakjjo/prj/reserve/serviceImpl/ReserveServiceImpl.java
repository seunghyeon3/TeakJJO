package co.teakjjo.prj.reserve.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.teakjjo.prj.reserve.service.ReserveMapper;
import co.teakjjo.prj.reserve.service.ReserveService;
import co.teakjjo.prj.reserve.service.ReserveVO;

@Repository("reserveDao")
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private ReserveMapper map;
	
	@Override
	public boolean Reserve(ReserveVO reserve) {
		
		return map.Reserve(reserve);
	}

	@Override
	public List<ReserveVO> getReserve(ReserveVO reserve) {
		List<ReserveVO> list = new ArrayList<ReserveVO>();
		list = map.getReserve(reserve);
		return list;
	}

	@Override
	public List<ReserveVO> getReserveMember(ReserveVO reserve) {
		return map.getReserveMember(reserve);
	}
	


}
