<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뮤직 리스트</title>
<style type="text/css">
.container {
  margin-top: 40px;
  margin-bottom: 50px;
}

.table {
  width: 90%;
  margin: 0 auto;
  border-collapse: collapse;
}

.table th {
  text-align: center;
  background-color: #f8f9fa;
  font-weight: bold;
  border-bottom: 2px solid #dee2e6;
}

.table td {
  text-align: center;
  vertical-align: middle;
  border-top: 1px solid #dee2e6;
  padding: 12px 8px;
}

.table img {
  width: 90px;
  height: 90px;
  border-radius: 8px;
  transition: transform 0.2s ease-in-out;
}

.table img:hover {
  transform: scale(1.05);
}

.rank-up {
  color: red;
  font-weight: bold;
}

.rank-down {
  color: blue;
  font-weight: bold;
}

.rank-same {
  color: gray;
}

.pagination {
  justify-content: center;
  margin-top: 25px;
}
</style>
</head>
<body>
<div class="container">
  <h2 class="text-center" style="margin-bottom: 30px;">🎵 Genie Music 차트</h2>

  <table class="table table-hover table-bordered">
    <thead>
      <tr>
        <th>사진</th>
        <th>순위</th>
        <th>상태</th>
        <th>제목</th>
        <th>가수</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="vo" items="${list}">
        <tr>
          <td>
            <a href="../music/detail.do?no=${vo.no}&page=${curpage}">
              <img src="${vo.poster}" alt="${vo.title}">
            </a>
          </td>
          <td>${vo.rank}</td>
          <td>
            <c:choose>
              <c:when test="${vo.state eq '상승'}">
                <span class="rank-up">▲ ${vo.idcrement}</span>
              </c:when>
              <c:when test="${vo.state eq '하강'}">
                <span class="rank-down">▽ ${vo.idcrement}</span>
              </c:when>
              <c:otherwise>
                <span class="rank-same">-</span>
              </c:otherwise>
            </c:choose>
          </td>
          <td class="text-start">
            <a href="../music/detail.do?no=${vo.no}&page=${curpage}" style="text-decoration:none; color:black;">
              ${vo.title}
            </a>
          </td>
          <td>${vo.singer}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <!-- 페이지네이션 -->
  <div class="row text-center">
    <ul class="pagination">
      <c:if test="${startPage > 1}">
        <li><a href="../music/list.do?page=${startPage - 1}">&lt;</a></li>
      </c:if>

      <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <li class="${i == curpage ? 'active' : ''}">
          <a href="../music/list.do?page=${i}">${i}</a>
        </li>
      </c:forEach>

      <c:if test="${endPage < totalpage}">
        <li><a href="../music/list.do?page=${endPage + 1}">&gt;</a></li>
      </c:if>
    </ul>
  </div>
</div>
</body>
</html>
