<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	내장 객체 (기본 객체)
	jsp ======= servlet
		  실행	   |
		  		 생성되는 객체
	1) request
	2) response
	3) application
		서버 관리
		= ServletContext
		= 서버 정보 / 로그 정보 / 자원 정보
								=> 파일, 이미지 ....
		서버
		 getServerInfo() : 서버 일기
		 버전 관리 => 서블릿 버전
		 getmajorVersion()
		 getMinorVersion() 
		 1.8 / 1.9 .....
		 - -
		로그
		 log => web.xml => 로그 파일
		자원
		 getRealPath
		
	(중요)4) out
	5) pageContext
	6) session
	7) exception : try~catch
	8) page : this
	9) config web.xml등록
	
	=> session vs cookie
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>서버 정보</h1>
	서버 : <%= application.getServerInfo() %>
	버전 : <%= application.getMajorVersion() %>
	부버전 : <%= application.getMinorVersion() %>
	
	<h1>자원 정보</h1>
	실제 경로 : <%=application.getRealPath("/") %>
	
	<h1>로그 정보</h1>
	<% 
		String driver=application.getInitParameter("driver");
		String url=application.getInitParameter("url");
		String username=application.getInitParameter("username");
		String password=application.getInitParameter("password");
			
		application.log("driver : " + driver);
		application.log("url : " + url);
		application.log("username : " + username);
		application.log("password : " + password);
	%>
</body>
</html>