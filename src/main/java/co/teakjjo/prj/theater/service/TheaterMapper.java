package co.teakjjo.prj.theater.service;

import java.util.List;

public interface TheaterMapper {

	List<TheaterVO> theaterList();
	TheaterVO theaterSelect(TheaterVO theater); 
	int theaterInsert(TheaterVO theater); 
	int theaterDelete(TheaterVO theater);
	int theaterUpdate(TheaterVO theater);
}
