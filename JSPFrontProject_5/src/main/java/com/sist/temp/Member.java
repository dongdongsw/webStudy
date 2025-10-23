package com.sist.temp;

import com.sist.controller.RequestMapping;

public class Member {
	@RequestMapping("member_join.do")
	public void membearJoin() {
		System.out.println("Board :  membearJoin() Call...");
	}
	@RequestMapping("member_delete.do")
	public void membearDelete() {
		System.out.println("Board :  membearDelete() Call...");
	}
	@RequestMapping("member_update(.do")
	public void membearUpdate() {
		System.out.println("Board :  membearUpdate() Call...");
	}
}
