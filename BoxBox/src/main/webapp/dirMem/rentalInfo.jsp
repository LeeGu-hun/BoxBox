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
<script src="http://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.12.0/jquery-ui.js"
	integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<div id="header">
	<%@include file="/include/header.jsp"%>
</div>
<div class="rentalOrder" id="rentalOrder"
	style="height: 78%; overflow-y: auto;">
	<H1>나의 대여 목록</H1>
	<table>

		<tr id='head'>

			<td id='col1'>렌탈아이디</td>
			<td id='col2'>대여관리소</td>
			<td id='col3'>가격</td>
			<td id='col4'>예약 시간</td>
			<td id='col5'>카테고리</td>
			<td id='col6'>상품 사진</td>
			<td id='col7'>비밀번호</td>
			<td id='col8'>반납</td>
		</tr>
		<c:forEach var="RentalInfo" items="${requestScope.RentalInfo}">
			<tr id='row'>
				<td id='col1'>${RentalInfo.rentalId }</td>
				<td id='col2'>${RentalInfo.placeName }</td>
				<td id='col3'>${RentalInfo.price }</td>
				<td id='col4'>${RentalInfo.startTime }시~${RentalInfo.endTime }시</td>
				<td id='col5'>${RentalInfo.cate }</td>
				<td id='col6'><img
					src="<%=request.getContextPath() %>/images/${RentalInfo.photo }" /></td>
				<td id='col7'>${RentalInfo.password }</td>
				<td id='col8'><form method="post" action="delete">
						<input type="hidden" id="userId" name="userId"
							value="${RentalInfo.userId }"> <input type="hidden"
							id="orderListId" name="orderListId"
							value="${RentalInfo.orderListId }"> <input type="submit"
							id='btn' value="반 납" />
					</form></td>
			</tr>
		</c:forEach>
	</table>

</div>

<div>
	<%@include file="/include/footer.jsp"%>
</div>