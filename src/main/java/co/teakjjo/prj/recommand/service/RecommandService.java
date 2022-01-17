package co.teakjjo.prj.recommand.service;

public interface RecommandService {
	
	//게시판마다 각자 추천수 총합 뿌리기
	Integer recommandSum(int newsboard_id);
	//회원 추천 여부
	Integer recommandCheck(RecommandVO recommand);
	int recommandInsert(RecommandVO recommand);
	int recommandDelete(RecommandVO recommand);
	
	
}
