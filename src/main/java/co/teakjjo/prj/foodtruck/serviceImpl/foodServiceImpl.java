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
	public List<FoodBookMarkVO> foodSelectList() {
		return map.foodSelectList();
	}

	@Override
	public int foodInsert(FoodBookMarkVO foodMark) {
		return map.foodInsert(foodMark);
	}

	@Override
	public int foodDelete(FoodBookMarkVO foodMark) {
		return map.foodDelete(foodMark);
	}

}
