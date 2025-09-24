package com.sist.vo;

import java.util.Date;

import lombok.Data;

// Data Transfor Object => vo => Bean...

@Data
public class BoardDTO {
	private int no, hit;
	private String name, subject, content, pwd, Dbday;
	private Date regdate;
}
