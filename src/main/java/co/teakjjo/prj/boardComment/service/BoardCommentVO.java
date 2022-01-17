package co.teakjjo.prj.boardComment.service;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardCommentVO {
	private int newsboard_id;
	private String member_id;
	private String member_name;
	private int boardcomment_id; 
	private String boardcomment_content;
	private Date boardcomment_date;
	private int boardcomment_report;
	
	
}
