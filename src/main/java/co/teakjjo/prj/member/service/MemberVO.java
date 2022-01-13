package co.teakjjo.prj.member.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	
	private String member_Id;
	private String member_Pw;
	private String member_Name;
	private String member_Age;
	private String member_Tel;
	private String member_Addr;
	private String member_Date;
	private char member_Author;
	private String member_Company;

}
