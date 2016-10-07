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
<div class="rentalItemInsert">
	<h2>렌탈물품 정보 변경</h2>
	<form method="post" action="login">
		<select class="cmbRental">
		<optgroup label="지역">
			<option value=""></option>
			</optgroup>
		</select>&nbsp;
		<select class="cmbRental">
			<optgroup label="대여관리소">
			<option value=""></option>
			</optgroup>
		</select>&nbsp;
		<select class="cmbRental">
			<optgroup label="대여물품 카테고리">
			<option value=""></option>
			</optgroup>
		</select>&nbsp;
		<input type="text" id="itemModel" name="itemModel" placeholder="상품유형" autofocus
			required="required" />
		<textarea id="itemInfo" rows="3" cols="50" placeholder="상품정보를 입력하세요.(100자 이내)"></textarea>			
		<input type="file" id="itemPhoto" name="itemPhoto" /><br><br>
		<input type="submit" class="btn btn-primary btn-block btn-large" value="렌탈물품 정보 변경" onClick="" /><br><br>
		<input type="button" class="btn btn-primary btn-block btn-large" value="이전 페이지로 돌아가기"
			onclick="location.href='rentalItemDisplay.jsp'" />
	</form>
</div>
</body>
</html>
