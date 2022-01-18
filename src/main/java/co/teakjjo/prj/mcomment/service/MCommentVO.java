package co.teakjjo.prj.mcomment.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MCommentVO {
	
	private String member_id;//작성자
	private String movie_id;
	private int mc_id;
	private String mc_content;
	private Date mc_date;//날짜
	
}
