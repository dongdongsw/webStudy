<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음악 검색</title>
<style type="text/css">
.container {
  margin-top: 40px;
  margin-bottom: 60px;
}
.search-box {
  text-align: center;
  margin-bottom: 30px;
}
.search-box select, 
.search-box input[type="text"], 
.search-box input[type="submit"] {
  padding: 10px 14px;
  font-size: 16px;
  border-radius: 5px;
  border: 1px solid #ccc;
  margin-right: 5px;
}
.search-box input[type="submit"] {
  background-color: #007bff;
  color: white;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
}
.search-box input[type="submit"]:hover {
  background-color: #0056b3;
}
.row {
  margin: 0 auto;
  margin-left:70px;
  width: 1150px;
}
.thumbnail {
  border: 1px solid #e0e0e0;
  border-radius: 10px;
  transition: transform 0.2s ease-in-out;
  margin-bottom: 25px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.05);
}
.thumbnail:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}
.thumbnail img {
  width: 100%;
  height: 160px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  object-fit: cover;
}
.caption {
  padding: 10px;
  text-align: center;
  font-weight: 500;
  color: #333;
}
.caption p {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
</style>
</head>
<body>
<div class="container">
  <h2 class="text-center" style="margin-bottom: 20px;">🎵 음악 검색</h2>

  <div class="search-box">
    <form method="post" action="../music/find.do">
      <select name="column" class="input-lg">
        <option value="title">제목</option>
        <option value="singer">가수</option>
      </select>
      <input type="text" size="30" class="input-lg" name="ss" placeholder="검색어를 입력하세요">
      <input type="submit" value="검색" class="btn-lg btn-primary">
    </form>
  </div>

  <div class="row text-center">
    <c:if test="${empty list}">
      <p style="margin-top:40px; font-size:18px; color:#777;">검색 결과가 없습니다 😢</p>
    </c:if>

    <c:forEach var="vo" items="${list}">
      <div class="col-md-4" style="display:inline-block; width:230px; margin:10px;">
        <c:choose>
          <c:when test="${not empty vo.poster}">
            <div class="thumbnail">
              <a href="../music/detail.do?no=${vo.no}&page=${curpage}">
                <img src="${vo.poster}" 
                     alt="${vo.title}" 
                     onerror="this.src='No.jpg';">
                <div class="caption">
                  <p>${vo.title}</p>
                  <small style="color:gray;">${vo.singer}</small>
                </div>
              </a>
            </div>
          </c:when>

          <c:otherwise>
            <div class="thumbnail" style="opacity:0.6;">
              <a href="../music/detail.do?no=${vo.no}&page=${curpage}">
                <img src="No.jpg" alt="이미지 없음">
                <div class="caption">
                  <p>${vo.title}</p>
                  <small style="color:gray;">${vo.singer}</small>
                </div>
              </a>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
    </c:forEach>
  </div>
</div>
</body>
</html>
