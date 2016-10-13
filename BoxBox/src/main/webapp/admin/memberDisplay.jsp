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
<script>
	function memberSearchAdmin() {
		var userPhone = document.getElementById("userPhone");
		$.ajax({
			type : "POST",
			url : "./admin/memberSearchButton.jsp",
			data : "phone=" + phone,
			success : result
		});
		function result(msg) {
			$("#row").html(msg);
		}
	}
</script>
</head>
<div class="memberDisplay">
	<h2>사용자 검색</h2>
	<table id="select">
		<tr>
			<td id="compBox" style="text-align: center">
				<input type="text" id="userPhone" placeholder="사용자 휴대폰번호" />&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary btn-block btn-large"
					value="사용자 조회" onclick="javascrip:memberSearchAdmin()">				  			
			</td>			
		</tr>
	</table>
	<hr>
	<h2>사용자 조회결과</h2>	
	<table class="profitDisplay">
		<tr id="head">
			<td id="col2">성명</td>			 
			<td id="col3">휴대폰번호</td>
			<td id="col1">e-mail</td>
			<td id="col4">비밀번호</td>						
		</tr>
		<tr id="row">
			<td id="col2">.</td>
			<td id="col3">.</td>
			<td id="col1">.</td>	
			<td id="col4">.</td>		
		</tr>		
	</table>
	<!-- 로그인페이지 가기 --> 
	<!-- <h3>보관함을 예약하고 싶으시다면 로그인하세요.</h3>
	<input type="button" class="btn btn-primary btn-block btn-large"
		value="로그인 페이지 가기" onclick="'"> -->
</div>
</body>
</html>
