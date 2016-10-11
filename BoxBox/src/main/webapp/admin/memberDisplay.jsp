<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<link rel = "stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/memberDisplay.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoxBox</title>
</head>
<div class="memberDisplay">
	<h2>사용자 검색</h2>
	<table id="select">
		<tr>
			<td id="compBox">
				<input type="text" id="userEmail" placeholder="사용자 e-mail" />
				<input type="text" id="userName" placeholder="사용자 성명" />
				<input type="text" id="userPhone" placeholder="사용자 휴대폰번호" />
				<select class="cmbRental">
					<optgroup label="사용자 유형">
						<option label="일반 사용자">2</option>
						<option label="관리자">1</option>
					</optgroup>
				</select>				  			
			</td>
			<td id="btnBox">
				<input type="button" class="btn btn-primary btn-block btn-large"
					value="사용자 조회" onclick="'">			
			</td>
		</tr>
	</table>
	<hr>
	<h2>사용자 조회결과</h2>	
	<table class="profitDisplay">
		<tr id="head">
			<td id="col1">e-mail</td>
			<td id="col2">성명</td>			 
			<td id="col3">휴대폰번호</td>
			<td id="col4">유형</td>
			<td id="col5">총 결제금액</td>			
		</tr>
		<tr id="row">
			<td id="col1">.</td>
			<td id="col2">.</td>
			<td id="col3">.</td>
			<td id="col4">.</td>
			<td id="col5">.</td>			
		</tr>		
	</table>
	<!-- 로그인페이지 가기 --> 
	<!-- <h3>보관함을 예약하고 싶으시다면 로그인하세요.</h3>
	<input type="button" class="btn btn-primary btn-block btn-large"
		value="로그인 페이지 가기" onclick="'"> -->
</div>
</body>
</html>
