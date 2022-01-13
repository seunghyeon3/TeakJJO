package co.teakjjo.prj.foodtruck.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.teakjjo.prj.foodtruck.service.FoodBookMarkVO;
import co.teakjjo.prj.foodtruck.service.FoodService;

@Controller
public class FoodtruckController {
	
	@Autowired
	private FoodService foodBookMarkDao;
	
	@RequestMapping("foodtruck.do")
	public String foodtruck() {
		return "foodtruck/foodtruckMain";
	}
	@RequestMapping("foodSearch.do")
	public String foodSearch() {
		return "foodtruck/foodtruckSearch";
	}
	@RequestMapping("/foodSelectList.do")
	public String foodSelectList(Model model) {
		model.addAttribute("foodMark",foodBookMarkDao.foodSelectList());
		return "foodtruck/foodtruckMain";
	}
	
	@PostMapping("/foodInsert.do")
	public int foodMarkInsert(FoodBookMarkVO foodMark) {
		
		int n = foodBookMarkDao.foodInsert(foodMark);
		System.out.println(n);
		return n;
	}
	@PostMapping("/foodDelete.do")
	public int foodMarkDelete(FoodBookMarkVO foodMark) {
		int n = foodBookMarkDao.foodInsert(foodMark);
		System.out.println(n);
		return n;
	}
	
}
