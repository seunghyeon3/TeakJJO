package co.teakjjo.prj.movie.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MovieVO {
	
	public MovieVO(String rank, String movieAge, String movieTitle, String movieOpenDate) {
		this.rank = rank;
		this.movieAge = movieAge;
		this.movieTitle = movieTitle;
		this.movieOpenDate = movieOpenDate;
		
	}
	public MovieVO(String img) {
		this.img = img;
	}
	
	String img;
	String rank;
	String movieAge;
	String movieTitle;
	String movieOpenDate; //개봉일

}
