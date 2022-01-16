package co.teakjjo.prj.boardComment.service;

import java.util.List;

public interface BoardCommentService {

	List<BoardCommentVO> boardCommentList(int newsboard_id);
	int boardCommentInsert(BoardCommentVO boardcomment);
	int boardCommentDelete(int boardcomment_id);
	int boardCommentUpdate (BoardCommentVO boardcomment);
}
