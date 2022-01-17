package co.teakjjo.prj.foodtruck.service;

import java.util.List;

public interface RsrService {
	//푸드트럭 최근검색 리스트 출력
	List<RsrVO> rsrSelectList(RsrVO rsr);
	
	//최근검색 추가
	int rsrInsert(RsrVO rsr);
	
	//최근검색 삭제
	int rsrDelete(RsrVO rsr);
	
	//최근검색 수정(중복검색시 상단표시)
	int rsrUpdate(RsrVO rsr);
}
