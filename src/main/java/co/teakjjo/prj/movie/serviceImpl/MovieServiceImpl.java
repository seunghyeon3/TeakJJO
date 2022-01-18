package co.teakjjo.prj.movie.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.teakjjo.prj.movie.service.MovieMapper;
import co.teakjjo.prj.movie.service.MovieService;
import co.teakjjo.prj.movie.service.MovieVO;


@Repository("movieDao")
public class MovieServiceImpl implements MovieService {

	@Autowired
	private MovieMapper map;
	
	@Override
	public List<MovieVO> movieList() {
		
		return map.movieList();
	}

	@Override
	public MovieVO movieSelect(MovieVO movie) {
		
		return map.movieSelect(movie);
	}

	@Override
	public int movieInsert(MovieVO movie) {
	
		return map.movieInsert(movie);
	}

	@Override
	public int movieDelete(MovieVO movie) {
		
		return map.movieDelete(movie);
	}

	@Override
	public int movieUpdate(MovieVO movie) {
		
		return map.movieUpdate(movie);
	}

}
