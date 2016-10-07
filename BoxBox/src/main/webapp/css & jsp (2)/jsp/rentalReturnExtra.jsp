<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<link rel = "stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rentalReturnExtra.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoxBox</title>
</head>
<div class="rentalReturnExtra">
	<h2>사용 중인 렌탈 반납 및 연장하기</h2>
	<h3>주의 : 연장은 1회만 가능하며, 연장시 추가요금이 부가됩니다.</h3>	
	<table class="rentalDisplay">
		<tr id="head">
			<td id="col1">지역</td>
			<td id="col2">위치번호</td>
			<td id="col3">대여관리소</td>
			<td id="col4">카테고리</td>
			<td id="col5">종류</td>
			<td id="col6">설명</td>
			<td id="col7">반납/연장</td>
		</tr>
		<tr id="row">
			<td id="col1">.</td>
			<td id="col2">.</td>
			<td id="col3">.</td>
			<td id="col4">.</td>
			<td id="col5">.</td>
			<td id="col6">.</td>
			<td id="col6">
				<input type="button" id="btnReturn" class="btn btn-primary btn-block btn-large"
					value="반납" onClick="">	
				<input type="button" id="btnExtra" class="btn btn-primary btn-block btn-large"
					value="연장" onClick="self.location='rentalExtraPage.jsp';">
			</td>
		</tr>		
	</table>
</div>
</body>
</html>
