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
<div id="header">
	<c:if test="${ authInfo.type==1}">
		<%@include file="/admin/headerAdmin.jsp"%>
	</c:if>
	<c:if test="${authInfo.type==2 || authInfo.type!=1}">
		<%@include file="/include/header.jsp"%>
	</c:if>
</div>

<div class="profit">
	<h2>매출현황</h2>
	<table id="select">
		<tr>
			<td id="compBox">
				대여항목&nbsp; : &nbsp;
				<select class="cmbRental">
					<optgroup label="대여관리소">
						<option value=""></option>
					</optgroup>
				</select>&nbsp;&nbsp;
				<select class="cmbRental">
					<optgroup label="카테고리">
						<option value=""></option>
					</optgroup>
				</select>&nbsp;&nbsp;&nbsp;
				대여일자&nbsp; : &nbsp; <input type="date" id="startTime" placeholder="시작일자"/>
				&nbsp; ~ &nbsp; <input type="date" id="lastTime" placeholder="종료일자"/>
			</td>
			<td id="btnBox">
				<input type="button" class="btn btn-primary btn-block btn-large"
					value="사업수익 현황보기" onclick="'">			
			</td>
		</tr>
	</table>
	<hr>
	<h2>매출현황 조회결과</h2>	
	<table class="profitDisplay">
		<tr id="head">
			<td id="col1">사용자ID</td>
			<td id="col2">대여관리소</td>			 
			<td id="col3">종류</td>
			<td id="col4">설명</td>
			<td id="col5">대여시작</td>
			<td id="col6">대여종료</td>
			<td id="col7">대여금액</td>			
		</tr>
<!-- 		<tr id="row">
			<td id="col1">.</td>
			<td id="col2">.</td>
			<td id="col3">.</td>
			<td id="col4">.</td>
			<td id="col5">.</td>
			<td id="col6">.</td>
			<td id="col7">.</td>			
		</tr>		 -->
	</table>
	<br><hr><br>
	<span id="total" style="color: white">총 수익</span>&nbsp;&nbsp;&nbsp;<input style="width: 15%;" type="text" disabled />
	<!-- 로그인페이지 가기 --> 
	<!-- <h3>보관함을 예약하고 싶으시다면 로그인하세요.</h3>
	<input type="button" class="btn btn-primary btn-block btn-large"
		value="로그인 페이지 가기" onclick="'"> -->
</div>
</body>
</html>
