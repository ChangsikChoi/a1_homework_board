<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<html>
<head>
<title>게시판</title>
</head>
<script>
function checkSure(){
    if (confirm("정말 삭제하시겠습니까??") == true){ 
        return
    }else{  
        return false;
    }
  }
</script>
<body>
	<br>
	<br>
	<b>글내용 보기</b>
	<div>
		<table>
			<tr height="30">
				<td align="center">no</td>
				<td align="center">${article.num}</td>
			</tr>
			<tr height="30">
				<td align="center">닉네임</td>
				<td align="center">${article.nickname}</td>
			</tr>
			<tr height="30">	
				<td align="center">작성일</td>
				<td align="center" align="center"><fmt:formatDate value="${article.reg_date}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
			</tr>
			<tr height="30">
				<td align="center">제목</td>
				<td align="center" colspan="3">${article.title}</td>
			</tr>
			<tr height="30">
				<td align="center">내 용</td>
				<td align="left" colspan="3"><pre>${article.content}</pre></td>
			</tr>
			<tr height="30">
				<td colspan="4">
				<c:if test="${sessionId.equals(article.nickname)}">
					<input type="button" value="글수정"
					onclick="document.location.href='<%=request.getContextPath()%>/update?num=${article.num}'">
					&nbsp;&nbsp;&nbsp;&nbsp; 
					
					<input type="button" value="글삭제"
					onclick="document.location.href='<%=request.getContextPath()%>/delete?num=${article.num}'">
					&nbsp;&nbsp;&nbsp;&nbsp; 
				</c:if>
					<input type="button" value="글목록"
					onclick="document.location.href='<%=request.getContextPath()%>/list?pageNum=${pageNum}'"></td>
			</tr>
		</table>
	</div>
</body>
</html>

