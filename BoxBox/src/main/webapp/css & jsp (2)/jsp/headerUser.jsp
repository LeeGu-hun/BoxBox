<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<link rel = "stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/headerUser.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoxBox</title>
</head>
<div class="headerUser">
	<div class="logo">
		BOX<br>
		BOX
	</div>
	<div class="menuUser">
		<ul>
			<li onClick="location.href='rentalOrder.jsp'">
				보관함/물품 렌탈 예약					
			</li>
			<li onClick="location.href='rentalCancel.jsp'">
				예약한 렌탈 취소
			</li>
			<li onClick="location.href='rentalReturnExtra.jsp'">
				사용 중인 렌탈 반납/연장
			</li>
			<li onClick="location.href='changeInfoForm.jsp'">
				내 정보 수정
			</li>
		</ul>
	</div>
	<div class="userName">
		OOO님 환영합니다.<br>
		<input type="button" class="btn btn-large btn-primary btn-block" value="로그아웃" />
	</div>
</div>
</body>
</html>
