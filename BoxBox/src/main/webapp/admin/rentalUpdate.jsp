<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<link rel = "stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rentalUpdate.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoxBox</title>
</head>
<body>
<div class="rentalUpdate">
	<h2>대여정보 변경</h2>
	<form method="post" action="login">
		<input type="text" id="placeName" name="placeName" autofocus disabled /><br><br>			
		<select class="cmbRental">
			<optgroup label="카테고리">
				<option value=""></option>
			</optgroup>
		</select>&nbsp;
		<select class="cmbRental">
			<optgroup label="종류">
				<option value=""></option>
			</optgroup>
		</select>&nbsp;
		<select class="cmbRental">
			<optgroup label="물품명">
				<option value=""></option>
			</optgroup>
		</select>&nbsp;<br><br>
<!-- 		<input type="text" id="itemModel" name="itemModel" placeholder="상품유형" autofocus
			required="required" />
		<textarea id="itemInfo" rows="3" cols="50" placeholder="상품정보를 입력하세요.(100자 이내)"></textarea>			
		<input type="file" id="itemPhoto" name="itemPhoto" /><br><br> -->
		<input type="submit" class="btn btn-primary btn-block btn-large" value="대여정보 변경" onClick="" /><br><br>
		<input type="button" class="btn btn-primary btn-block btn-large" value="이전 페이지로 돌아가기"
			onclick="location.href='rentalDisplay.jsp'" />
	</form>
</div>
</body>
</html>
