<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<link rel = "stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rentalCancel.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoxBox</title>
</head>
<div class="rentalCancel">
	<h2>렌탈예약 취소하기</h2>
	<h3>주의 : 렌탈이 시작되는 시간 이후에는 취소할 수 없습니다.</h3>	
	<table class="rentalDisplay">
		<tr id="head">
			<td id="col1">지역</td>
			<td id="col2">위치번호</td>
			<td id="col3">대여관리소</td>
			<td id="col4">카테고리</td>
			<td id="col5">종류</td>
			<td id="col6">설명</td>
			<td id="col7">예약취소</td>
		</tr>
		<tr id="row">
			<td id="col1">.</td>
			<td id="col2">.</td>
			<td id="col3">.</td>
			<td id="col4">.</td>
			<td id="col5">.</td>
			<td id="col6">.</td>
			<td id="col6">
				<input type="button" class="btn btn-primary btn-block btn-large"
					value="예약취소" onclick="'">	
			</td>
		</tr>		
	</table>
</div>
</body>
</html>
