<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, com.sist.dao.*"%>
<%
	String cno = request.getParameter("cno");
	if(cno == null){
		cno = "1";
		
	}
	// 메인에서 코딩ㄹ
	MusicDAO dao = MusicDAO.newInstance();
	List<String> list = dao.MusicListData(Integer.parseInt(cno));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>지니 뮤직 Top100</h1>
	<a href="music.jsp?cno=1">Top 100</a>
	<a href="music.jsp?cno=2">가요</a>
	<a href="music.jsp?cno=3">트롯</a>
	<a href="music.jsp?cno=4">OST</a>
	<a href="music.jsp?cno=5">CLASSIC</a>
	<br/><p></p>
	<% int i = 1;
		for(String title : list){
	%>
	
		<%=i %>.<%=title %><br>
		
	<%	i++;
		if(i==50){
	%>
		<hr>
	
	<%		
		}
	}
	%>

</body>
</html>