<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/changeInfo.css" />
<title>회원가입 완료창</title>
</head>
<body>
	<div class="joinSuccess" style="position: absolute; top: 50%; left: 50%; margin: -150px 0 0 -150px;
		width: 300px;	height: 24px;	text-align: center;">
		<span style="font-size: 24px; font-weight: bold; color: white" >
			${memberName }님 환영합니다. </span><br>
		<span style="font-size: 16px; font-weight: bold; color: white" >회원님의 계정이 만들어졌습니다.</span><br><br>
			<a href="<c:url value='/member/changeInfo'/>" style="text-decoration: none">회원정보 변경</a> 
			<a href="<c:url value='/logout'/>" style="text-decoration: none">로그아웃</a>
			<br><br>
			<form action="<%=request.getContextPath()%>/main">
<!-- 				<p style="text-align: center"> -->
				<input type="submit" value="메인 페이지로 이동" class="btn btn-primary btn-block btn-large">
<!-- 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 				</p>	 -->
			</form>
	</div>
</body>
</html>
