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
<script>
	function keywordChk(){
		var searchForm = eval("document.searchForm");
		if(!searchForm.keyword.value){
			alert("검색어를 입력하세요.");
			return false;
		}
	}
</script>
<div style="margin-top:100px;">
	<center><h1>게시판 구현</h1></center>
</div>
	<c:if test="${totalCount==0}">
		<h3>저장된 게시글이 없습니다.</h3>
	<a href="<%=request.getContextPath() %>/write">글쓰기</a>
	</c:if>
	
	<c:if test="${totalCount!=0}">
		<h3>게시글 수 : ${totalCount}</h3>
	<div style="margin-top:20px;margin-bottom:20px;">
	<form method="post" action="search" name="searchForm" onsubmit="return keywordChk()">
		<select name="condition" style="width:100px;">
			<option value="nickname">닉네임</option>
			<option value="title">타이틀</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>	
	</div>
	<a href="<%=request.getContextPath() %>/write">글쓰기</a>		
	
	<table style="width:700px; margin-top:20px;">
		<tr>
			<th align="center" width="50">no</th>
			<th align="center" width="400">제목</th>
			<th align="center" width="150">닉네임</th>
			<th align="center" width="100">작성일</th>
		</tr>
		<c:forEach var="article" items="${boardList}">
			<c:if test="${article.important == true }">
		<tr style="background-color:#6799FF">
			</c:if>
			<c:if test="${article.important == false }">
		<tr>
			</c:if>
			<td align="center"><c:out value="${count}" /></td>
			<c:set var="count" value="${count -1}" />
			<td align="center"><a href="<%=request.getContextPath()%>/readContent?num=${article.num}">${article.title }</a></td>
			<td align="center">${article.nickname }</td>
			<td align="center"><fmt:formatDate value="${article.reg_date}" pattern="yyyy.MM.dd"/></td>
		</tr>
		</c:forEach>
	</table>
	<div>
		<c:if test="${ startPage > bottomLine}">
		    <a href="list?pageNum=${startPage - bottomLine}">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
	     <a href="list?pageNum=${i}">[${i}] </a>
		</c:forEach>
	
		<c:if test="${ endPage < pageCount}">
		<a href="list?pageNum=${startPage + bottomLine}">[다음]</a>
		</c:if>
	</div>
</c:if>
</body>
</html>