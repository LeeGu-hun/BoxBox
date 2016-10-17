<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/footer.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/boxUser.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	function postList() {
		var selectedIndex = document.getElementById('post').selectedIndex;
		var post = document.getElementById("post").options[selectedIndex].value;
		$.ajax({
			type : "POST",
			url : "./boxUser/cmbPost.jsp",
			data : "post=" + post,
			success : result
		});
		function result(msg) {
			$("#place").html(msg);
		}
	}
	function rentalList() {
		var selectedIndex = document.getElementById('place').selectedIndex;
		var place = document.getElementById("place").options[selectedIndex].text;
		$.ajax({
			type : "POST",
			url : "./boxUser/userSearch.jsp",
			data : "place=" + place,
			success : result1
		});
		function result1(msg) {
			$("#row").html(msg);
		}
	}
</script>
<!DOCTYPE html>
<div id="header">
	<c:if test="${ authInfo.type==1}">
		<%@include file="/admin/headerAdmin.jsp"%>
	</c:if>
	<c:if test="${authInfo.type==2 || authInfo.type!=1}">
		<%@include file="/include/header.jsp"%>
	</c:if>
</div>
<div style="height: 78%;">
	<c:if test="${ empty authInfo}">
		<%@include file="/dirMem/join.jsp"%>
	</c:if>
	<c:if test="${ authInfo.type==1}">
		<%@include file="/admin/adminMain.jsp"%>
	</c:if>
	<c:if test="${authInfo.type==2}">
		<%@include file="/boxUser/userMain.jsp"%>
	</c:if>
</div>
<div id="footer">
	<%@include file="/include/footer.jsp"%>
</div>
