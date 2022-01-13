package co.teakjjo.prj.foodtruck.service;

import java.util.List;

public interface FoodService {
	//즐겨찾기 리스트
	List<FoodBookMarkVO> foodSelectList();
	
	//즐겨찾기 추가
	int foodInsert(FoodBookMarkVO foodMark);
	
	//즐겨찾기 삭제
	int foodDelete(FoodBookMarkVO foodMark);
}
