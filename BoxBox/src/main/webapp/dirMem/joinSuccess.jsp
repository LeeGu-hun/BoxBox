<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>



<title>회원가입 완료창</title>
</head>
<body>
	<div id="box">
		<div id="boxTable">
			<div id="boxCell">
				<span style="font-size: 17px; font-weight: bold;">
					${memberName }님 환영합니다. </span>
				<div id="line"></div>
				<div id="sNotice">
					회원님의 계정이 만들어졌습니다.<br> <a
						href="<c:url value='/member/changeInfo'/>">[회원정보 변경]</a> <a
						href="<c:url value='/logout'/>">[로그아웃]</a>
					<form:form action="<%=request.getContextPath()%>/login">
						<p style="text-align: right">
							<input type="submit" value="로그인 페이지 가기">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</p>
					</form:form>
				</div>
				<br> <br>
			</div>
		</div>
	</div>
</body>
</html>
