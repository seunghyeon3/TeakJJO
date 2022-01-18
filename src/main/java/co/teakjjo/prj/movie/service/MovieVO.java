package co.teakjjo.prj.movie.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MovieVO {
	
	public MovieVO(String rank, String movieAge, String movieTitle, String movieOpenDate, int seq) {
		this.rank = rank;
		this.movie_grade = movieAge;
		this.movie_title = movieTitle;
		this.movie_open = movieOpenDate;
		this.seq = seq;
	}
	String rank;
	int seq;
	private String movie_id;
	private String movie_title ;
	private String movie_open;
	private String movie_genre ;
	private String movie_nation;
	private String movie_grade ;
	private String movie_person ;
	private String movie_runningtime ;
	private String movie_rating;
	private String movie_pfile ;
	private String movie_picture;
}
