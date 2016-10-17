<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/rentalItemUpdate.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoxBox</title>
</head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script>
	function rentalAdd() {
		var itemId = document.getElementById('cate').value;
		var selectedIndex = document.getElementById('place').selectedIndex;
		var placeId = document.getElementById('place').options[selectedIndex].value;

		$.ajax({
			type : "POST",
			url : "./admin/rentalAdd.jsp",
			data : "placeId=" + placeId + "&itemId=" + itemId,
			success : goAddRental
		});
		function goAddRental(msg) {
			alert("상품을 추가하였습니다.");
		}
	}
</script>
<body>
	<div id="header">
		<c:if test="${ authInfo.type==1}">
			<%@include file="/admin/headerAdmin.jsp"%>
		</c:if>
		<c:if test="${authInfo.type==2 || authInfo.type!=1}">
			<%@include file="/include/header.jsp"%>
		</c:if>
	</div>
	<div class="rentalItemUpdate">
		<h2>관리소에 대여물품 추가</h2>
		<select class="cmbRental" id="place" name="place">
			<option value="0" />관리소 선택
			</option>
			<c:forEach var="place" items="${requestScope.place}">
				<option value="<c:out value="${place.id}"/>">
					<c:out value="${place.name }" />
				</option>
			</c:forEach>
		</select> <select class="cmbRental" id="cate" name="cate">
			<option value="0" />카테고리 선택
			</option>
			<c:forEach var="item" items="${requestScope.item}">
				<option value="<c:out value="${item.itemId}"/>">
					<c:out value="${item.cate } - ${item.model } - ${item.info }" />
				</option>
			</c:forEach>
		</select>&nbsp; <input type="button" id="btnPlaceDisplay"
			class="btn btn-primary btn-block btn-large"
			value="대여물품 추가" onclick="javascript:rentalAdd();" />

<!-- 		<h2>물품정보 변경</h2> -->
<!-- 		<input type="text" id="itemCate" name="itemCate" disabled /><br> -->
<!-- 		<br> <input type="text" id="itemType" name="itemType" disabled /><br> -->
<!-- 		<br> -->
<!-- 		<textarea id="itemInfo" rows="3" cols="50" -->
<!-- 			placeholder="상품정보를 입력하세요.(100자 이내)"></textarea> -->
<!-- 		<br> <input type="file" id="itemPhoto" name="itemPhoto" /><br> -->
<!-- 		<br> <input type="submit" -->
<!-- 			class="btn btn-primary btn-block btn-large" value="물품정보 변경" /><br> -->
<!-- 		<br> <input type="button" -->
<!-- 			class="btn btn-primary btn-block btn-large" value="이전 페이지로 돌아가기" -->
<!-- 			onclick="location.href='rentalDisplay.jsp'" /> -->
	</div>
</body>
</html>
