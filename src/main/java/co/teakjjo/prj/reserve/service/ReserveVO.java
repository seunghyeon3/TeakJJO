package co.teakjjo.prj.reserve.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReserveVO {
	
	private String member_id;
	private String movie_id;
	private String movie_date; //상영일
	private String reservation_date; //예약날짜
	private int reservation_no;
	private String movie_grade;
	private String reservation_seat;
	private String theater_no;

}
