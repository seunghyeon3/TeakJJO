package co.teakjjo.prj.foodtruck.service;


import co.teakjjo.prj.paging.service.PagingVO;
import lombok.Data;

@Data
public class FoodBookMarkVO {
	public String bookmark_id;
	public String member_id;
	public String foodtruck_rsr;
	public String bookmark_date;
	public String lat;
	public String lng;
	public int start;
	public int end;
	public PagingVO vo;
}
