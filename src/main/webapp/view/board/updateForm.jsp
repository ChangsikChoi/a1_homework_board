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

<form method="post" name="update"  action="update" >
	<input type="hidden" name="num" value="${article.num}">
	<input type="hidden" name="nickname" value="${article.nickname}">
<table style="width:70%">
   <tr>
	    <td align="center">닉네임</td>
	    <td>${article.nickname }</td>
   </tr>
   <tr>
	    <td align="center" >제 목</td>
	    <td><input type="text" size="40" maxlength="50" name="title" value="${article.title }"></td>
   </tr>
   <tr>
    <td align="center" >내 용</td>
    <td><textarea name="content" rows="13" cols="40">${article.content }</textarea></td>
   </tr>
   <tr>
   	<td align="center">중요도 </td>
   	<td><input type="radio" name="important" value="true" 
   		<c:if test="${article.important==true}">checked="checked"</c:if>>Y
   	<input type="radio" name="important" value="false"
   		<c:if test="${article.important==false}">checked="checked"</c:if>>N</td>
   <tr>      
	<td colspan=2  align="center"> 
	  <input type="submit" value="수정" >  
	</td>
   </tr></table>    
     
</form>  
</body>
</html>