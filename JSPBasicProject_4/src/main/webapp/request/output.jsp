<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//1. 사용자가 보내준 데이터를 받는다
    	String name = request.getParameter("name");
    	String sex = request.getParameter("sex");
    	String loc = request.getParameter("loc");
    	String content = request.getParameter("content");
    	String[] hobby = request.getParameterValues("hobby");
    	
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : <%= name %><br>
	성별 : <%= sex %><br>
	주소 : <%= loc %><br>
	내용 : <%= content %><br>
	취미 
		<ul>
			<%
				try{
					for(String h:hobby){
			%>
				<li><%=h %></li>
			<%
					}
				}catch(Exception e){
				
			%>
				<li style="color:red">취미가 없습니다</li>
			<%
				}
			%>
		</ul>
		서버IP : <%= request.getServerName() %><br>
		PORT : <%= request.getProtocol() %> <br>
		URL : <%= request.getRequestURL() %><br>
		URI : <%= request.getRequestURI() %> <br>
		ContextPath : <%=request.getContextPath() %> <br>
		사용자 IP : <%= request.getRemoteAddr() %><br>
		전송 방식 : <%= request.getMethod() %> <br>
</body>
</html>