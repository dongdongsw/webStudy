package com.sist.vo;

import java.util.Date;
import lombok.Data;

@Data
// JSP => Bean , Mybatis => DTO , Spring => VO
// JavaScript => Object => {키:값....}
public class EmpVO {

	private int empno, mgr, sal, comm, deptno;
	private String ename,job, dbday;
	private Date hiredate;
}
