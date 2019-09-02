<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post" name="write"  action="write" >
<table style="width:70%">
   <tr>
	    <td align="center">닉네임</td>
	    <c:if test="${sessionId != null}">
	    <input type="hidden" name="nickname" value="${sessionId}">
	    <td>${sessionId }</td>
	    </c:if>
	    <c:if test="${sessionId == null}">
	    <td><input type="text" size="10" maxlength="10" name="nickname"></td>
	    </c:if>
   </tr>
   <tr>
	    <td align="center" >제 목</td>
	    <td><input type="text" size="40" maxlength="50" name="title"></td>
   </tr>
   <tr>
    <td align="center" >내 용</td>
    <td><textarea name="content" rows="13" cols="40"></textarea></td>
   </tr>
   <tr>
   	<td align="center">중요도 </td>
   	<td><input type="radio" name="important" value="true">Y
   	<input type="radio" name="important" value="false" checked="checked">N</td>
   <tr>      
	<td colspan=2  align="center"> 
	  <input type="submit" value="글쓰기" >  
	  <input type="reset" value="다시작성">
	</td>
   </tr></table>    
     
</form>  
</body>
</html>