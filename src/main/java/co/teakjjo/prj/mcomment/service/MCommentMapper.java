package co.teakjjo.prj.mcomment.service;

import java.util.List;

public interface MCommentMapper {

	List<MCommentVO> mCommentList();
	MCommentVO mCommentSelect(MCommentVO comment); 
	int mCommentInsert(MCommentVO comment); 
	int mCommentDelete(MCommentVO comment);
	int mCommentUpdate(MCommentVO comment);
}
