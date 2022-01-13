package co.teakjjo.prj.member.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.teakjjo.prj.member.service.MemberMapper;
import co.teakjjo.prj.member.service.MemberService;
import co.teakjjo.prj.member.service.MemberVO;

@Repository("memberDao")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper map;

	@Override
	public void insertMember(MemberVO vo) {
		map.insertMember(vo);
	}

	@Override
	public void updateMember(MemberVO vo) {
		map.updateMember(vo);
	}

	@Override
	public void deleteMember(String id) {
		map.deleteMember(id);
	}

	@Override
	public boolean idCheck(String id) {
		return map.idCheck(id);
	}

	@Override
	public MemberVO getMember(String id) {
		return map.getMember(id);
	}

	@Override
	public void updateAuthor(String id) {
		map.updateAuthor(id);
	}
	
	
}
