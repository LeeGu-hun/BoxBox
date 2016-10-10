<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/footer.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/rentalOrder.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script>
function timeSearch() {

	var rentalId = document.getElementById('rentalId').value;
	var startSelectedIndex = document.getElementById('startTime').selectedIndex;
	var startTime= document.getElementById("startTime").options[startSelectedIndex].value;
	var endSelectedIndex = document.getElementById('endTime').selectedIndex;
	var endTime= document.getElementById("endTime").options[endSelectedIndex].value;
	var orderDate = document.getElementById('orderDate').value;
	var orderDate1 = document.getElementById('orderDate1').value;
	$.ajax({
		type : "POST",
		url : "./boxUser/rentalSearch.jsp",
		data : "rentalId=" + rentalId+"&startTime="+startTime+"&endTime="+endTime+"&orderDate="+orderDate+"&orderDate1="+orderDate1,
		success : result3
	});
	function result3(msg) {
		$("#rentalSearch").html(msg);
	}
}
</script>
<div id="header">
	<%@include file="/include/header.jsp"%>
</div>
<div class="rentalOrder" id="rentalOrder" style="height: 78%;">
	<h2>대여가능물품 조회</h2>
	<table id="rentalItemDisplay">
		<tr>
			<%-- 			<form method="post" action="${pageContext.request.contextPath }/payment1"> --%>
			<input type="hidden" id="rentalId" name="rentalId" value="${RentalSearch.placeId }" />
			<td id="compBox">대여상품&nbsp; :&nbsp; <input type="text"
				class="cmbRental" id="gu" name="gu" value="${RentalSearch.gu }"
				disabled="disabled" />&nbsp; <input type="text" class="cmbRental"
				id="placeName" name="placeName" value="${RentalSearch.place }"
				disabled="disabled" />&nbsp; <input type="text" class="cmbRental"
				id="cate" name="cate" value="${RentalSearch.cate }"
				disabled="disabled" />&nbsp; <input type="text" class="cmbRental"
				id="model" name="model" value="${RentalSearch.model }"
				disabled="disabled" />&nbsp;&nbsp;&nbsp; <br> 대여시간&nbsp; :
				&nbsp;<input type="date" id="orderDate" name="orderDate" />&nbsp; <select
				class="cmbRental" id="startTime" name="startTime">
					<option value="start">시작 시간</option>
					<c:forEach var="i" begin="0" end="23">
						<option value="${i }">${i }</option>
					</c:forEach>
			</select>&nbsp; <input type="date" id="orderDate1" name="orderDate1" />&nbsp;
				<select class="cmbRental" id="endTime" name="endTime">
					<option value="end">종료 시간</option>
					<c:forEach var="i" begin="1" end="23">
						<option value="${i }">${i }</option>
					</c:forEach>
					<option value="0">24</option>
			</select>
			</td>
			<td id="btnBox"><input type="submit" id="btnDisplay"
				class="btn btn-primary btn-block btn-large" value="예약 불가능한 시간 조회"
				onclick="javascript:timeSearch();" /></td>
			<%-- 			</form> --%>
		</tr>

		<tr>
			<td colspan=2>
				<hr> <br>
				<h2>조회결과</h2>
				<table class="rentalDisplay" id="rentalSearch" name="rentalSearch">
<!-- 					<tr id="head"> -->
<!-- 						<td id="col1">대여물품코드</td> -->
<!-- 						<td id="col2">대여관리소</td> -->
<!-- 						<td id="col3">대여날짜</td> -->
<!-- 						<td id="col4">대여시간</td> -->
<!-- 						<td id="col5">상품카테고리</td> -->
<!-- 						<td id="col6">상품유형</td> -->
<!-- 						<td id="col7">상품설명</td> -->
<!-- 						<td id="col8">사진</td> -->
<!-- 						<td id="col9">대여금액(시간당)</td> -->
<!-- 						<td id="col10">추가</td> -->
<!-- 					</tr> -->
<!-- 					<tr id="rowSearch" name="rowSearch"> -->
						<%-- 						<td id="col1">${TimeSearch.rentalId }</td> --%>
						<%-- 						<td id="col2">${TimeSearch.place }</td> --%>
						<%-- 						<td id="col3">${TimeSearch.orderDate }</td> --%>
						<%-- 						<td id="col4">${TimeSearch.orderTime }</td> --%>
						<%-- 						<td id="col5">${TimeSearch.cate }</td> --%>
						<%-- 						<td id="col6">${TimeSearch.model }</td> --%>
						<%-- 						<td id="col7">${TimeSearch.info }</td> --%>
						<%-- 						<td id="col8"><img src="${TimeSearch.photo }"/></td> --%>
						<%-- 						<td id="col9">${TimeSearch.fee }</td> --%>
<!-- 						<td id="col10"><input type="button" id="btnAdd" -->
<!-- 							class="btnAdd btnAdd-primary btnAdd-block btnAdd-large" -->
<!-- 							value="추가" onclick="'"></td> -->
<!-- 					</tr> -->
				</table> <br>
			</td>
		</tr>
	</table>
	<hr>
	<br>
	<h2>주문내역 확인</h2>
	<table class="addList">
		<tr id="head">
			<td id="col11">대여물품코드</td>
			<td id="col12">대여관리소</td>
			<td id="col13">상품설명</td>
			<td id="col14">대여시작</td>
			<td id="col15">대여종료</td>
			<td id="col16">대여금액</td>
			<td id="col17">취소</td>
		</tr>
		<tr id="row">
			<td id="col11">.</td>
			<td id="col12">.</td>
			<td id="col13">.</td>
			<td id="col14">.</td>
			<td id="col15">.</td>
			<td id="col16">.</td>
			<td id="col17"><input type="button" id="btnDel"
				class="btnDel btnDel-primary btnDel-block btnDel-large" value="취소"
				onclick="'"></td>
		</tr>
	</table>
	<br>
	<hr>
	<br> 총 대여금액&nbsp;&nbsp;&nbsp; <input type="text" disabled /> <br>
	<br> <input type="button" id="btnPay"
		class="btn btn-primary btn-block btn-large" value="결제하기" onclick="'" />
</div>
<div>
	<%@include file="/include/footer.jsp"%>
</div>