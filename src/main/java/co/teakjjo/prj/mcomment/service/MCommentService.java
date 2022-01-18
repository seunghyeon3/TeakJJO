package co.teakjjo.prj.mcomment.service;

import java.util.List;

public interface MCommentService {

	List<MCommentVO> mCommentList(String movie_id);
	String mCommentSelect(MCommentVO comment); 
	int mCommentInsert(MCommentVO comment); 
	int mCommentDelete(MCommentVO comment);
	int mCommentUpdate(MCommentVO comment);
}
