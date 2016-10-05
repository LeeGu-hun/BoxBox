<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/boxUser.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	function postList() {
		var selectedIndex = document.getElementById('post').selectedIndex;
		var post = document.getElementById("post").options[selectedIndex].value;
		$.ajax({
			type : "POST",
			url : "./boxUser/cmbList.jsp",
			data : "post=" + post,
			success : result
		});
		function result(msg) {
			$("#place").html(msg);
		}
	}
</script>
<div class="main">
	<h3>BoxBox와 함께 쉽고 편리하게 보관함과 물품을 대여해 보아요.</h3>
	<select class="cmbRental" id="post" name="post" onchange="postList();">
		<option value="0" />지역 선택
		</option>
		<c:forEach var="place" items="${requestScope.place}">
			<option value="<c:out value="${place.postId}"/>">
				<c:out value="${place.city}-${place.gu}-${place.dong}" />
			</option>
		</c:forEach>
	</select>&nbsp; <select class="cmbRental" id="place" name="place">
		<option value="0" />지역을 선택하세요.
		</option>
	</select>&nbsp; <select class="cmbRental">
		<optgroup label="대여물품 카테고리">
			<option value=""></option>
		</optgroup>
	</select>&nbsp; <select class="cmbRental">
		<optgroup label="대여물품 종류">
			<option value=""></option>
		</optgroup>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
		class="btn btn-primary btn-block btn-large" value="대여가능 물품 검색"
		onclick="'"> <br> <br>
	<hr>
	<h2>대여가능 물품 리스트</h2>
	<table class="rentalDisplay">
		<tr id="head">
			<td id="col1">지역</td>
			<td id="col2">대여관리소</td>
			<td id="col3">카테고리</td>
			<td id="col4">종류</td>
			<td id="col5">설명</td>
			<td id="col6">사진</td>
		</tr>
		<tr id="row">
			<td id="col1">.</td>
			<td id="col2">.</td>
			<td id="col3">.</td>
			<td id="col4">.</td>
			<td id="col5">.</td>
			<td id="col6">.</td>
		</tr>
	</table>
</div>
user페이지
<br>
이름 : ${authInfo.name }
<br>
이메일 : ${authInfo.email }
<br>
<a href="<c:url value='/member/changeInfo'/>">[회원정보 변경]</a>
<a href="<c:url value='/logout'/>">[로그아웃]</a>