package co.teakjjo.prj.mcomment.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.teakjjo.prj.mcomment.service.MCommentMapper;
import co.teakjjo.prj.mcomment.service.MCommentService;
import co.teakjjo.prj.mcomment.service.MCommentVO;

@Repository("mcommentDao")
public class MCommentServiceImpl implements MCommentService {

	@Autowired
	private MCommentMapper map;
	
	@Override
	public List<MCommentVO> mCommentList(String movie_id) {
		
		return map.mCommentList(movie_id);
	}

	@Override
	public String mCommentSelect(MCommentVO comment) {
		
		return map.mCommentSelect(comment);
	}

	@Override
	public int mCommentInsert(MCommentVO comment) {
		
		return map.mCommentInsert(comment);
	}

	@Override
	public int mCommentDelete(MCommentVO comment) {
		
		return map.mCommentDelete(comment);
	}

	@Override
	public int mCommentUpdate(MCommentVO comment) {
		
		return map.mCommentUpdate(comment);
	}

}
