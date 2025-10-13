<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	_jspService(){
		
		out.write("<!DOCTYPE html>");
	 	out.write("<html>");
		out.write("<head>");
		out.write("<meta charset=\"UTF-8\">");
		out.write("<title>Insert title here</title>");
		out.write("</head>");
		out.write("<body>");
		out.write("<h1>Hello JSP</h1>");
		out.write("</body>");
		out.write("</html>");
			
	}
	
	=> JSp는 실행
		메모리에 적재 => 파일 이동 / 새로고침
						메모리 삭제 _jspDestroy()
	
	=> 71page
		_jspInit() => 설정파일(web.xml)
		_jspDestroy() => 메모리 해제 : 자동 호출
		_jspService() => 요청 처리 => 화면 출력 (HTML구현)
		------------ 비워둔다 (JSP를 이용해서 채운다)
		JSP는 메소드 영역에 코딩
		_jspService(){
			--------------
			jsp 파일로 만든다
			--------------
		}
	
 --%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello JSP</h1>
</body>
</html>