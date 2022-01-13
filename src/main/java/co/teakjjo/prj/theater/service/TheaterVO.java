package co.teakjjo.prj.theater.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TheaterVO {

	private String movieTable;
	private String theater_no;
	private String theater_time;
	private String theater_seat;

	public TheaterVO(String movieTable, String theater_no, String theater_time, String theater_seat) {
		
		this.movieTable = movieTable;
		this.theater_no = theater_no;
		this.theater_time = theater_time;
		this.theater_seat = theater_seat;
	}

	public TheaterVO() {
		
	}
	
}
