package co.teakjjo.prj.reserve.service;

import java.util.List;

public interface ReserveMapper {

	public boolean Reserve(ReserveVO reserve);
	public List<ReserveVO> getReserve(ReserveVO reserve);
}
