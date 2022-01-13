package co.teakjjo.prj.movie.service;

import java.util.List;

public interface MovieService {

	List<MovieVO> movieList();
	MovieVO movieSelect(MovieVO movie); 
	int movieInsert(MovieVO movie); 
	int movieDelete(MovieVO movie);
	int movieUpdate(MovieVO movie);
	
}
