<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	EL => 내장 객체
	-------------
	param	=> request.getParameter()
	paramValues	=> request.getParameterValues()
	requestScope	=> request.getAttribute()
	sessionScope	=> session.getAttribute()
	applicationScope	=> application.getAttribute()
	%{일반변수(x)}
	EL => VO출력
 --%>
 <%
 	String name = "홍길동";
 	/*
 	request.setAttribute("name", "홍길동");
 	// 한개의 파일안에서만 작업
 	session.setAttribute("name", "심청이"); 
 	// id 비교
 	application.setAttribute("name", "박문수");
 	// 전체에서 공유
 	*/
 	request.setAttribute("name1", "홍길동");
 	session.setAttribute("name2", "심청이"); 
 	application.setAttribute("name3", "박문수");
 	
 	/*
 		${key 이름}
 		=> scope 가 생략이 가능
 			request = session = application
 	
 	
 	*/
 	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
	이름 : ${requestScope.name } <br>
	이름 : ${sessionScope.name } <br>
	이름 : ${applicationScope.name } <br>
	--%>
	이름 : ${name1 } <br>
	이름 : ${name2 } <br>
	이름 : ${name3 } <br>
	
</body>
</html>