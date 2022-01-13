package co.teakjjo.prj.mcomment.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MCommentVO {

	private String movie_id; 
	private String member_id;
	private String mc_id;
	private String mc_content;
	private String mc_date;
	private int mc_report;
}
