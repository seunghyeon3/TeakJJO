package co.teakjjo.prj.news.service;

import java.sql.Date;

import lombok.Data;

@Data
public class NewsVO {
//newsboard_id 만들때 member_company+newsboard_title
	private String member_id;
	private String member_name;
	private String newsboard_id;
	private String member_company;
	private String newsboard_title;
	private String newsboard_content;
	private Date newsboard_date;
	private int newsboard_hit;
	private String newsboard_pfile;
	private String newsboard_picture;
	
}
