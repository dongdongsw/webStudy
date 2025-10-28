package com.sist.vo;
/*
 * 1. 데이터베이스 설계(테이블)
 * 2. VO를 제작
 * 3. MyBatis 연동
 * 4. 사용자 요청 => 결과값을 브라우저
 * 	  --------------------------
 * 	  | 화면이 변경없이 => 데이터만 변경
 * 		예약 / 로그인 / 장바구니 / 페이징++++
 * 	  | 화면이 변경
 */

import java.util.*;

import lombok.Data;
@Data
public class ReplyBoardVO {
	private int no, hit, group_id , group_step , group_tab, root, depth;
	private String name, subject, content, pwd, dbday;
	private Date regdate;
}
