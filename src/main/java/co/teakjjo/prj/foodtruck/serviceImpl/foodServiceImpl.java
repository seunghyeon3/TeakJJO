package co.teakjjo.prj.foodtruck.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.teakjjo.prj.foodtruck.service.FoodBookMarkVO;
import co.teakjjo.prj.foodtruck.service.FoodMapper;
import co.teakjjo.prj.foodtruck.service.FoodService;

@Repository("foodBookMarkDao")
public class foodServiceImpl implements FoodService {
	
	@Autowired
	private FoodMapper map;

	@Override
	public List<FoodBookMarkVO> foodSelectList(FoodBookMarkVO foodMark) {
		//System.out.println(map.foodSelectList(foodMark));
		return map.foodSelectList(foodMark);
	}

	@Override
	public int foodInsert(FoodBookMarkVO foodMark) {
		return map.foodInsert(foodMark);
	}

	@Override
	public int foodDelete(FoodBookMarkVO foodMark) {
		return map.foodDelete(foodMark);
	}

	@Override
	public FoodBookMarkVO foodSelect(FoodBookMarkVO foodMark) {
		return map.foodSelect(foodMark);
	}

	@Override
	public List<FoodBookMarkVO> rsrList(FoodBookMarkVO foodMark) {
		return map.rsrList(foodMark);
	}

	@Override
	public int foodSelectListCnt(FoodBookMarkVO foodMark) {
		return map.foodSelectListCnt(foodMark);
	}

	@Override
	public List<FoodBookMarkVO> getFoodList() {
		// TODO Auto-generated method stub
		return map.getFoodList();
	}
	
	

}
