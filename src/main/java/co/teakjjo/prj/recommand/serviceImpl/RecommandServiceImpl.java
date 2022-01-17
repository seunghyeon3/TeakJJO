package co.teakjjo.prj.recommand.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.teakjjo.prj.recommand.service.RecommandMapper;
import co.teakjjo.prj.recommand.service.RecommandService;
import co.teakjjo.prj.recommand.service.RecommandVO;

@Repository("recommandDao")
public class RecommandServiceImpl implements RecommandService{

	@Autowired
	private RecommandMapper map;
	
	@Override
	public Integer recommandSum(int newsboard_id) {
		return map.recommandSum(newsboard_id);
	}

	@Override
	public int recommandInsert(RecommandVO recommand) {
		return map.recommandInsert(recommand);
	}

	@Override
	public int recommandDelete(RecommandVO recommand) {
		return map.recommandDelete(recommand);
	}

	@Override
	public Integer recommandCheck(RecommandVO recommand) {
		return map.recommandCheck(recommand);
	}

}
