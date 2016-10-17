<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/rentalPlaceDisplay.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoxBox</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script>
	function selectGu() {
		var selectedIndex = document.getElementById("city").selectedIndex;
		var city = document.getElementById("city").options[selectedIndex].text;
		$.ajax({
			type : "POST",
			url : "./admin/selectGu.jsp",
			data : "city=" + city,
			success : goGu
		});
		function goGu(msg) {
			$("#gu").html(msg);
		}
	}
	function selectDong() {
		var selectedIndex = document.getElementById('gu').selectedIndex;
		var gu= document.getElementById("gu").options[selectedIndex].text;
		$.ajax({
			type : "POST",
			url : "./admin/selectDong.jsp",
			data : "gu=" + gu,
			success : goDong
		});
		function goDong(msg) {
			$("#dong").html(msg);
		}
	}
	function selectStreet() {
		var selectedIndex = document.getElementById('dong').selectedIndex;
		var dong = document.getElementById("dong").options[selectedIndex].text;
		$.ajax({
			type : "POST",
			url : "./admin/selectStreet.jsp",
			data : "dong=" + dong,
			success : goStreet
		});
		function goStreet(msg) {
			$("#street").html(msg);
		}
	}
	function addPlace() {
		var placeName= document.getElementById('placeName').value;
		var selectedIndex = document.getElementById('street').selectedIndex;
		var postId=document.getElementById('street').options[selectedIndex].value;
		var userId = document.getElementById('userId').value;
		$.ajax({
			type : "POST",
			url : "./admin/addPlace.jsp",
			data : "placeName=" + placeName+"&userId="+userId+"&postId="+postId,
			success : goAdd
		});
		function goAdd(msg) {
			alert("관리소를 추가하였습니다.");
		}
	}
	function postList() {
		var selectedIndex = document.getElementById('post').selectedIndex;
		var post = document.getElementById("post").options[selectedIndex].value;
		$.ajax({
			type : "POST",
			url : "./admin/cmbPost.jsp",
			data : "post=" + post,
			success : result
		});
		function result(msg) {
			$("#rowDiv").html(msg);
		}
	}
</script>
</head>
<div id="header">
	<c:if test="${ authInfo.type==1}">
		<%@include file="/admin/headerAdmin.jsp"%>
	</c:if>
	<c:if test="${authInfo.type==2 || authInfo.type!=1}">
		<%@include file="/include/header.jsp"%>
	</c:if>
</div>

<div class="rentalPlaceDisplay">
	<h2>관리소 조회</h2>
	<select class="cmbRental" id="post" name="post">
		<option value="0" />지역 선택
		</option>
		<c:forEach var="place" items="${requestScope.place}">
			<option value="<c:out value="${place.postId}"/>">
				<c:out value="${place.city}-${place.gu}-${place.dong}" />
			</option>
		</c:forEach>
	</select>&nbsp; <input type="button" id="btnPlaceDisplay"
		class="btnDisplay btnDisplay-primary btnDisplay-block btnDisplay-large"
		value="관리소검색" onclick="javascript:postList();" />
	<hr>
	<h2>관리소 조회 리스트</h2>
	<div id="rowDiv" style="height: 200px; overflow-y: auto;"></div>
	<div class="rentalPlaceInsert">
		<h2>관리소 추가</h2>
		<span id="address">관리소 위치 &nbsp;:&nbsp;</span> <select
			class="cmbRental" id="city" name="city"
			onchange="javascript:selectGu();">
			<option value="0" />지역 선택
			</option>
			<c:forEach var="City" items="${requestScope.City}">
				<option value="<c:out value="${City.city}"/>">
					<c:out value="${City.city}" />
				</option>
			</c:forEach>

		</select> <select class="cmbRental" id="gu" name="gu"
			onchange="javascript:selectDong();">
			<option value="0" />구 선택
		</option>


		</select> <select class="cmbRental" id="dong" name="dong"
			onchange="javascript:selectStreet();">
			<option value="0" />동 선택
			</option>

		</select> <select class="cmbRental" id="street" name="street">
			<option value="0" />도로명 선택
			</option>

		</select> <br> <input type="text" id="placeName" name="placeName"
			placeholder="관리소 이름을 입력하세요." autofocus required="required" /> <br>
		<br> <input type="hidden" id="userId" name="userId" value="${authInfo.id }"><input
			type="button" class="btn btn-primary btn-block btn-large"
			value="관리소 추가" onclick="javascript:addPlace();" /><br> <br>
	</div>
</div>
</body>
</html>
