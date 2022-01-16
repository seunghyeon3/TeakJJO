package co.teakjjo.prj.boardComment.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.teakjjo.prj.boardComment.service.BoardCommentMapper;
import co.teakjjo.prj.boardComment.service.BoardCommentService;
import co.teakjjo.prj.boardComment.service.BoardCommentVO;

@Repository("boardCommentDao")
public class BoardCommentServiceImpl implements BoardCommentService{

	@Autowired
	private BoardCommentMapper map;
	
	@Override
	public List<BoardCommentVO> boardCommentList(int newsboard_id) {
		return map.boardCommentList(newsboard_id);
	}

	@Override
	public int boardCommentInsert(BoardCommentVO boardcomment) {
		return map.boardCommentInsert(boardcomment);
	}

	@Override
	public int boardCommentDelete(int boardcomment_id) {
		return map.boardCommentDelete(boardcomment_id);
	}

	@Override
	public int boardCommentUpdate(BoardCommentVO boardcomment) {
		return map.boardCommentUpdate(boardcomment);
	}

}
