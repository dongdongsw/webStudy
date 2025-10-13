<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sist.vo.*" %>
<%@ page import="com.sist.dao.*" %>


<%
	String empno = request.getParameter("empno");
	EmpVO vo = EmpDAO.empDetailData(Integer.parseInt(empno));
%>
<!-- 
				<tr>
					<td align = "center"><%= vo.getEmpno() %></td>
					<td align = "center">
						<a href="detail.jsp?empno=<%=vo.getEmpno()%>">
							<%= vo.getEname() %>
						</a>
					</td>
					<td align = "center"><%= vo.getJob() %></td>
					<td align = "center"><%= vo.getDbday() %></td>
					<td align = "center"><%= vo.getSal() %></td>
				</tr>

 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="table.css">
<style type="text/css">

.table{
	margin : 0px auto;
}

</style>
</head>
<body>
	<h1><%= vo.getEname()  %>님의 상세 정보</h1>
	<table class="table" width="450">
		<tbody>
			<tr>
				<th>사번</th>
				<td><%= vo.getEmpno() %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%= vo.getEname() %></td>
			</tr>
			<tr>
				<th>직위</th>
				<td><%= vo.getJob() %></td>
			</tr>
			<tr>
				<th>입사일</th>
				<td><%= vo.getDbday() %></td>
			</tr>
			<tr>
				<th>사수</th>
				<td><%= vo.getMgr()==0?"없음" : vo.getMgr()%></td>
			</tr>
			<tr>
				<th>급여</th>
				<td><%= vo.getSal() %></td>
			</tr>
			<tr>
				<th>성과금</th>
				<td><%= vo.getComm() %></td>
			</tr>
			<tr>
				<th>부서번호</th>
				<td><%= vo.getDeptno() %></td>
			</tr>
			<tr>
				<td colspan="2" align = "center">
					<input type="button" value="목록"
						onclick="javascript:history.back()">
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html> 