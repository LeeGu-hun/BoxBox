<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<link rel = "stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rentalItemUpdate.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoxBox</title>
</head>
<body>
<div class="rentalItemUpdate">
	<h2>물품정보 변경</h2>
	<form method="post" action="login">
		<input type="text" id="itemCate" name="itemCate" disabled /><br><br>		
		<input type="text" id="itemType" name="itemType" disabled /><br><br>
		<textarea id="itemInfo" rows="3" cols="50" placeholder="상품정보를 입력하세요.(100자 이내)"></textarea><br>			
		<input type="file" id="itemPhoto" name="itemPhoto" /><br><br>
		<input type="submit" class="btn btn-primary btn-block btn-large" value="물품정보 변경" /><br><br>
		<input type="button" class="btn btn-primary btn-block btn-large" value="이전 페이지로 돌아가기"
			onclick="location.href='rentalDisplay.jsp'" />
	</form>
</div>
</body>
</html>
