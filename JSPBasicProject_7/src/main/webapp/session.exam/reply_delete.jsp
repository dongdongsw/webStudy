<%@page import="com.sist.dao.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String rno = request.getParameterType("rno");
	String fno = request.getParameterType("fno");
	ReplyDAO.replyDelete(Integer.parseInt(rno));
	response.sendRedirect("food_detail.jsp");

%>