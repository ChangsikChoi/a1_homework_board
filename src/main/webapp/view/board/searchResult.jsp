<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<div style="margin-top:20px;margin-bottom:20px;">
	<form method="post" action="search">
		<select name="condition" style="width:100px;">
			<option value="nickname">닉네임</option>
			<option value="title">타이틀</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>	
	</div>
	<a href="<%=request.getContextPath() %>/write">글쓰기</a>		
	<a href="<%=request.getContextPath() %>/list">글목록</a>		
	<c:if test="${searchList.size()>0}">
	<table style="width:700px; margin-top:20px;">
		<tr>
			<th align="center" width="50">no</th>
			<th align="center" width="400">제목</th>
			<th align="center" width="150">닉네임</th>
			<th align="center" width="100">작성일</th>
		</tr>
		<c:forEach var="article" items="${searchList}">
			<c:if test="${article.important == true }">
		<tr style="background-color:#6799FF">
			</c:if>
			<c:if test="${article.important == false }">
		<tr>
			</c:if>
			<td align="center">${article.num}</td>
			<td align="center"><a href="<%=request.getContextPath()%>/readContent?num=${article.num}">${article.title }</a></td>
			<td align="center">${article.nickname }</td>
			<td align="center"><fmt:formatDate value="${article.reg_date}" pattern="yyyy.MM.dd"/></td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
	<c:if test="${searchList.size()==0}">
		<h3>조건에 맞는 게시글이 없습니다.</h3>
	</c:if>	
</body>
</html>