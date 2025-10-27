<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class=container>
		<div class=row>
			<table class=table>
				<tr>
					<td width=30% class=text-center rowspan="9">
						<table class=table>
							<tr>
								<td colspan=7>
									<img src="${vo.poster }"  style="width: 420px; height:300px;" id="musiclistImg">
								</td>
							</tr>
						</table>
					</td>
					<td colspan=2>
						<h3>${vo.title }&nbsp;<span style="color:orange">${vo.rank }</span></h3>
					</td>
				</tr>
				<tr>
					<td width=10% style="color:gray">가수</td>
					<td width=50%>${vo.singer}</td>
				</tr>
				<tr>
					<td width=10% style="color:gray">앨범</td>
					<td width=50%>${vo.album }</td>
				</tr>
				<tr>
					<td width=10% style="color:gray">장르</td>
					<td width=50%>
						<c:choose>
							<c:when test="${vo.cno == 1 }">Top100</c:when>
							<c:when test="${vo.cno == 2 }">가요</c:when>
							<c:when test="${vo.cno == 3 }">트롯</c:when>
							<c:when test="${vo.cno == 4 }">OST</c:when>
							<c:when test="${vo.cno == 5 }">트롯</c:when>
							<c:when test="${vo.cno == 6 }">JAZZ</c:when>
							<c:when test="${vo.cno == 7 }">ClASSIC</c:when>						
						</c:choose>
					</td>
				</tr>
			</table>
			<table class=table>
				<tr>
					<td class=text-center>
						<a href="#" class="btn btn-xs btn-danger">좋아요</a>
						<a href="#" class="btn btn-xs btn-warning">찜하기</a>
						<a href="#" class="btn btn-xs btn-info">예약</a>
						<a href="../music/list.do?page=${curpage }" class="btn btn-xs btn-success">목록</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>