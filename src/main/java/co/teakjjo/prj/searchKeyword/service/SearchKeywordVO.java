package co.teakjjo.prj.searchKeyword.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchKeywordVO {
	
	private String member_Id;
	private String searchKeyword;
	private String searchHit;
}
