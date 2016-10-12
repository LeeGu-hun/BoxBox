<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<link rel = "stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/profit.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoxBox</title>
</head>
<div class="profit">
	<h2>매출현황</h2>
	<table id="select">
		<tr>
			<td id="compBox">
				대여항목&nbsp; : &nbsp;
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
				<select class="cmbRental">	
					<optgroup label="대여물품 종류">
						<option value=""></option>
					</optgroup>
				</select>
				<br>
				대여일자&nbsp; : &nbsp; <input type="date" id="startTime" placeholder="시작일자"/>
				&nbsp; ~ &nbsp; 
				<input type="date" id="lastTime" placeholder="종료일자"/>	&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				사용자&nbsp; : &nbsp; <input type="text" id="userEmail" placeholder="사용자 e-mail" />  			
			</td>
			<td id="btnBox">
				<input type="button" class="btn btn-primary btn-block btn-large"
					value="사업수익 현황보기" onclick="'">			
			</td>
		</tr>
	</table>
	<hr>
	<h2>수익 조회결과</h2>	
	<table class="profitDisplay">
		<tr id="head">
			<td id="col1">성명</td>
			<td id="col2">대여관리소</td>			 
			<td id="col3">카테고리</td>
			<td id="col4">종류</td>
			<td id="col5">설명</td>
			<td id="col6">대여시작</td>
			<td id="col7">대여시간</td>
			<td id="col8">연장시간</td>
			<td id="col9">대여종료</td>
			<td id="col10">대여금액</td>
			<td id="col11">연장금액</td>
			<td id="col12">총대여금액</td>
		</tr>
		<tr id="row">
			<td id="col1">.</td>
			<td id="col2">.</td>
			<td id="col3">.</td>
			<td id="col4">.</td>
			<td id="col5">.</td>
			<td id="col6">.</td>
			<td id="col7">.</td>
			<td id="col8">.</td>
			<td id="col9">.</td>
			<td id="col10">.</td>
			<td id="col11">.</td>
			<td id="col12">.</td>
		</tr>		
	</table>
	<br><hr><br>
	<span id="total">총 수익</span>&nbsp;&nbsp;&nbsp;<input style="width: 15%;" type="text" disabled />
	<!-- 로그인페이지 가기 --> 
	<!-- <h3>보관함을 예약하고 싶으시다면 로그인하세요.</h3>
	<input type="button" class="btn btn-primary btn-block btn-large"
		value="로그인 페이지 가기" onclick="'"> -->
</div>
</body>
</html>
