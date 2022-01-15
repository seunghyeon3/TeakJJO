package co.teakjjo.prj.foodtruck.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.teakjjo.prj.foodtruck.service.FoodBookMarkVO;
import co.teakjjo.prj.foodtruck.service.FoodService;
import co.teakjjo.prj.member.service.MemberVO;
import co.teakjjo.prj.paging.service.PagingVO;

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

	@PostMapping("foodSelectList.do")
	@ResponseBody
	public List<FoodBookMarkVO> foodSelectList(HttpSession session, FoodBookMarkVO foodMark, Model model,
			PagingVO paging) {
		MemberVO member = (MemberVO) session.getAttribute("memberinfo");
		if (member != null) {
			String member_Id = member.getMember_Id();
			foodMark.setMember_id(member_Id);
			System.out.println(member_Id);
			if (paging.getNowPage() == 0) {
				paging.setNowPage(1);
			}
			PagingVO page = new PagingVO(foodBookMarkDao.foodSelectListCnt(foodMark), paging.getNowPage(), 5);
			
			System.out.println(foodBookMarkDao.foodSelectListCnt(foodMark) + "==========================");
			foodMark.setStart(page.getStart());
			foodMark.setEnd(page.getEnd());
			List<FoodBookMarkVO> list = foodBookMarkDao.foodSelectList(foodMark);
			for (FoodBookMarkVO vo : list) {
				vo.setVo(page);
			}
			return list;
			
		}else {
			return null;
		}

	}

	@PostMapping("rsrList.do")
	@ResponseBody
	public List<FoodBookMarkVO> rsrList(HttpSession session, FoodBookMarkVO foodMark, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("memberinfo");
		String member_Id = member.getMember_Id();
		foodMark.setMember_id(member_Id);

		// System.out.println(foodBookMarkDao.rsrList(foodMark));
		return foodBookMarkDao.rsrList(foodMark);

	}

	@PostMapping("foodInsert.do")
	@ResponseBody
	public int foodMarkInsert(@RequestParam(value = "key") String key, @RequestParam(value = "lat") String lat,
			@RequestParam(value = "lng") String lng, HttpSession session, FoodBookMarkVO foodMark) {
		MemberVO member = (MemberVO) session.getAttribute("memberinfo");
		String member_Id = member.getMember_Id();
		String memberrsr = "nam";
		foodMark.setMember_id(member_Id);
		foodMark.setFoodtruck_rsr(memberrsr);
		foodMark.setBookmark_id(key);
		System.out.println(key);
		int n = foodBookMarkDao.foodInsert(foodMark);
		System.out.println(n);
		return n;
	}

	@PostMapping("foodDelete.do")
	@ResponseBody
	public int foodMarkDelete(@RequestParam(value = "key") String key, FoodBookMarkVO foodMark, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("memberinfo");
		String member_Id = member.getMember_Id();
		foodMark.setMember_id(member_Id);
		foodMark.setBookmark_id(key);
		int n = foodBookMarkDao.foodDelete(foodMark);
		System.out.println(n);
		return n;
	}

	@PostMapping("foodSelect.do")
	@ResponseBody
	public FoodBookMarkVO foodMarkSelect(@RequestParam(value = "key") String key, FoodBookMarkVO foodMark,
			HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("memberinfo");
		if (member != null) {
			String member_Id = member.getMember_Id();
			foodMark.setMember_id(member_Id);
			foodMark.setBookmark_id(key);
			return foodBookMarkDao.foodSelect(foodMark);
		}else {
			
			return null;
		}
		
	}

}
