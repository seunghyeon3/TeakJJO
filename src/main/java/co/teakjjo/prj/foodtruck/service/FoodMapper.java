package co.teakjjo.prj.foodtruck.service;

import java.util.List;

public interface FoodMapper {
	//즐겨찾기 리스트
	List<FoodBookMarkVO> foodSelectList(FoodBookMarkVO foodMark);
	
	//즐겨찾기 단건
	FoodBookMarkVO foodSelect(FoodBookMarkVO foodMark);
	
	//즐겨찾기 추가
	int foodInsert(FoodBookMarkVO foodMark);
	
	//즐겨찾기 삭제
	int foodDelete(FoodBookMarkVO foodMark);
	
	//최근검색 목록
	List<FoodBookMarkVO> rsrList(FoodBookMarkVO foodMark);
	
	//즐겨찾기 전체 개수
	int foodSelectListCnt(FoodBookMarkVO foodMark);
}
