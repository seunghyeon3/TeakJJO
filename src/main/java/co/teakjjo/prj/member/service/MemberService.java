package co.teakjjo.prj.member.service;

import java.util.List;

public interface MemberService {

	// insert
	public void insertMember(MemberVO vo);

	// update
	public void updateMember(MemberVO vo);
	
	//update author
	public void updateAuthor(String id);
	// delete
	public void deleteMember(String id);

	// idcheck
	public boolean idCheck(String id);
	
	//select
	public MemberVO getMember(String id);
	
	public List<MemberVO> getMembers();
	
	
}
