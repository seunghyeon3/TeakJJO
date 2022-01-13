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
		this.movieAge = movieAge;
		this.movieTitle = movieTitle;
		this.movieOpenDate = movieOpenDate;
		this.seq = seq;
	}
	String rank;
	String movieAge;
	String movieTitle;
	String movieOpenDate; //개봉일
	int seq;

}
